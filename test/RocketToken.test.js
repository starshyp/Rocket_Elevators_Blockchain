const RocketToken = artifacts.require("RocketToken")

contract("RocketToken", (accounts) => {
  console.log(accounts)
  before(async () => {
    rocket = await RocketToken.deployed()
  })

  it("provides token owner 1M tokens", async () => {
    let balance = await rocket.balanceOf(accounts[0])
    console.log("Balance: " + web3.utils.fromWei(balance))
    balance = web3.utils.fromWei(balance)
    assert.equal(balance, '1000000', "Balance should be 1M for contract creator")
  })

  it('can transfer tokens between accounts', async () => {
    let amount = web3.utils.toWei('1000', 'ether')
    await rocket.transfer(accounts[1], amount, { from: accounts[0] })

    let balance = await rocket.balanceOf(accounts[1])
    balance = web3.utils.fromWei(balance, 'ether')
    console.log("Balance: " + web3.utils.fromWei(balance))
    assert.equal(balance, '1000', "Balance should be 1K for contract creator")
  })

})
