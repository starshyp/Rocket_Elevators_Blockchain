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
      const result = await contract.verifyQuality('10122')
      // const totalSupply = await contract.totalSupply()
      //SUCCESS
      // assert.equal(totalSupply, 1)
      console.log("Result: " + result)
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
      await contract.verifyQuality('10123')
      await contract.verifyQuality('10124')
      await contract.verifyQuality('10125')
    })
  })

})
