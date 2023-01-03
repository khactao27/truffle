// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Person {
    event Echo(string message);

    function echo(string calldata message) external {
        emit Echo(message);
    }
}
