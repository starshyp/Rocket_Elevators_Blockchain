const SolutionManufacturing = artifacts.require("./SolutionManufacturing.sol");
// var chai = require('chai');

// require('chai')
//     .use(require('chai-as-promised'))
//     .should()

contract('SolutionManufacturing ', (accounts) => {
    let contract

    before(async() =>{
        contract = await SolutionManufacturing.deployed()
    })
  
    describe('minting', async () =>{
        it ('creates door', async() =>{
            const result = await contract.mintDoor( 1, 2, 6, 2)
           
            console.log(result)
        })
    })
})  

