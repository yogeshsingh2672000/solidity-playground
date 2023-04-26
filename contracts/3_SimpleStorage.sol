// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage {
    uint256 public hiddenValue = 0;
    User public userData;
    uint256[] public arr;

    // kind of an object in contracts
    struct User {
        address user;
        uint256 value;
    }

    event NewUser(address user); // log format
    event newValue(uint256 value); // log format

    function setValue(uint256 _value) public {
        hiddenValue = _value;
        userData = User({user: msg.sender, value: _value});
        arr.push(_value);

        emit NewUser(msg.sender); // loging
        emit newValue(hiddenValue); //loging
    }
}
