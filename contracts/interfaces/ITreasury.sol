// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

interface ITreasury {
    function withdraw(address token_addr, uint256 _amount) external;
}