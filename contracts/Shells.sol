pragma solidity ^0.5.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20Pausable.sol";

contract Shells is ERC20, ERC20Detailed, ERC20Burnable, ERC20Pausable {
  uint public INITIAL_SUPPLY = 1000000;  // If you want this dynamic from truffle migrations move it to constructor

  constructor(string memory _name, string memory _symbol)
    // (name, symbol, decimal places)
    // (looked weird in wallets when we use decimal.))
    ERC20Detailed(_name, _symbol, 0) public {
    _mint(msg.sender, INITIAL_SUPPLY);
  }
}

// Seems that "_mint" will not be available after initial deploy, so if we want it to, add here.
