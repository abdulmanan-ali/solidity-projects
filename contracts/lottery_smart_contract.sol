// SPDX-License-Identifier: MIT

pragma solidity >0.8.15;

contract Lottery {
    address public manager;
    address payable[] public participants;

    constructor() {
        manager = msg.sender;
    }

    receive() external payable {
        if (msg.value >= 1 ether) {
            participants.push(payable(msg.sender));
        } else {
            revert(
                "Transection is not successful Beacause you are sending less than 1 eth "
            );
        }
    }

    function getBalance() public view returns (uint) {
        require(msg.sender == manager);
        return address(this).balance;
    }

    function selectRandomParticipants() public view returns (uint) {
        return
            uint(
                keccak256(
                    abi.encodePacked(
                        block.prevrandao,
                        block.timestamp,
                        participants.length
                    )
                )
            );
    }

    function slectWinner() public {
        require(msg.sender == manager);
        require(participants.length >= 3);
        uint variableForRandom = selectRandomParticipants();
        address payable winner;
        uint index = variableForRandom % participants.length;
        winner = participants[index];
        winner.transfer(getBalance());
        participants = new address payable[](0);
    }
}

// ____________________________________________________________________________________________________________

// contract Lottery {
//     address public manager;
//     address payable[] public participants;

//     constructor() {
//         manager = msg.sender;
//     }

//     receive() external payable {
//         require(msg.value > 1 ether);
//         require(
//             msg.value < 1 ether,
//             "Transection is not successful Because you are sending less than 1 eth "
//         );
//         participants.push(payable(msg.sender));
//     }

//     function getBalance() public view returns (uint) {
//         require(msg.sender == manager);
//         return address(this).balance;
//     }

//     function selectRandomParticipants() public view returns (uint) {
//         return
//             uint(
//                 keccak256(
//                     abi.encodePacked(
//                         block.prevrandao,
//                         block.timestamp,
//                         participants.length
//                     )
//                 )
//             );
//     }

//     function slectWinner() public {
//         require(msg.sender == manager);
//         require(participants.length >= 3);
//         uint variableForRandom = selectRandomParticipants();
//         address payable winner;
//         uint index = variableForRandom % participants.length;
//         winner = participants[index];
//         winner.transfer(getBalance());
//         participants = new address payable[](0);
//     }
// }
