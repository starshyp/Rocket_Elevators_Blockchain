pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
// import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";
contract SolutionManufacturing is ERC721{

    constructor() ERC721 ('SolutionManufacturing' , 'SM') {

    }
}
