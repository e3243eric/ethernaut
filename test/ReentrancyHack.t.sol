// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ReentrancyHack.sol";

contract ReentrancyHackTest is Test {
    ReentrancyHack public _reentrancyHack;
    address public _targetAddress = 0x43Ef3D96c30022d013819061C2CEf8A636dcBcB2;

    function setUp() public {
        _reentrancyHack = new ReentrancyHack(_targetAddress);
    }

    function testHack() public {
        _reentrancyHack.hack{value: 0.01*1e18}();
        assert(_targetAddress.balance == 0);
    }
}
