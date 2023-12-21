// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "./IERC20.sol";

interface ITokensRecoverable {
    function recoverTokens(IERC20 token) external;
}