// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface IStaticNFTCollection {
    function transferFrom(address from, address to, uint256 tokenId) external;
}

contract MafiSaprissaCentenoCollection is
    ERC721,
    ERC721URIStorage,
    ERC721Enumerable,
    Ownable
{
    address public staticNFTCollection;
    mapping(address => bool) public affiliates;
    uint256 private _nextTokenId;

    constructor(
        address initialOwner,
        address _staticNFTCollection
    )
        ERC721("MafiSaprissaCentenoCollection", "CENTENOQR")
        Ownable(initialOwner)
    {
        staticNFTCollection = _staticNFTCollection;
    }

    modifier onlyAffiliate() {
        require(affiliates[msg.sender], "Caller is not an affiliate");
        _;
    }

    function addAffiliate(address affiliate) external onlyOwner {
        affiliates[affiliate] = true;
    }

    function removeAffiliate(address affiliate) external onlyOwner {
        affiliates[affiliate] = false;
    }

    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    function attribute(
        address affiliate,
        uint256 staticTokenId
    ) external onlyAffiliate {
        require(affiliates[affiliate], "Affiliate not recognized");

        // Transfer the corresponding NFT from StaticNFTCollection
        IStaticNFTCollection(staticNFTCollection).transferFrom(
            owner(),
            msg.sender,
            staticTokenId
        );
    }

    // Override required by Solidity for ERC721
    function _burn(
        uint256 tokenId
    ) internal override(ERC721) {
        super._burn(tokenId);
    }

    // Override required by Solidity for ERC721, ERC721URIStorage, and ERC721Enumerable
    function tokenURI(
        uint256 tokenId
    ) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    // Override required by Solidity for ERC721, ERC721URIStorage and ERC721Enumerable
    function supportsInterface(
        bytes4 interfaceId
    ) public view override(ERC721, ERC721URIStorage, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
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
}
