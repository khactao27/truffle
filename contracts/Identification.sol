// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Identification {

    event register(string _name);

    address ownerAddr;
    address spareAddr;

    struct DefaultClaim {
        string nick;
        string email;
        string gender;
        string birthdate;
        string website;
        string locale;
    }

    DefaultClaim defaultClaim;

    mapping(string => string) claims;

    constructor(address _spareAddr){
        ownerAddr = msg.sender;
        spareAddr = _spareAddr;
    }

    modifier onlyOwner() {
        require(msg.sender == ownerAddr, "You're not owner of This Profile");
        _;
    }

    function updateDefaultClaim(string memory _name, string memory _value) external onlyOwner {

    }

    function upsert(string memory _name, string memory _value) external onlyOwner {
        claims[_name] = _value;
    }

    function deleteClaim(string memory _name) external onlyOwner {
        delete claims[_name];
    }

    function getClaim(string memory _name) external onlyOwner returns(string) {
        return claims[_name];
    }
}
