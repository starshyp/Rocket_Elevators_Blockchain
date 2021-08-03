// ref: https://www.trufflesuite.com/guides/using-infura-custom-provider

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  
// ropsten: {
//   provider: () => new HDWalletProvider(mnemonic, 'https://ropsten.infura.io/v3/<PROJECT_ID>'),
//   network_id: 3,
//   gas: 5500000,
//   confirmation: 2,
//   timeoutBlocks: 200,
//   skipDryRun: true
// },

compilers: {
  solc: {
    version: "^0.8.0",
    optimizer: {
      enabled: true,
      runs: 200
    }
  },
},

  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
    develop: {
      port: 8545
    }
  }
};
