// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SolutionManufacturing is ERC721 {
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

    // function addingDoors(
    //     uint256 id,
    //     uint256 nbOfAluminumBars,
    //     uint256 nbOfStainlessSheets,
    //     uint256 nbOfSprings,
    //     uint256 nbOfSensors
    // ) public {
    //     for (uint256 i = 0; i < doors.length; i++) {
    //         doors[doors.length].id = doorId;
    //         doors[doors.length].nbOfAluminumBars = nbOfAluminumBars;
    //         doors[doors.length].nbOfStainlessSheets = nbOfStainlessSheets;
    //         doors[doors.length].nbOfSprings = nbOfSprings;
    //         doors[doors.length ].nbOfSensors = nbOfSensors;
    //         doorId++;
    //     }
    // }
    // function calculatedDoors(uint256 id)
    // public
    // view
    // returns (
    //     uint256,
    //     uint256,
    //     uint256,
    //     uint256,
    //     uint256
    // )
    // {
    //     for (uint256 i = 0; i < doors.length; i++) {
    //         if (doors[i].id == id) {
    //             return (
    //                 doors[i].id,
    //                 doors[i].nbOfAluminumBars,
    //                 doors[i].nbOfStainlessSheets,
    //                 doors[i].nbOfSprings,
    //                 doors[i].nbOfSensors
    //             );
    //         }
    //     }
    // }

    // function addingController(
    //     uint256 nbOfAluminumBars,
    //     uint256 nbOfStainlessSheets,
    //     uint256 nbOfBumpers,
    //     uint256 nbOfLeds
    // ) public {
    //     for (uint256 i = 0; i < controllers.length; i++) {
    //     controllers[controllers.length].id = controllerId;
    //     controllers[controllers.length].nbOfAluminumBars = nbOfAluminumBars;
    //     controllers[controllers.length].nbOfStainlessSheets = nbOfStainlessSheets;
    //     controllers[controllers.length].nbOfBumpers = nbOfBumpers;
    //     controllers[controllers.length].nbOfLeds = nbOfLeds;
    //     controllerId++;
    //     }
    // }
    // function calculatedController(uint256 id)
    // public
    // view
    // returns (
    //     uint256,
    //     uint256,
    //     uint256,
    //     uint256
    // )
    // {
    //     for (uint256 i = 0; i < controllers.length; i++) {
    //         if (controllers[i].id == id) {
    //             return (
    //                 controllers[i].id,
    //                 controllers[i].nbOfAluminumBars,
    //                 controllers[i].nbOfStainlessSheets,
    //                 controllers[i].nbOfLeds
    //             );
    //         }
    //     }
    // }

    // function addingControlPanel(
    //     uint256 nbOfAluminumBars,
    //     uint256 nbOfStainlessSheets,
    //     uint256 nbOfLeds
    // ) public {
    //     for (uint256 i = 0; i < controlPanels.length; i++) {
    //         controlPanels[controlPanels.length].id = controlPanelId;
    //         controlPanels[controlPanels.length].nbOfAluminumBars = nbOfAluminumBars;
    //         controlPanels[controlPanels.length].nbOfStainlessSheets = nbOfStainlessSheets;
    //         controlPanels[controlPanels.length].nbOfLeds = nbOfLeds;
    //         controlPanelId++;
    //     }
    // }

    // function calculatedControlPanel(uint256 id)
    // public
    // view
    // returns (
    //     uint256,
    //     uint256,
    //     uint256,
    //     uint256
    // )
    // {
    //     for (uint256 i = 0; i < controlPanels.length; i++) {
    //         if (controlPanels[i].id == id) {
    //             return (
    //                controlPanels[i].id,
    //                controlPanels[i].nbOfAluminumBars,
    //                controlPanels[i].nbOfStainlessSheets,
    //                controlPanels[i].nbOfLeds
    //             );
    //         }
    //     }
    // }

    // function addingCallSign(
    //     uint256 nbOfAluminumBars,
    //     uint256 nbOfStainlessSheets,
    //     uint256 nbOfLeds
    // ) public {
    //     for (uint256 i = 0; i < callSigns.length; i++) {
    //         callSigns[callSigns.length].id = callSignId;
    //         callSigns[callSigns.length].nbOfAluminumBars = nbOfAluminumBars;
    //         callSigns[callSigns.length].nbOfStainlessSheets = nbOfStainlessSheets;
    //         callSigns[callSigns.length].nbOfLeds = nbOfLeds;
    //         callSignId++;
    //     }
    // }

    // function calculatedCallSign(uint256 id)
    // public
    // view
    // returns (
    //     uint256,
    //     uint256,
    //     uint256,
    //     uint256
    // )
    // {
    //     for (uint256 i = 0; i < callSigns.length; i++) {
    //         if (callSigns[i].id == id) {
    //             return (
    //                callSigns[i].id,
    //                callSigns[i].nbOfAluminumBars,
    //                callSigns[i].nbOfStainlessSheets,
    //                callSigns[i].nbOfLeds
    //             );
    //         }
    //     }
    // }

    Door[] public solutionDoors;
    Controller[] public solutionControllers;
    ControlPanel[] public solutionControlPaneles;
    CallSign[] public solutionCallSigns;

    mapping(uint => Door ) door;
    mapping(uint => Controller ) controller;
    mapping(uint => ControlPanel ) controlPanel;
    mapping(uint => CallSign ) callSign;

    // string[] public doors ;
    // mapping(string => bool) doorsExists;

    function mintDoor ( uint alumBars1, uint steelSheets1, uint springs1, uint sensors1) public {
        // require(!doorsExists[_door]);
        uint id = solutionDoors.length;
        id +=1 ;
        // doorsExists[_door] = true;
        _mint(msg.sender, id);

        // uint256 varNbOfAluminumBars;
        // uint256 varNbOfStainlessSheets;
        // uint256 varNbOfSprings;
        // uint256 varNbOfSensors;
        // uint256 varNbOfBumpers;
        // uint256 varNbOfLeds;

        // for (uint256 i = 0; i < doors.length; i++) {
        // solutionDoors[id].nbOfAluminumBars = varNbOfAluminumBars;
        // solutionDoors[id].nbOfStainlessSheets = varNbOfStainlessSheets;
        // solutionDoors[id].nbOfSprings = varNbOfSprings;
        // solutionDoors[id].nbOfSensors = varNbOfSensors;
        // }
        solutionDoors.push(Door(door[id].nbOfAluminumBars,door[id].nbOfStainlessSheets,door[id].nbOfSprings,door[id].nbOfSensors));
        // doors.push(_door);
    }

    function mintController ( uint alumBars2, uint steelSheets2, uint rubberBands2, uint displays2) public {
        uint id = solutionControllers.length;
        id +=1 ;
        _mint(msg.sender, id);

        solutionControllers.push(Controller(controller[id].nbOfAluminumBars,controller[id].nbOfStainlessSheets,controller[id].nbOfBumpers,controller[id].nbOfLeds));
    }

    function mintControlPanel ( uint alumBars3, uint steelSheets3, uint rubberBands3, uint displays3) public {
        uint id = solutionControlPaneles.length;
        id +=1 ;
        _mint(msg.sender, id);

        solutionControlPaneles.push(ControlPanel(controlPanel[id].nbOfAluminumBars,controlPanel[id].nbOfStainlessSheets,controlPanel[id].nbOfBumpers,controlPanel[id].nbOfLeds));
    }

     function mintCallSign ( uint alumBars4, uint steelSheets4, uint rubberBands4, uint displays4) public {
        uint id = solutionCallSigns.length;
        id +=1 ;
        _mint(msg.sender, id);

        solutionCallSigns.push(CallSign(callSign[id].nbOfAluminumBars,callSign[id].nbOfStainlessSheets,callSign[id].nbOfBumpers,callSign[id].nbOfLeds));
    }

    function contractAddress() public view returns(address) {
        return address(this);
    }

    // function calculatedD0ors(uint256 id) public view returns (uint256, uint256, uint256, uint256 )
    // {
    //     for (uint256 i = 0; i < doors.length; i++) {
    //         if (doors[i].id == id) {
    //             return (
    //                 doors[i].id,
    //                 doors[i].nbOfAluminumBars,
    //                 doors[i].nbOfStainlessSheets,
    //                 doors[i].nbOfSprings,
    //                 doors[i].nbOfSensors
    //             );
    //         }
    //     }
    // }

}
