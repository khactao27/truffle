// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Identification {
    event Register(string _email, string _name, string _gender, address ownerAddr);
    event Upsert(string _email, string _claim);

    address ownerAddr;
    address spareAddr;

    struct DefaultClaim {
        string nick;
        string fullName;
        string email;
        uint gender;
        string birthdate;
        string website;
        string locale;
        string location;
    }

    DefaultClaim defaultClaim;

    mapping(string => string) claims;

    constructor(
        address _spareAddr,
        string memory _nick,
        string memory _fullName,
        string memory _email,
        uint _gender,
        string memory _birthdate,
        string memory _website,
        string memory _locale,
        string memory _location,
        string[] memory _claimKeys,
        string[] memory _claimValues) {

        ownerAddr = msg.sender;
        spareAddr = _spareAddr;

        defaultClaim.nick = _nick;
        defaultClaim.fullName = _fullName;
        defaultClaim.email = _email;
        defaultClaim.gender = _gender;
        defaultClaim.birthdate = _birthdate;
        defaultClaim.website = _website;
        defaultClaim.locale = _locale;
        defaultClaim.location = _location;

        for(uint i = 0; i <_claimKeys.length; i++) {
            claims[_claimKeys[i]] = _claimValues[i];
        }
    }

    modifier onlyOwner() {
        require(msg.sender == ownerAddr, "You're not owner of This Profile");
        _;
    }

    function updateDefaultClaim(
        string memory _nick,
        string memory _fullName,
        string memory _email,
        uint _gender,
        string memory _birthdate,
        string memory _website,
        string memory _locale,
        string memory _location) external onlyOwner {
        defaultClaim.nick = _nick;
        defaultClaim.fullName = _fullName;
        defaultClaim.email = _email;
        defaultClaim.gender = _gender;
        defaultClaim.birthdate = _birthdate;
        defaultClaim.website = _website;
        defaultClaim.locale = _locale;
        defaultClaim.location = _location;
    }

    function upsert(string memory _name, string memory _value) external onlyOwner {
        claims[_name] = _value;
    }

    function updateClaims(
        string[] memory _claimKeyDels,
        string[] memory _claimKeys,
        string[] memory _claimValues) external onlyOwner {
        for(uint i = 0; i < _claimKeyDels.length; i++) {
            delete claims[_claimKeyDels[i]];
        }
        for(uint i = 0; i < _claimKeys.length; i++) {
            claims[_claimKeys[i]] = _claimValues[i];
        }
    }

    function deleteClaim(string memory _name) external onlyOwner {
        delete claims[_name];
    }

    function getClaim(string memory _name) public view returns (string memory) {
        return claims[_name];
    }

    function getClaims(string[] memory _claimKeys) public view returns (string[] memory values) {
        string[] memory vals = new string[](_claimKeys.length);
        for (uint i = 0; i < _claimKeys.length; i++) {
            vals[i] = claims[_claimKeys[i]];
        }
        return vals;
    }

    function getDefaultClaim() public view
    returns (
        string memory nick,
        string memory fullName,
        string memory email,
        uint gender,
        string memory birthdate,
        string memory website,
        string memory locale,
        string memory location
    ) {
        return (
        defaultClaim.nick,
        defaultClaim.fullName,
        defaultClaim.email,
        defaultClaim.gender,
        defaultClaim.birthdate,
        defaultClaim.website,
        defaultClaim.locale,
        defaultClaim.location
        );
    }
}