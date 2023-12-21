// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "./IERC20.sol";

interface IFeeToken is IERC20 {
    function calculateTransferTaxes(address _from, uint256 _value) external view returns (uint256 adjustedValue, uint256 taxAmount);
}