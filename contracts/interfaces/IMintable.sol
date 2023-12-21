// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "./IERC20.sol";

interface IMintable is IERC20 {
    function mint(address to, uint256 amount) external returns (bool);
    function destroy(uint256 amount) external returns (bool);
}