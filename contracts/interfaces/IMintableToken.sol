// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

interface ITokenMint {
    function mint(address beneficiary, uint256 tokenAmount) external returns (uint256);
}