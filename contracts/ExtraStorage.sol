// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {

    function deleteAtIndex(uint256) public override {
        // add override to override the function 
        // add virtual in parent class
    }
}