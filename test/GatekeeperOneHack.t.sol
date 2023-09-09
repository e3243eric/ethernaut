// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/GatekeeperOneHack.sol";

contract GatekeeperOneHackTest is Test {
    GatekeeperOneHack public _gatekeeperOneHack;
    address _targetAddress = 0x8D099B6FAd75C9D63718D90947E69b3c52419A27;

    function setUp() public {
        _gatekeeperOneHack = new GatekeeperOneHack(_targetAddress, 41211);
    }

    function testHack() public {
        _gatekeeperOneHack.hack();
        assert(IGatekeeperOne(_targetAddress).entrant() == address(tx.origin));
    }
}
