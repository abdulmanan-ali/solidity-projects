// SPDX-License-Identifier: MIT

pragma solidity >0.8.16;

contract EventContract {
    struct Event {
        address organizer;
        string name;
        uint date;
        uint price;
        uint ticketCount;
        uint ticketRemain;
    }

    mapping(uint => Event) public events;
    mapping(address => mapping(uint => uint)) public tickets;
    uint public nextID;

    function createEvent(
        string memory _name,
        uint _date,
        uint _price,
        uint _ticketCount
    ) public {
        require(
            _date > block.timestamp,
            "You can organize event only for future date "
        );
        require(
            _ticketCount > 0,
            "You can organize event only when you your tickets greater than 0 "
        );

        events[nextID] = Event(
            msg.sender,
            _name,
            _date,
            _price,
            _ticketCount,
            _ticketCount
        );
        nextID++;
    }

    function buyTicket(uint id, uint quantity) public payable {
        require(events[id].date != 0, "Event doesn't exist ");
        require(
            events[id].date > block.timestamp,
            "Event has already occured "
        );
        Event storage _event = events[id];
        require(msg.value == (_event.price * quantity), "Ether is not enough ");
        require(_event.ticketRemain >= quantity, "Not Enough Tickets ");
        _event.ticketRemain -= quantity;
        tickets[msg.sender][id] += quantity;
    }

    function transferTicket(address to, uint quantity, uint id) public {
        require(events[id].date != 0, "Event doesn't exist ");
        require(
            events[id].date > block.timestamp,
            "Event has already occured "
        );
        require(
            tickets[msg.sender][id] >= quantity,
            "You don't have enough tickets to send "
        );
        tickets[to][id] += quantity;
        tickets[msg.sender][id] -= quantity;
    }
}
