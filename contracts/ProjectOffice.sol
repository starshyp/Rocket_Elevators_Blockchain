// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.7;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract ProjectOffice is ERC721 {

    constructor() ERC721("Orders", "OD") {
    }
    struct Components {

        uint256 amountOfShafts;
        uint256 amountOfControllers;
        uint256 amountOfDoors;
        uint256 amountOfButtons;
        uint256 amountOfDisplays;

    }

    mapping(uint => Components) public components;


    Components[] public ordersComponents;
    string[] public orders;
    mapping(string => bool) _orderExists;
    uint public nbOrder = 1;

    function placeNewOrder(string memory _order, uint batteries, uint columns, uint elevators, uint floors) public {
        _mint(msg.sender, nbOrder);
        _orderExists[_order] = true;
        nbOrder += 1;

        uint totalNbColumns = columns * batteries;
        uint totalNbElevators = elevators * totalNbColumns;
        uint id = nbOrder;

            components[id].amountOfShafts = totalNbElevators;
            components[id].amountOfControllers = batteries;
            components[id].amountOfDoors = totalNbElevators;
            components[id].amountOfButtons = floors * totalNbElevators;
            components[id].amountOfDisplays = totalNbElevators;

        ordersComponents.push(Components(components[id].amountOfShafts, components[id].amountOfControllers, components[id].amountOfDoors, components[id].amountOfButtons, components[id].amountOfDisplays));
        orders.push(_order);
    }

    function contractAddress() public view returns(address) {
        return address(this);
    }

}
