// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Greeting {
    string public name;
    string public greetingPrefix = "hello ";

    constructor(string memory initialName) {
        name = initialName;
    }

    function setName(string memory newName) public {
        name = newName;
    }

    // public = visibility, view = state mutability, funciton returns type
    function getGreeting() public view returns (string memory) {
        return string(abi.encodePacked(greetingPrefix, name));
    }
}
