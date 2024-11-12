// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConvertor {
     function getPrice() internal view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int price,,,) = priceFeed.latestRoundData();
        return  uint256(1e18 * price);
    }

    function getConversationRate(uint256 ethAmount) internal view returns(uint256) {
         uint256 ethPrice = getPrice();
         uint256 ethValueInUSD = (ethAmount * ethPrice) / 1e18;
         return ethValueInUSD;
    }
}