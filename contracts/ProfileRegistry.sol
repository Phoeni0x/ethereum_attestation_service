// SPDX-License-Identifier: UNLICENSED 
pragma solidity ^0.8.18;

import "./Profile.sol";
import "hardhat/console.sol";

contract ProfileRegistry {

    // EOA address => Profile contract address
    mapping(address => address) profilesByEOA;
    // Twitter uid => Profile contract address
    mapping(uint256 => address) profilesByUID;
    
    event NewProfile(uint256, address);

    // TODO: controlled by owner ...
    constructor() {

    }

    function profileExists(uint256 uid, address eoa) external returns (address) {
        address profile = profilesByEOA[eoa];
        if (address(0) != profile) {
            return profile;
        }
        profile = profilesByUID[uid];
        if (address(0) != profile) {
            return profile;
        }
        address createdProfile = createNewProfile(uid, eoa);
        return createdProfile;
    }

    function createNewProfile(uint256 uid, address eoa) private returns (address) {
        require (0 < uid || address(0) != eoa, "Missing Profile creation arguments");
        Profile newProfile = new Profile(uid, eoa);
        profilesByEOA[eoa] = address(newProfile);
        profilesByUID[uid] = address(newProfile);
        emit NewProfile(uid, eoa);
        return address(newProfile);
    }

}