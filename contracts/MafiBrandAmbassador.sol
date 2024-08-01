// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

interface ISaprissaCentenoCollection {
    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) external;
}

contract MafiBrandAmbassador is Ownable {
    address public saprissaCentenoCollection;
    mapping(address => bool) public affiliates;
    mapping(address => mapping(uint256 => uint256)) public attribution;
    uint256 public price;

    event Purchase(
        address indexed buyer,
        uint256 indexed tokenId,
        address indexed affiliate,
        uint256 amount
    );

    constructor(
        address _initialOwner,
        address _saprissaCentenoCollection,
        uint256 _price
    ) Ownable(_initialOwner) {
        saprissaCentenoCollection = _saprissaCentenoCollection;
        price = _price;
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

    function purchase(
        address affiliate,
        uint256 tokenId,
        uint256 amount
    ) external payable {
        require(affiliates[affiliate], "Affiliate not recognized");
        require(msg.value >= price, "Insufficient payment");

        // Transfer the corresponding NFT from SaprissaCentenoCollection to the buyer
        ISaprissaCentenoCollection(saprissaCentenoCollection).safeTransferFrom(
            owner(),
            msg.sender,
            tokenId,
            amount,
            ""
        );

        // Attribute the token to the affiliate
        attribution[affiliate][tokenId] = attribution[affiliate][tokenId] + 1;

        emit Purchase(msg.sender, tokenId, affiliate, msg.value);
    }

    function withdraw() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function setPrice(uint256 newPrice) external onlyOwner {
        price = newPrice;
    }
}
