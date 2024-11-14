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

    function withdraw() public {
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            amountFundedByEachFunder[funder] = 0;
        }
        funders = new address[](0);
        //transfer 
        //msg.sender = address
        //payable(msg.sender) = payable adress
        // payable(msg.sender).transfer(address(this).balance);
        //send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");
        //call
        (bool callSuccess, ) = payable(msg.sender).call{value : address(this).balance}("");
        require(callSuccess,"Call failed");

    }

   
}