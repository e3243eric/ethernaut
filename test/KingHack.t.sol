// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/KingHack.sol";

contract KingHackTest is Test {
    KingHack public kingHack;
    address public king = 0x5b8Ae1BD73B9e5084154e0920bb86dB09db0138a;

    function setUp() public {
        kingHack = new KingHack();
    }

    function testHack() public {
        kingHack.hack{value: 1e18}(king);
        assert(IKing(king)._king() == address(kingHack));

        king.call{value: 1e20}("");
        assert(IKing(king)._king() == address(kingHack));

    }
}
