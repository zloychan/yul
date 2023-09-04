// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;


contract ExampleYul {
    function something() external pure returns(uint256) {
        uint a;
        assembly {
            a := 4
        }
        return a;
    }
}