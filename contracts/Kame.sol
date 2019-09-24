pragma solidity ^0.5.0;

import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721Full.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721Mintable.sol";
import "../node_modules/@openzeppelin/contracts/ownership/Ownable.sol";

contract Kame is ERC721Full, ERC721Mintable, Ownable {
  struct Kora {
    bytes32 metadata;
    address minter;
    bool mainnetLock;
  }

  Kora[] public kora;
  address _v2Contract = address(0);

  constructor (string memory name, string memory symbol) public ERC721Full(name, symbol) {
      // initialize Kora[]
      Kora memory nullKora = Kora({
        metadata: bytes32(0),
        minter: msg.sender,
        mainnetLock: false
      });
      mint(msg.sender, 0);
      kora.push(nullKora);
    }

  // KORA
  /* @dev this section handles logic for minting Kora. It also has wrappers for intrinsic
    ERC721 functions that are provided by the imported OpenZeppelin libraries. */
  function mintKora (bytes32 metadata) public returns(bool, uint256) {
    address minter = msg.sender;
    uint256 newTokenId = kora.length;
    Kora memory newKora = Kora({
      metadata: metadata,
      minter: minter,
      mainnetLock: false
    });
    if (mint(minter, newTokenId) == true) {
      kora.push(newKora);
      return (true, newTokenId);
    } else return (false, 0);
  }

  function getTokenById (uint256 id) public view returns(bytes32, address, bool) {
    Kora memory k = kora[id];
    return(k.metadata, k.minter, k.mainnetLock);
  }

  function tokensOfOwner(address owner) public view returns (uint256[] memory) {
    return _tokensOfOwner(owner);
  }

  /* @dev When a user intends to make a Kora available on a secondary market, we want
    our side chain to treat it as having been exported from the Kame service. */
  function lockToMainnet (uint256 id) public onlyOwner returns(bool) {
    if (kora[id].mainnetLock = true) {
      return true;
    } else {
      kora[id].mainnetLock = true;
      return true;
    }
  }

  // Contracts
  struct ReserveIssueContracts {
    address reserveIssueContract;
    uint256 reserveIssueContractId;
    uint8 reserveIssueContractClass;
  }

  function updateContract (address v2Contract) public onlyOwner {
    _v2Contract = v2Contract;
    emit emitV2Contract(_v2Contract);
  }

  event emitV2Contract (address indexed v2Contract);

  function () external payable {}
}
