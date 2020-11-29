var HDWalletProvider = require('truffle-hdwallet-provider');
const MNEMONIC = 'close priority impact punch tone strong attend input ribbon clay cheese record';
const infuraKey = 'bd6b0c6836474fdb83893cccfd522bea';
module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*"
    },
    ropsten: {
      provider: function() {
        return new HDWalletProvider(MNEMONIC, "https://ropsten.infura.io/v3/bd6b0c6836474fdb83893cccfd522bea")
      },
      network_id: 3,
      gasPrice:4000000,   
    },
  },
}