// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Notification {

    event Register(string _hEmail);
    event UnRegister(string _hEmail);
    event Update(string _hEmail);

    struct Token {
        string deviceType;
        string deviceToken;
        address owner;
    }

    mapping(string => Token) tokens;

    constructor(){}

    function register(string memory _hEmail, string memory _deviceType, string memory _deviceToken) external {
        Token memory token = Token (
            _deviceType,
            _deviceToken,
            msg.sender
        );

        tokens[_hEmail] = token;
        emit Register(_hEmail);
    }

    function unregister(string memory _hEmail) external {
        Token memory token = tokens[_hEmail];
        require(msg.sender == token.owner, "You can't not unregister this token.");
        delete tokens[_hEmail];

        emit UnRegister(_hEmail);
    }

    function update(string memory _hEmail, string memory _deviceType, string memory _deviceToken) external {
        Token storage token = tokens[_hEmail];
        require(token.owner == token.owner, "You can't update this token, You're not own this token.");
        token.deviceType = _deviceType;
        token.deviceToken = _deviceToken;
        emit Update(_hEmail);
    }

    function get(string memory _hEmail) external view
    returns (
        string memory,
        string memory,
        address
    ) {
        Token memory token = tokens[_hEmail];
        // require(msg.sender == token.owner, "You can't get this token");

        return (
        token.deviceType,
        token.deviceToken,
        token.owner
        );
    }
}
