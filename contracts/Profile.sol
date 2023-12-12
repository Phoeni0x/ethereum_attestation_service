// SPDX-License-Identifier: UNLICENSED 
pragma solidity ^0.8.18;

import "hardhat/console.sol";

contract Profile {

    uint256 public twitterUid;
    address public currentAddress;
    mapping(address => bool) delegatedAddresses;


    constructor(uint256 uid, address eoa) {
        if (0 < uid || address(0) != eoa) {
            twitterUid = uid;
            currentAddress = eoa;
            delegatedAddresses[eoa] = true;
        }
    }

}