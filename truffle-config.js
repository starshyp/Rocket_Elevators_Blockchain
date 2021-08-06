// ref: https://www.trufflesuite.com/guides/using-infura-custom-provider
const HDWalletProvider = require("@truffle/hdwallet-provider");
// const fs = require('fs');
// const mnemonic = fs.readFileSync(".secret").toString().trim();
// const mnemonic = "";

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!

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
    ropsten: {
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/2567e17a5daf42c2ad55a5255fbae5e8")
      },
      network_id: 3,
      // gas: 5500000,
      // confirmation: 2,
      // timeoutBlocks: 200,
      // skipDryRun: true
    },
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
