// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SaprissaCentenoCollection is
    ERC721,
    ERC721URIStorage,
    ERC721Enumerable,
    Ownable
{
    uint256 public constant MAX_SUPPLY = 150;
    uint256 private _currentTokenId = 0;

    constructor(
        address initialOwner
    ) ERC721("SaprissaCentenoCollection", "CENTENO") Ownable(initialOwner) {
    }

    modifier onlyOwnerOrApproved() {
        require(
            msg.sender == owner() || isApprovedForAll(owner(), msg.sender),
            "Caller is not owner nor approved"
        );
        _;
    }

    function setApprovalForAll(address operator, bool approved) public override(ERC721, IERC721) onlyOwner {
        super.setApprovalForAll(operator, approved);
    }

    function mint(string memory _tokenURI) external onlyOwnerOrApproved {
        require(_currentTokenId < MAX_SUPPLY, "Max supply reached");
        _currentTokenId++;
        _mint(msg.sender, _currentTokenId);
        _setTokenURI(_currentTokenId, _tokenURI);
    }

    // Override required by Solidity for ERC721
    function _burn(uint256 tokenId) internal override(ERC721) {
        super._burn(tokenId);
    }

    // Override required by Solidity for ERC721, and ERC721URIStorage
    function tokenURI(
        uint256 tokenId
    ) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    // Override required by Solidity for ERC721 and ERC721Enumerable
    function _increaseBalance(
        address account,
        uint128 amount
    ) internal override(ERC721, ERC721Enumerable) {
        super._increaseBalance(account, amount);
    }

    // Override required by Solidity for ERC721 and ERC721Enumerable
    function _update(
        address to,
        uint256 tokenId,
        address auth
    )
        internal
        override(ERC721, ERC721Enumerable)
        returns (address)
    {
        super._update(to, tokenId, auth);
    }

    // Override required by Solidity for ERC721 and ERC721Enumerable
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
}
