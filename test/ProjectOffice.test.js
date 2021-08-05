const ProjectOffice = artifacts.require("ProjectOffice");

contract('ProjectOffice', (accounts) => {
    let projectOffice;
    let client;

    before(async () => {
        projectOffice = await ProjectOffice.deployed();
    });

    it('deploys successfully', async () => {
        const address = await projectOffice.address
        assert.notEqual(address, 0x0)
        assert.notEqual(address, '')
        assert.notEqual(address, null)
        assert.notEqual(address, undefined)
    });
    describe('minting', async () => {
        it('creates a new token', async () => {
            const result = await projectOffice.placeNewOrder('Test', 1, 2, 4, 5)
            // const totalSupply = await projectOffice.totalSupply()
            //Success
            console.log(result);
            const event = result.logs[0].args
            console.log(event);
            assert.equal(event.tokenId.toNumber(), 1, 'id is correct')
            assert.equal(event.from, '0x0000000000000000000000000000000000000000', 'from is correct')
            assert.equal(event.to, accounts[0], 'to is correct')
            //Failure
            // return expect(await projectOffice.mint('Test').should.be.rejected);
        })
    })

    it("can fetch the address of the client by order", async () => {
        client = await projectOffice.contractAddress();
        assert.equal(client, projectOffice.address, "The client of the order should be the first account.");
    });
});