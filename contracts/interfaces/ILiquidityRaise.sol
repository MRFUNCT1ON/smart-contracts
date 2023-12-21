// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

interface ILiquidityRaise {
    function contribution(address) external view returns (uint256);
    function referralPoints(address) external view returns (uint256);    
    function totalContribution() external view returns (uint256);
    function totalReferralPoints() external view returns (uint256);
}