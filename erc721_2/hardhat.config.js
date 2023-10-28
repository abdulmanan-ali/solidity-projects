require("@nomicfoundation/hardhat-toolbox");
// Go to https://alchemy.com, sign up, create a new App in
// its dashboard, and replace "KEY" with its key
const ALCHEMY_API_KEY = "https://eth-sepolia.g.alchemy.com/v2/v3q2McTGqdMGPCoit0jKF0SnjMoZ3OXD";

// Replace this private key with your Sepolia account private key
// To export your private key from Coinbase Wallet, go to
// Settings > Developer Settings > Show private key
// To export your private key from Metamask, open Metamask and
// go to Account Details > Export Private Key
// Beware: NEVER put real Ether into testing accounts
const SEPOLIA_PRIVATE_KEY = "e8e09a91a0415e8702175a3e7355e46f683b99de5e7ec8b156806d4c47259639";

module.exports = {
  solidity: "0.8.19",
  networks: {
    sepolia: {
      url: `${ALCHEMY_API_KEY}`,
      accounts: [SEPOLIA_PRIVATE_KEY]
    }
  },
  etherscan: {
    apiKey: "T7QH7DDUZAH6XCJ79DG7R1JPU91DBXGG45",
  },
}; 

//__________________________________________________________________

// deploy on ganache
// require("@nomiclabs/hardhat-ethers");
// require("@nomiclabs/hardhat-ganache");

// module.exports = {
//   solidity: "0.8.19",
//   networks: {
//     ganache: {
//       url: "http://127.0.0.1:7545",
//       chainId: 1337,
//     },
//   },
// };

//_______________________________________________________________

// infura hardhat configuration

/* require("@nomicfoundation/hardhat-toolbox");

// Go to https://infura.io, sign up, create a new API key
// in its dashboard, and replace "KEY" with it
const INFURA_API_KEY = "https://sepolia.infura.io/v3/c46b2e4d9f6e48f0aabde1aa47257019";

// Replace this private key with your Sepolia account private key
// To export your private key from Coinbase Wallet, go to
// Settings > Developer Settings > Show private key
// To export your private key from Metamask, open Metamask and
// go to Account Details > Export Private Key
// Beware: NEVER put real Ether into testing accounts
const SEPOLIA_PRIVATE_KEY = "e8e09a91a0415e8702175a3e7355e46f683b99de5e7ec8b156806d4c47259639";

module.exports = {
  solidity: "0.8.19",
  networks: {
    sepolia: {
      url: `https://sepolia.infura.io/v3/${INFURA_API_KEY}`,
      accounts: [SEPOLIA_PRIVATE_KEY]
    }
  }
};*/

// _________________________________________________________________________
// require("dotenv").config;
// const { ALCHEMY_API_KEY, SEPOLIA_PRIVATE_KEY } = process.env;

// module.exports = {
//   solidity: "0.8.19",
//   defaultnetworks: "sepolia",
//   networks: {
//     hardhat: {},
//     sepolia: {
//       url: ALCHEMY_API_KEY,
//       accounts: [SEPOLIA_PRIVATE_KEY]
//     }
//   }
// };