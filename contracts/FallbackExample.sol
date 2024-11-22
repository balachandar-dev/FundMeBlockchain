// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallbackExample {
    uint256 public result;

    receive() external payable {
        //when only amount is sent
        result = 1;
     }

     fallback() external payable { 
        //when data is sent
        result = 2;
     }
}