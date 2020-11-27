require('dotenv').config();
const HDWalletProvider = require('truffle-hdwallet-provider');
require('dotenv').config();
const HDWalletProvider = require('truffle-hdwallet-provider');
module.exports = {
    networks: {
        ropsten: {
            provider: function() {
                return new HDWalletProvider (
                    process.env.MEMONIC,
                    'https://ropsten.infura.io/${process.env.INFURA_API_KEY}'
                )
            },
            gasPrice: 250000000,
            network_id: 3
        },
              development: {
                  host: "127.0.0.1",
                  port: 8545,
                  network_id: "*" // Match any network id
                },

                
              
        },
    
    solc: {
      optimizer: {
        enabled: true,
        runs: 200
    } } }
