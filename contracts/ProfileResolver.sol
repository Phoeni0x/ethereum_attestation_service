// SPDX-License-Identifier: UNLICENSED 
pragma solidity ^0.8.18;

import "hardhat/console.sol";

import "./ProfileRegistry.sol";
import "./Profile.sol";

contract ProfileResolver {
    address private immutable profileRegistry;

    // controlled by owner
    constructor (address registry){
        // require not 0x0 ...
        profileRegistry = registry;
    }

    function checkProfileByTwUIDorAddress(uint256 uid, address eoa, bytes calldata data) external returns (bool) {
        address profile = ProfileRegistry(profileRegistry).profileExists(uid, eoa);
        address expectedSigner = Profile(profile).currentAddress();
        return validSignature(expectedSigner, data); // accepts or rejest Approval attestation creation
    }

    function validSignature(address signer, bytes calldata data) private returns (bool) {

        // validate signature using ECDSA.recover 
        return true;
    }
}