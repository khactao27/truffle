// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract ClientManagement {

    struct ClientInfo {
        string name;
        string clientId;
        string pubKey;
        string scopes;
        address clientAddress;
        string url;
    }

    mapping(string => ClientInfo) clients;

    constructor(){

    }

    function register(
        string memory _name,
        string memory _clientID,
        string memory _pubKey,
        string memory _scopes,
        string memory _redirectUrl) {
        address _clientAddr = msg.sender;
        ClientInfo client = ClientInfo(_name, _clientID, _pubKey, _scopes, _clientAddr, _redirectUrl);
    }

    function unregister(string memory _clientID) external {

    }

    function updatePubKey(string memory _newPubKey) external {

    }

    function get(string memory _clientID) external {

    }
}
