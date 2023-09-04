// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
// import {Counter} from "../src/Counter.sol";
import "./lib/YulDeployer.sol";

interface PureYul {}

contract YulTest is Test {
    YulDeployer yulDeployer = new YulDeployer();
    PureYul pureYulContract;


    function setUp() public {
        pureYulContract = PureYul(yulDeployer.deployContract("PureYul"));
    }

    function testPureYul() public {
        bytes memory callDataBytes = abi.encodeWithSignature("myFunc()");

        (bool succes, bytes memory answer) = address(pureYulContract).call{gas: 100000, value: 0}(callDataBytes);
        console2.logBytes(answer);

        // assertTrue(success);
        // assertEq(data, callDataBytes);
    }


}
