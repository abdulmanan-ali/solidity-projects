require("dotenv").config();
const ALCHEMY_API_KEY = process.env.ALCHEMY_API_KEY;
const { createAlchemyWeb3 } = require("@alch/alchemy-web3");
const web3 = createAlchemyWeb3(ALCHEMY_API_KEY);

const contract = require("../artifacts/contracts/MyNFT.sol/MyToken.json")

console.log(JSON.stringify(contract.abi));