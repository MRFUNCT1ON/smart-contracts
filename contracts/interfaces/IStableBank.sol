// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

interface IStableBank {
    function mint(uint256 dollarAmount) external returns (uint256 mintAmount);
    function borrow(uint256 dollarAmount) external returns (bool);
    function settle(uint256 settleAmount) external returns (bool);
    function depositUSD(uint256 dollarAmount) external;
}