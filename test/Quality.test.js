const Quality = artifacts.require("Quality")

require('chai')
  .use(require('chai-as-promised'))
  .should()

contract('Quality', (accounts) => {
  describe('deployment', async() => {
    it('deploys successfully', async() => {
      contract = await Quality.deployed()
      const address = contract.address
      console.log(address)
      assert.notEqual(address, '')
    })
  })
})
