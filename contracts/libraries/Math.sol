// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

library Math {
    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a >= b ? a : b;
    }

    function min(uint x, uint y) internal pure returns (uint z) {
        z = x < y ? x : y;
    }

    function abs(uint x, uint y) internal pure returns (uint) {
        return x >= y ? x - y : y - x;
    }

    function sqrt(uint y) internal pure returns (uint z) {
        if (y > 3) {
            z = y;
            uint x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
    }

    function average(uint256 a, uint256 b) internal pure returns (uint256) {
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}