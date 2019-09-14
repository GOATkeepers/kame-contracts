pragma solidity ^0.5.0;

import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721Full.sol";

contract Kame is ERC721Full {
  constructor (string memory name, string memory symbol) public ERC721Full(name, symbol) {
      // solhint-disable-previous-line no-empty-blocks
    }

  struct Kora {
    bytes32 metadata;
    address minter;
    bool mainnetLock;
  }

  // mint
  // burn
  // register admin
  // register minter
  // buy
  // transfer
}