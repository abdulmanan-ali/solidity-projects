// SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

contract CrowdFunding {
    mapping(address => uint) public contributors;
    address public manager;
    uint public minimumContributions;
    uint public deadline;
    uint public target;
    uint public raiseAmount;
    uint public noOfContributors;
    struct Request {
        string description;
        address payable recipient;
        uint value;
        bool completed;
        uint noOfVotors;
        mapping(address => bool) votors;
    }
    mapping(uint => Request) public requests;
    uint public numRequests;

    constructor(uint _target, uint _deadline) {
        target = _target;
        deadline = block.timestamp + _deadline;
        minimumContributions = 100 wei;
        manager = msg.sender;
    }

    function SendEth() public payable {
        require(block.timestamp < deadline, "Deadline has passed");
        require(
            msg.value >= minimumContributions,
            "Minimum Contribution is not met"
        );
        if (contributors[msg.sender] == 0) {
            noOfContributors++;
        }
        contributors[msg.sender] += msg.value;
        raiseAmount += msg.value;
    }

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

    function refund() public {
        require(
            block.timestamp > deadline && raiseAmount < target,
            "You are not eligible for refund"
        );
        require(contributors[msg.sender] > 0);
        address payable user = payable(msg.sender);
        user.transfer(contributors[msg.sender]);
        contributors[msg.sender] = 0;
    }

    modifier onlyManager() {
        require(
            msg.sender == manager,
            "only manager can call the createRequest & make payment functions"
        );
        _;
    }

    function createRequest(
        string memory _description,
        address payable _recipient,
        uint _value
    ) public onlyManager {
        Request storage newRequest = requests[numRequests];
        numRequests++;
        newRequest.description = _description;
        newRequest.recipient = _recipient;
        newRequest.value = _value;
        newRequest.completed = false;
        newRequest.noOfVotors = 0;
    }

    function voteRequest(uint _requestNo) public {
        require(contributors[msg.sender] > 0, "You must be contributor");
        Request storage thisRequest = requests[_requestNo];
        require(thisRequest.votors[msg.sender] == false, "You have already voted");
        thisRequest.votors[msg.sender] = true;
        thisRequest.noOfVotors++;

    }

    function makePayment(uint _requestNo) public onlyManager{
        require(raiseAmount >= target);
        Request storage thisRequest = requests[_requestNo];
        require(thisRequest.completed == false, "The request has been completed");
        require(thisRequest.noOfVotors > noOfContributors / 2, "Majority doesn't support");
        thisRequest.recipient.transfer(thisRequest.value);
        thisRequest.completed = true;
    }
}
