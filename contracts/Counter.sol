// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    uint8 public counter = 0;

    function incrementCounter() public {
        counter++;
    }

    function decrementCounter() public {
        counter--;
    }
}
