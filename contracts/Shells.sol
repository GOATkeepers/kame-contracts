pragma solidity ^0.5.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20Pausable.sol";

contract Shells is ERC20, ERC20Detailed, ERC20Burnable, ERC20Pausable {
  constructor(string memory _name, string memory _symbol, uint memory _supply)
    // (name, symbol, decimal places)
    // (looked weird in wallets when we use decimal.))
    ERC20Detailed(_name, _symbol, 0) public {
    _mint(msg.sender, _supply);
  }
}
