// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "../interfaces/IERC1820Implementer.sol";

contract ERC1820Implementer is IERC1820Implementer {
    bytes32 constant private _ERC1820_ACCEPT_MAGIC = keccak256(abi.encodePacked("ERC1820_ACCEPT_MAGIC"));

    mapping(bytes32 => mapping(address => bool)) private _supportedInterfaces;

    function canImplementInterfaceForAddress(bytes32 interfaceHash, address account) public view override returns (bytes32) {
        return _supportedInterfaces[interfaceHash][account] ? _ERC1820_ACCEPT_MAGIC : bytes32(0x00);
    }

    function _registerInterfaceForAddress(bytes32 interfaceHash, address account) internal virtual {
        _supportedInterfaces[interfaceHash][account] = true;
    }
}