// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

interface IERC1820Registry {

    function setManager(address account, address newManager) external;
    function setInterfaceImplementer(address account, bytes32 _setInterfaceHash, address implementer) external;

    function getManager(address account) external view returns (address);
    function getInterfaceImplementer(address account, bytes32 _getInterfaceHash) external view returns (address);

    function interfaceHash(string calldata interfaceName) external pure returns (bytes32);

    function updateERC165Cache(address account, bytes4 interfaceId) external;

    function implementsERC165Interface(address account, bytes4 interfaceId) external view returns (bool);
    function implementsERC165InterfaceNoCache(address account, bytes4 interfaceId) external view returns (bool);

    event InterfaceImplementerSet(address indexed account, bytes32 indexed interfaceHash, address indexed implementer);
    event ManagerChanged(address indexed account, address indexed newManager);
}