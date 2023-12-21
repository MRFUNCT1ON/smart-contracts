// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "../cores/ERC721.sol";

import "../utils/Pausable.sol";

abstract contract ERC721Pausable is ERC721, Pausable {
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override {
        super._beforeTokenTransfer(from, to, tokenId);

        require(!paused(), "ERC721Pausable: token transfer while paused");
    }
}