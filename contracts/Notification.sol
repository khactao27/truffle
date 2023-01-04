// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Notification {

    struct Token {
        string deviceType;
        string deviceToken;
        address owner;
    }

    mapping(string => Token) tokens;

    constructor(){

    }

    function register(string memory _hEmail, Token memory _token) external {

    }

    function unregister(string memory _hEmail) external {

    }

    function update(string memory _hEmail, Token memory _token) external {

    }

    function get(string memory _hEmail) external {

    }
}
