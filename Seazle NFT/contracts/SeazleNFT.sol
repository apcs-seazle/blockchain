// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SeazleNFT is Ownable,ERC721
{
    uint public mintPrice = 0.01 ether;
    uint public totalSupply ;
    uint public maxSupply;
    bool public isMintEnable;
    uint public myTotal =0;
    address public user;
    mapping(address=>uint256) public mintWallets;

    constructor ()  ERC721("Seazle NFT"," SeazleNFT")
    {
        maxSupply=5;
        user = msg.sender;
    }

    function toggleIsMintEnabled() external onlyOwner
    {
        isMintEnable = !isMintEnable;
    }

    function setMaxSupply(uint _maxSupply) external onlyOwner
    {
        maxSupply=_maxSupply;
    }

    function mint() external payable
    {
        require(isMintEnable,"minting not enabled");
        require(mintWallets[msg.sender] <1 ,"exceeds max");
        require(msg.value == 0.01 ether,"Dont enough value");
        require(maxSupply > totalSupply, "sold out");

        mintWallets[msg.sender] ++;
        totalSupply +=1;
        _safeMint(msg.sender,totalSupply);
    } 
}