// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "../interfaces/IERC1155Receiver.sol";

import "./ERC165.sol";

abstract contract ERC1155Receiver is ERC165, IERC1155Receiver {
    constructor() {
        _registerInterface(
            ERC1155Receiver(0).onERC1155Received.selector ^
            ERC1155Receiver(0).onERC1155BatchReceived.selector
        );
    }
}
