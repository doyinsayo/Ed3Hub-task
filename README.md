NFT certificate smart contract 

# Education Certificate NFT Contract
A secure smart contract implementation for issuing non-transferable educational certificates on Ethereum blockchain.


## Overview
This contract implements a soulbound NFT certificate system that allows educational platforms to mint unique, non-transferable certificates to students upon course completion.


## Features
- ERC721 compliant NFT implementation
- Non-transferable (soulbound) certificates
- Platform-only minting permissions
- Course ID tracking per certificate
- Reentrancy protection
- Gas-efficient token distribution mechanism


## Security Measures
- OpenZeppelin's ReentrancyGuard implementation
- Checks-Effects-Interactions pattern enforcement
- Pull payment pattern for token rewards
- Access control through platform ownership
- Comprehensive state validation
