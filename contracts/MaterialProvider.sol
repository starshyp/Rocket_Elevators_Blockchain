// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.7;


contract MaterialProvider {

    uint public alumiBars = 0;
    uint public steelSheets = 0;
    uint public rubberBands = 0;
    uint public lightBulbs = 0;
    uint public leds = 0;
    uint public speakersProvider = 0;

struct Materials{
        uint aluminiumBars;
        uint stainlessSteelSheets;
        uint bumperRubberBands;
        uint interiorLightBulbs;
        uint displayLeds;
        uint speakers;
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