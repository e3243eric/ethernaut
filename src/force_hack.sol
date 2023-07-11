// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Forced{
    constructor () payable {
        selfdestruct(payable(0xe942CbA7181e0E18aE8074591789A356392CB4F8));
    }
}
