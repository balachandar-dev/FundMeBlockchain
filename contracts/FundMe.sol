// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConvertor.sol";

error NotOwner();

contract FundMe {

    using PriceConvertor for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18;
    address[] public funders;
    mapping (address => uint256) public amountFundedByEachFunder;

    address public immutable i_owner;

    constructor() {
     i_owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversationRate() >= MINIMUM_USD, "Didnt send enough");
        funders.push(msg.sender);
        amountFundedByEachFunder[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner {
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

    modifier onlyOwner() {
        // require(msg.sender == i_owner, "Sender is not owner");
        if(msg.sender != i_owner) { revert NotOwner(); }
        _;
    }
   
}