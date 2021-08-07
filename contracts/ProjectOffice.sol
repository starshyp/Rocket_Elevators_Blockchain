// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.7;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract ProjectOffice is Ownable, ERC721 {

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
    // string[] public orders;
    // mapping(string => bool) _orderExists;
    uint public nbOrder = 0;

    function placeNewOrder(uint batteries, uint columns, uint elevators, uint floors) public {
        _mint(msg.sender, nbOrder);
        // _orderExists[_order] = true;
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
        // orders.push(_order);
    }
    function get(uint256 number) external onlyOwner view returns (uint256 amountOfShafts, uint256 amountOfControllers, uint256 amountOfDoors, uint256 amountOfButtons, uint256 amountOfDisplays) {
        require(_exists(number), "token not minted");
        Components memory allcomponents = ordersComponents[number];
        amountOfShafts = allcomponents.amountOfShafts;
        amountOfControllers = allcomponents.amountOfControllers;
        amountOfDoors = allcomponents.amountOfDoors;
        amountOfButtons = allcomponents.amountOfButtons;
        amountOfDisplays = allcomponents.amountOfDisplays;
    }

    function contractAddress() public view returns(address) {
        return address(this);
    }

}
