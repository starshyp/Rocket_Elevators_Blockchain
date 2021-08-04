// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.7;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract ProjectOffice is ERC721 {

    Components[] public orders;
    mapping(string => bool) _orderExists;
    uint public nbOrder;
    constructor() ERC721("Orders", "OD") {
    }
    
    function placeNewOrder(string memory _order, uint batteries, uint columns, uint elevators, uint floors) public {
        _safeMint(msg.sender, nbOrder);
        _orderExists[_order] = true;
        nbOrder++;
        
        uint totalNbColumns = columns * batteries;
        uint totalNbElevators = elevators * totalNbColumns;
        uint id = nbOrder;
        
            components[id].amountOfShafts = totalNbElevators;
            components[id].amountOfControllers = batteries;
            components[id].amountOfDoors = totalNbElevators;
            components[id].amountOfButtons = floors * totalNbElevators;
            components[id].amountOfDisplays = totalNbElevators;
        
        orders.push(Components(components[id].amountOfShafts, components[id].amountOfControllers, components[id].amountOfDoors, components[id].amountOfButtons, components[id].amountOfDisplays));
        
    }
    uint256 public elevatorShafts = 0;
    uint256 public controllers = 0;
    uint256 public doors = 0;
    uint256 public buttons = 0;
    uint256 public displays = 0;

    struct Components {

        uint256 amountOfShafts;
        uint256 amountOfControllers;
        uint256 amountOfDoors;
        uint256 amountOfButtons;
        uint256 amountOfDisplays;

    }

    mapping(uint => Components) public components;
    

    function contractAddress() public view returns(address) {
        return address(this);
    }

}
