// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ElevatorHack.sol";

contract ElevatorHackTest is Test {
    ElevatorHack public _elevatorHack;
    address _targetAddress = 0xA3B95BE293E56cbF7e24dE525AB08D2de511D461;

    function setUp() public {
        _elevatorHack = new ElevatorHack(_targetAddress);
    }

    function testHack() public {
        _elevatorHack.hack();
        assert(IElevator(_targetAddress).top() == true);
    }
}
