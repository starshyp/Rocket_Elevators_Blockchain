const SolutionManufacturing = artifacts.require("./SolutionManufacturing.sol");

contract('SolutionManufacturing ', (accounts) => {
    let contract

    before(async() =>{
        contract = await SolutionManufacturing.deployed()
    })
  
    describe('doorminting', async () =>{
        it ('creates door', async() =>{
            const result = await contract.mintDoor( 1, 2, 6, 2)
           
            console.log(result)
        })
    })

    describe('controllerminting', async () =>{
        it ('creates door', async() =>{
            const result = await contract.mintController( 1, 2, 6, 2)
            console.log(result)
        })
    })

    describe('controle panel minting', async () =>{
        it ('creates door', async() =>{
            const result = await contract.mintControlPanel( 1, 2, 6, 2)
            console.log(result)
        })
    })

    describe('call sign ', async () =>{
        it ('creates door', async() =>{
            const result = await contract.mintCallSign( 1, 2, 6, 2)
            console.log(result)
        })
    })
})  

