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
    // describe('deployment', async() => {
    //     it ('deploys successfully', async () => {
    //         const address = contract.address
    //         assert.notEqual(address, 0x0)
    //         assert.notEqual(address, '')
    //         assert.notEqual(address, null)
    //         assert.notEqual(address, undefined)
    //     })

    //     it ('has a name', async() =>{
    //         const name = await contract.name()
    //         assert.equal(name, 'SolutionManufacturing')
    //     })

    //     it ('has a symbol', async() =>{
    //         const symbol = await contract.symbol()
    //         assert.equal(symbol, 'SM')
    //     })
    // })

    // describe("calculatedDoors", async () => {
    //     before("using accounts[0]", async () => {
    //         await contract.addingDoors(5, 1, 2, 6, 2);
    //     });
    //     it("calcul doors base on input", async () => {
    //         const doors = await contract.calculatedDoors(5);
    //         console.log(doors);
    //         assert(doors);
    //     });
    // })

    // describe("calculatedController", async () => {
    //     before("using accounts[0]", async () => {
    //         await contract.addingController(1, 2, 6, 2);
    //     });
    //     it("calcul controller base on input", async () => {
    //         const controller = await contract.calculatedController(5);
    //         console.log(controller);
    //         assert(controller);
    //     });
    // })

    // describe("calculatedControlPanel", async () => {
    //     before("using accounts[0]", async () => {
    //         await contract.addingControlPanel(1, 2, 2);
    //     });
    //     it("calcul controlPanel base on input", async () => {
    //         const controlPanel = await contract.calculatedControlPanel(5);
    //         console.log(controlPanel);
    //         assert(controlPanel);
    //     });
    // })

    // describe("calculatedCallSign", async () => {
    //     before("using accounts[0]", async () => {
    //         await contract.addingCallSign(1, 2, 2);
    //     });
    //     it("calcul callSign base on input", async () => {
    //         const callSign = await contract.calculatedCallSign(5);
    //         console.log(callSign);
    //         assert(callSign);
    //     });
    // })

    // describe('minting', async () =>{
    //     it ('creates door', async() =>{
    //         const result = await contract.mintDoor('111')
    //         const totalSupply = await contract.totalSupply()
    //         assert.equal(totalSupply , 1 )
    //         const event = result.logs[0].args
    //         assert.equal(event.tokenId.toNumber(), 1, 'id is currect' )
    //         console.log(result)
    //     })
    // })

    describe('minting', async () =>{
        it ('creates door', async() =>{
            const result = await contract.mintDoor( 1, 2, 6, 2)
            // const totalSupply = await contract.totalSupply
            // assert.equal(totalSupply, 1)
            // assert(mintDoor)
            console.log(result)
        })
    })
})  

