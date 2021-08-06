// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SolutionManufacturing is ERC721 {

    address[] public forms;

    constructor() ERC721 ('SolutionManufacturing' , 'SM') {
    }

    struct Door {
        uint256 nbOfAluminumBars;
        uint256 nbOfStainlessSheets;
        uint256 nbOfSprings;
        uint256 nbOfSensors;
    }
     struct Controller {
        uint256 nbOfAluminumBars;
        uint256 nbOfStainlessSheets;
        uint256 nbOfBumpers;
        uint256 nbOfLeds;
    }

    struct ControlPanel {
        uint256 nbOfAluminumBars;
        uint256 nbOfStainlessSheets;
        uint256 nbOfBumpers;
        uint256 nbOfLeds;
    }

    struct CallSign {
        uint256 nbOfAluminumBars;
        uint256 nbOfStainlessSheets;
        uint256 nbOfBumpers;
        uint256 nbOfLeds;
    }

    Door[] public solutionDoors;
    Controller[] public solutionControllers;
    ControlPanel[] public solutionControlPaneles;
    CallSign[] public solutionCallSigns;

    mapping(uint => Door ) door;
    mapping(uint => Controller ) controller;
    mapping(uint => ControlPanel ) controlPanel;
    mapping(uint => CallSign ) callSign;

    function mintDoor ( uint256 alumBars1, uint256 steelSheets1, uint256 springs1, uint256 sensors1) public {
       
        forms.push(msg.sender);

        solutionDoors.push(Door(alumBars1, steelSheets1, springs1, sensors1));
    }

    function mintController ( uint256 alumBars2, uint256 steelSheets2, uint256 rubberBands2, uint256 displays2) public {
   
        forms.push(msg.sender);

        solutionControllers.push(Controller( alumBars2,  steelSheets2,  rubberBands2,  displays2));
    } 

    function mintControlPanel ( uint256 alumBars3, uint256 steelSheets3, uint256 rubberBands3, uint256 displays3) public {
     
        forms.push(msg.sender);

        solutionControlPaneles.push(ControlPanel( alumBars3,  steelSheets3,  rubberBands3,  displays3));
    }

    function mintCallSign ( uint256 alumBars4, uint256 steelSheets4, uint256 rubberBands4, uint256 displays4) public {
        uint id = solutionCallSigns.length;
        
        forms[id] = msg.sender;

        solutionCallSigns.push(CallSign( alumBars4, steelSheets4, rubberBands4, displays4));
    }
    
    function contractAddress() public view returns(address[] memory) {
        return forms;
    }

}
