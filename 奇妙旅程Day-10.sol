// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "erc721a/contracts/ERC721A.sol";

contract Hello is Ownable, ERC721A {
    string public metadataUri;

    constructor() ERC721A("Hello World", "Hello") {}

    function mint(uint256 quantity) external payable {        
        _safeMint(msg.sender, quantity);
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(
            _exists(_tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );

        return metadataUri;
    }

    function setMetadataUri(string memory _metadataUri) external onlyOwner
    {
        metadataUri = _metadataUri;
    }
}