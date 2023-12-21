// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "../libraries/Address.sol";
import "../libraries/SafeMath.sol";

import "../utils/Ownable.sol";

contract Escrow is Ownable {
    using SafeMath for uint256;
    using Address for address payable;

    event Deposited(address indexed payee, uint256 weiAmount);
    event Withdrawn(address indexed payee, uint256 weiAmount);

    mapping(address => uint256) private _deposits;

    function depositsOf(address payee) public view returns (uint256) {
        return _deposits[payee];
    }

    function deposit(address payee) public virtual payable onlyOwner {
        uint256 amount = msg.value;
        _deposits[payee] = _deposits[payee].add(amount);

        emit Deposited(payee, amount);
    }

    function withdraw(address payable payee) public virtual onlyOwner {
        uint256 payment = _deposits[payee];

        _deposits[payee] = 0;
        payee.sendValue(payment);

        emit Withdrawn(payee, payment);
    }
}