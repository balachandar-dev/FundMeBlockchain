// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConvertor.sol";

contract FundMe {

    using PriceConvertor for uint256;

    uint256 public minimumUsd = 50 * 1e18;
    address[] public funders;
    mapping (address => uint256) public amountFundedByEachFunder;


    function fund() public payable {
        require(msg.value.getConversationRate() >= minimumUsd, "Didnt send enough");
        funders.push(msg.sender);
        amountFundedByEachFunder[msg.sender] = msg.value;
    }

   
}