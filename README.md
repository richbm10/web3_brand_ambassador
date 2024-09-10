MAFI - Introducing the Web3 Brand Ambassador

Team:
Kenneth Walker: 0x8A7Bb4Bd34c3E6906EfbCd3515551c0F4658e80f
Ricardo Bonilla: 0x9E17D83De550DFD4585632E725fD92E72b9C3f4a
Oscar Astua: 0x7Bd09a8Ec7411Ca0C2Da67eD5797eb08e01Ab0a1
Joseph Poveda: 0x0b25521dFa86D6dda99eDbd65f383ED6051891a6

Problem:
There is a lack of transparency in conversions and attribution between multiple marketing parties, leading to mistrust and ineffective tracking of results across various marketing channels.

Solution:
Utilize the security and decentralization of the Optimism L2 Blockchain to transparently record and audit attributions and conversions of Brand Ambassadors in Affiliate Marketing campaigns. This creates a transparent network accessible to any party, enhancing trust and tracking efficiency.

Project Overview:
Mafi is a Web3 Affiliate Marketing solution that mirrors the goals of traditional web2 affiliate marketing but leverages the Optimism blockchain for transparent conversion tracking. Our solution involves three key roles: Client Brand Manager, Brand Ambassador, and Customer.

Platform Implementation:

1. Client Brand Manager:
  - Create Affiliate Marketing campaigns.
  - Include Brand Ambassadors from our platform’s network.
  - Validate the MVP using account abstraction by creating a web3 wallet to minimize barriers to entry.
2. Brand Ambassador:
  - Access the Mafi platform to send affiliate requests or respond to client requests.
  - Authenticate by connecting their web3 wallet to our platform.
3. Campaign Process:
  - Once a campaign reaches the minimum number of affiliates, it is submitted to the blockchain.
  - We use an ERC1155 NFT collection and the MafiBrandAmbassador contract to track conversions and affiliates.
  - Each Brand Ambassador receives a unique deep link to share across marketing channels, attributing sales to their efforts.
4. Customer Interaction:
  - Customers click on the link, download the Mafi mobile app, authenticate, and purchase the NFT.
  - The purchase involves the MafiBrandAmbassador contract, splitting the payment: 5% commission to the Brand Ambassador, the remainder to Mafi.

Benefits:

Public, decentralized records of conversions and attributions.
A global ranking system for Brand Ambassadors based on performance.

MafiBrandAmbassador
https://sepolia-optimism.etherscan.io/address/0xe59cd0252a9b5298779ca53bcc6dba19d1662a6f
SaprissaCentenoCollection
https://sepolia-optimism.etherscan.io/address/0xa192E5EFa6372B91cc04Bc31FC001a309D6adfd1

Video explanation:
https://www.youtube.com/watch?v=BrHR9xDJc1o

# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.ts
```
