// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";

contract SaprissaCentenoCollection is
    ERC721,
    ERC721URIStorage,
    ERC721Enumerable,
    Ownable,
    ERC721Pausable,
    ERC721Burnable
{
    uint256 public constant MAX_SUPPLY = 150;
    uint256 private _currentTokenId = 0;

    constructor(
        address initialOwner,
        string[] memory tokenURIs
    ) ERC721("SaprissaCentenoCollection", "CENTENO") Ownable(initialOwner) {
        require(tokenURIs.length <= MAX_SUPPLY, "Too many URIs");

        for (uint256 i = 0; i < tokenURIs.length; i++) {
            _safeMint(initialOwner, _currentTokenId);
            _setTokenURI(_currentTokenId, tokenURIs[i]);
            _currentTokenId++;
        }
    }

    modifier onlyOwnerOrApproved() {
        require(
            msg.sender == owner() || isApprovedForAll(owner(), msg.sender),
            "Caller is not owner nor approved"
        );
        _;
    }

    function setApprovalForAll(
        address operator,
        bool approved
    ) public override(ERC721, IERC721) onlyOwner {
        super.setApprovalForAll(operator, approved);
    }

    function tokenURI(
        uint256 tokenId
    ) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    function _increaseBalance(
        address account,
        uint128 amount
    ) internal override(ERC721, ERC721Enumerable) {
        super._increaseBalance(account, amount);
    }

    // The following functions are overrides required by Solidity.

    function _update(
        address to,
        uint256 tokenId,
        address auth
    )
        internal
        override(ERC721, ERC721Enumerable, ERC721Pausable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function supportsInterface(
        bytes4 interfaceId
    )
        public
        view
        override(ERC721, ERC721Enumerable, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://mafi.onelink.com/ja33";
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }
}
