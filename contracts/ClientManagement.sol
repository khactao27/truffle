// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract ClientManagement {

    event Register(string _clientId);

    struct ClientInfo {
        string name;
        string clientId;
        string pubKey;
        string scopes;
        address clientAddress;
        string url;
    }

    mapping(string => ClientInfo) clients;

    constructor(){}

    function register(
        string memory _name,
        string memory _clientID,
        string memory _pubKey,
        string memory _scopes,
        string memory _redirectUrl) external {
        address _clientAddr = msg.sender;
        ClientInfo memory client = ClientInfo(_name, _clientID, _pubKey, _scopes, _clientAddr, _redirectUrl);
        clients[_clientID] = client;
        emit Register(_clientID);
    }

    function unregister(string memory _clientID) external {
        delete clients[_clientID];
    }

    function updatePubKey(string memory _clientID, string memory _newPubKey) external view {
        ClientInfo memory client = clients[_clientID];
        client.pubKey = _newPubKey;
    }

    function get(string memory _clientID) external view returns(ClientInfo memory) {
        return clients[_clientID];
    }
}