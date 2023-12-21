// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

interface ILiquidityRaiseDistributor {
    function distributionComplete() external view returns (bool);
    function vestingPeriodStartTime() external view returns (uint256); 
    function vestingPeriodEndTime() external view returns (uint256);
    
    function distribute() external;        
    function claim(address account) external returns (uint256);
    function claimReferralRewards(address account, uint256 referralShare) external;
}