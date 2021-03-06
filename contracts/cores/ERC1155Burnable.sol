// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "./ERC1155.sol";

abstract contract ERC1155Burnable is ERC1155 {
    function burn(address account, uint256 id, uint256 value) public virtual {
        require(account == _msgSender() || isApprovedForAll(account, _msgSender()), "ERC1155: caller is not owner nor approved");
        _burn(account, id, value);
    }

    function burnBatch(address account, uint256[] memory ids, uint256[] memory values) public virtual {
        require(account == _msgSender() || isApprovedForAll(account, _msgSender()), "ERC1155: caller is not owner nor approved");
        _burnBatch(account, ids, values);
    }
}