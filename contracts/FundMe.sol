// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FundMe {

    uint256 public minimumUsd = 50;

    function fund() public payable {
        require(msg.value > 1e18, "Didnt send enough");
    }
}