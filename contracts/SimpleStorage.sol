// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    uint32 public hiddenValue = 0;

    event NewUser(address user); // log format
    event newValue(uint32 value); // log format

    function setValue(uint32 _value) public {
        hiddenValue = _value;

        emit NewUser(msg.sender); // loging
        emit newValue(hiddenValue); //loging
    }
}
