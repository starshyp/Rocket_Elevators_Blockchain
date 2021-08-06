// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.7;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// contract MaterialProvider is ERC721 {
//     constructor() ERC721("MaterialProvider", "MCO") {
//     }
// }

contract MaterialProvider {

    uint256 public alumiBars = 0;
    uint256 public steelSheets = 0;
    uint256 public rubberBands = 0;
    uint256 public lightBulbs = 0;
    uint256 public leds = 0;
    uint256 public speakersProvider = 0;

struct Materials{
        uint256 aluminiumBars;
        uint256 stainlessSteelSheets;
        uint256 bumperRubberBands;
        uint256 interiorLightBulbs;
        uint256 displayLeds;
        uint256 speakers;
    }

    uint public materialListCount;

    mapping(uint => Materials) public materials;
    Materials[] materialList;

    function createMaterials(uint amountOfShafts, uint amountOfControllers, uint amountOfDoors, uint amountOfButtons, uint amountOfDisplays, uint amountOfSpeakers) 
    public returns (uint,uint,uint,uint,uint,uint){
        Materials memory new_material;
        
        new_material.aluminiumBars = amountOfShafts*4;
        new_material.stainlessSteelSheets = amountOfShafts*6 + amountOfDoors;
        new_material.bumperRubberBands = amountOfDoors*1;
        new_material.interiorLightBulbs = amountOfShafts*8;
        new_material.speakers = amountOfSpeakers *6;
        new_material.displayLeds = amountOfButtons + amountOfDisplays + amountOfControllers ;

        alumiBars = new_material.aluminiumBars;
        steelSheets = new_material.stainlessSteelSheets;
        rubberBands = new_material.bumperRubberBands;
        lightBulbs = new_material.interiorLightBulbs;
        leds = new_material.displayLeds;
        speakersProvider = new_material.speakers;

        materialListCount++;
        materials[materialListCount] = new_material;
        materialList.push(new_material);

        return (new_material.aluminiumBars,new_material.stainlessSteelSheets,new_material.bumperRubberBands,new_material.interiorLightBulbs,new_material.speakers,new_material.displayLeds);

    }

}