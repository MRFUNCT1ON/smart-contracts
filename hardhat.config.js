require("@nomicfoundation/hardhat-toolbox");
require("@nomicfoundation/hardhat-verify");

const tdly = require("@tenderly/hardhat-tenderly");

dotenv = require("dotenv");

dotenv.config();

tdly.setup();

const accounts = [
  process.env.PRIVATE_KEY
]

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.7.6",
  networks: {
    avalanche: {
      url: `https://avalanche-c-chain.publicnode.com`,
      accounts: accounts
    },
    base: {
      url: `https://base.llamarpc.com`,
      accounts: accounts
    },
    cronos: {
      url: `https://1rpc.io/cro`,
      accounts: accounts
    },
    ethereum: {
      url: `https://eth.merkle.io`,
      accounts: accounts
    },
    fantom: {
      url: `https://fantom.publicnode.com`,
      accounts: accounts
    },
    harmony: {
      url: `https://1rpc.io/one`,
      accounts: accounts
    },
    optimism: {
      url: `https://optimism.llamarpc.com`,
      accounts: accounts
    },
    polygon: {
      url: `https://polygon.llamarpc.com`,
      accounts: accounts
    },
    pulsechain: {
      url: `https://pulsechain.publicnode.com`,
      accounts: accounts
    },
    smartChain: {
      url: `https://binance.llamarpc.com`,
      accounts: accounts
    },
    xdai: {
      url: `https://1rpc.io/gnosis`,
      accounts: accounts
    },
    devnet: {
      url: `https://rpc.vnet.tenderly.co/devnet/mydevnet/926d2dc4-9418-4729-bb48-8cd4cf8dc9dd`,
      accounts: accounts
    }
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY
  },
  sourcify: {
    enabled: process.env.SOURCIFY_ENABLED
  },
  tenderly: {
    username: process.env.TENDERLY_USERNAME, // tenderly username (or organization name)
    project: process.env.TENDERLY_PROJECT, // tenderly project name
    privateVerification: false
  }
};
