// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Lottery {
    address public owner;
    address payable[] public players;
    uint public lotteryId;
    mapping(uint => address) public lotteryHistory;

    constructor() {
        owner = msg.sender;
        lotteryId = 1;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }

    function getWinnerByLottery(uint lottery) public view returns (address) {
        return lotteryHistory[lottery];
    }

    function enter() public payable {
        require(msg.value > 0.01 ether, "atleast give 0.01 ether");
        // address of players entering lottery
        players.push(payable(msg.sender));
    }

    function getRandomNumber() public view returns (uint) {
        return uint(keccak256(abi.encodePacked(owner, block.timestamp)));
    }

    // onlyOwner = like a single function for all the conditions
    function pickWinner() public onlyOnwer {
        uint index = getRandomNumber() % players.length;
        players[index].transfer(address(this).balance);
        lotteryHistory[lotteryId] = players[index];
        lotteryId += 1;

        // reset the state of the contract
        players = new address payable[](0);
    }

    modifier onlyOnwer() {
        require(msg.sender == owner);
        _;
    }
}
