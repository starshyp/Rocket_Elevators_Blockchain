const Quality = artifacts.require("Quality")

require('chai')
  .use(require('chai-as-promised'))
  .should()

contract('Quality', (accounts) => {
  let contract

  before(async () => {
    contract = await Quality.deployed()
  })

  describe('deployment', async() => {
    it('deploys successfully', async() => {
      contract = await Quality.deployed()
      const address = contract.address
      console.log(address)
      assert.notEqual(address, '')
    })

    it('has a name', async () => {
      const name = await contract.name()
      assert.equal(name, "Quality")
    })

    it('has a symbol', async () => {
      const sym = await contract.symbol()
      assert.equal(sym, "QA")
    })
  })

  describe('minting', async () => {
    it('creates a new token', async () => {
      const result = await contract.verifyQuality('Pass', true, true, true, 4, true)
      // const totalSupply = await contract.totalSupply()
      //SUCCESS
      // assert.equal(totalSupply, 1)
      console.log(result)
      const event = result.logs[0].args
      assert.equal(event.tokenId.toNumber(), 1, 'id is correct')
      assert.equal(event.from, '0x0000000000000000000000000000000000000000', 'from is correct')
      assert.equal(event.to, accounts[0], 'to is correct')

      //FAILURE cannot mint same ID
      // await contract.verifyQuality('10122').should.be.rejected;
    })
  })

  describe('indexing', async () => {
    it('lists verifications', async () => {
      // mint 3 tokens
      await contract.verifyQuality('Pass', true, true, true, 4, true)
      await contract.verifyQuality('Fail', true, true, false, 4, true)
      await contract.verifyQuality('Fail', true, false, true, 4, true)
    })
  })

  describe('functions', async () =>{
      it ('test pass', async() =>{
          const door = await contract.door(true)
          console.log(door)
          const cable = await contract.cable(true)
          console.log(cable)
          const brake = await contract.brake(true)
          console.log(brake)
          const batteryPermit = await contract.batteryPermit(4)
          console.log(batteryPermit)
          const certificate = await contract.certificate(true, true, true, 4)
          console.log(certificate)
      })
  })

})
