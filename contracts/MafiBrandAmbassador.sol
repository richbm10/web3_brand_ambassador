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
        uint256 value,
        uint256 amount
    );

    event Attribution(
        address indexed affiliate,
        uint256 indexed tokenId,
        uint256 value,
        uint256 amount
    );

    event AddedMafiAffiliate(address indexed affiliate);

    event RemovedMafiAffiliate(address indexed affiliate);

    constructor(
        address _initialOwner,
        address _saprissaCentenoCollection,
        uint256 _price
    ) Ownable(_initialOwner) {
        saprissaCentenoCollection = _saprissaCentenoCollection;
        price = _price;
    }

    modifier onlyClient() {
        require(
            affiliates[msg.sender] == false,
            "Caller can not be a Mafi affiliate!"
        );
        require(msg.sender != owner(), "Caller can not be the contract owner!");
        _;
    }

    function addAffiliate(address affiliate) external onlyOwner {
        affiliates[affiliate] = true;

        emit AddedMafiAffiliate(affiliate);
    }

    function removeAffiliate(address affiliate) external onlyOwner {
        affiliates[affiliate] = false;

        emit RemovedMafiAffiliate(affiliate);
    }

    function purchase(
        address affiliate,
        uint256 tokenId,
        uint256 amount
    ) external payable onlyClient {
        require(msg.value >= price, "Insufficient payment");

        if (affiliate != address(0)) {
            require(
                affiliates[affiliate] == true,
                "The Affiliate is not a Brand Ambassador of this Campaign!"
            );
        }

        // Transfer the corresponding NFT from SaprissaCentenoCollection to the buyer
        ISaprissaCentenoCollection(saprissaCentenoCollection).safeTransferFrom(
            owner(),
            msg.sender,
            tokenId,
            amount,
            ""
        );

        emit Purchase(msg.sender, tokenId, msg.value, amount);

        if (affiliate == address(0)) {
            return;
        }

        // Attribute the token to the affiliate
        attribution[affiliate][tokenId] = attribution[affiliate][tokenId] + amount;
        emit Attribution(affiliate, tokenId, msg.value, amount);
    }

    function withdraw() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function setPrice(uint256 newPrice) external onlyOwner {
        price = newPrice;
    }
}
