// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
// const hre = require("ethers");

async function main() {
  // const [deployer] = await ethers.getSigners();
  const MyNFT = await ethers.getContractFactory("MyNFT")
  const myNFT = await MyNFT.deploy();
  console.log("Contract deployed to address", myNFT.target);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  })
// const MyNFT = require("../contracts/MyNFT.sol");

// async function main() {
//   const deployer = await ethers.getSigners()[0];

//   const factory = new ethers.ContractFactory(MyNFT.abi, MyNFT.bytecode, deployer);
//   const contract = await factory.deploy();

//   console.log("Contract deployed to address:", contract.address);
// }

// main()
//   .then(() => process.exit(0))
//   .catch((error) => {
//     console.error(error);
//     process.exit(1);
//   });
