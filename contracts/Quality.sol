// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.7;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// contract Quality is ERC721 {
//     constructor() ERC721("RocketToken", "RT") {
//     }
    
//     uint256 public elevatorShafts = 0;
//     uint256 public controllers = 0;
//     uint256 public doors = 0;
//     uint256 public buttons = 0;
//     uint256 public displays = 0;

//     struct Components {

//         uint256 amountOfShafts;
//         uint256 amountOfControllers;
//         uint256 amountOfDoors;
//         uint256 amountOfButtons;
//         uint256 amountOfDisplays;

//     }

//     mapping(uint => Components) public components;
//     uint public nbOrder;

//     function contractAddress() public view returns(address) {
//         return address(this);
//     }

//     function placeOrder(uint batteries, uint columns, uint elevators, uint floors) public returns (uint,uint,uint,uint,uint) {
//         uint id = nbOrder++;
//         uint totalNbColumns = columns * batteries;
//         uint totalNbElevators = elevators * totalNbColumns;

//         components[id].amountOfShafts = totalNbElevators;
//         components[id].amountOfControllers = batteries;
//         components[id].amountOfDoors = totalNbElevators;
//         components[id].amountOfButtons = floors * totalNbElevators;
//         components[id].amountOfDisplays = totalNbElevators;

//         return (components[id].amountOfShafts, components[id].amountOfControllers, components[id].amountOfDoors, components[id].amountOfButtons, components[id].amountOfDisplays);
//     }
// }
