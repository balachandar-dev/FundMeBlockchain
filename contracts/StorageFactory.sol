// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage [] public simpleStorageArray;

    function createSimpleStorageContract() public {
       SimpleStorage simpleStorage = new SimpleStorage();
       simpleStorageArray.push(simpleStorage);
    }

    function sfStorage(uint256 number, string calldata _name, uint256 index) public {
        SimpleStorage simpleStorage = simpleStorageArray[index];
        simpleStorage.addPeople(number, _name);
    }

    function sfGet(uint256 index) public view returns (string memory){
        SimpleStorage simpleStorage = simpleStorageArray[index];
        return simpleStorage.getPersonName(0);
    }
 }