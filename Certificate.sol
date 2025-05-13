<<<<<<< Updated upstream
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract CertificateNFT is ERC721, Ownable, ReentrancyGuard {
    uint256 private _nextTokenId = 1;
    mapping(uint256 => string) private _courseIds;

    event CertificateMinted(address indexed student, string courseId, uint256 tokenId);

    constructor() ERC721("Education Certificate", "EDUC") {}

    function mintCertificate(address student, string memory courseId)
        external
        onlyOwner
        nonReentrant
        returns (uint256)
    {
        require(student != address(0), "Invalid student address");
        require(bytes(courseId).length > 0, "Invalid course ID");

        uint256 tokenId = _nextTokenId++;
        _mint(student, tokenId);
        _courseIds[tokenId] = courseId;

        emit CertificateMinted(student, courseId, tokenId);
        return tokenId;
    }

    function getCourseId(uint256 tokenId) external view returns (string memory) {
        require(_exists(tokenId), "Token does not exist");
        return _courseIds[tokenId];
    }

    // Soulbound: Disable transfers
    function _update(address to, uint256 tokenId, address auth) internal override returns (address) {
        require(to == address(0) || auth == address(0), "Transfers are disabled for soulbound tokens");
        return super._update(to, tokenId, auth);
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract CertificateNFT is ERC721, Ownable, ReentrancyGuard {
    uint256 private _nextTokenId = 1;
    mapping(uint256 => string) private _courseIds;

    event CertificateMinted(address indexed student, string courseId, uint256 tokenId);

    constructor() ERC721("Education Certificate", "EDUC") {}

    function mintCertificate(address student, string memory courseId)
        external
        onlyOwner
        nonReentrant
        returns (uint256)
    {
        require(student != address(0), "Invalid student address");
        require(bytes(courseId).length > 0, "Invalid course ID");

        uint256 tokenId = _nextTokenId++;
        _mint(student, tokenId);
        _courseIds[tokenId] = courseId;

        emit CertificateMinted(student, courseId, tokenId);
        return tokenId;
    }

    function getCourseId(uint256 tokenId) external view returns (string memory) {
        require(_exists(tokenId), "Token does not exist");
        return _courseIds[tokenId];
    }

    // Soulbound: Disable transfers
    function _update(address to, uint256 tokenId, address auth) internal override returns (address) {
        require(to == address(0) || auth == address(0), "Transfers are disabled for soulbound tokens");
        return super._update(to, tokenId, auth);
    }
}
>>>>>>> Stashed changes
