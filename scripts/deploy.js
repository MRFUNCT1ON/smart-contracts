import { ethers, tenderly } from "hardhat";

async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);

    const token = await ethers.deployContract("Token");

    console.log("Token address:", await token.getAddress());

    await tenderly.verify({
        name: "Token",
        address: token.getAddress(),
        libraries: {}
    });

    console.log("Token verified on Tenderly");
}

main().then(() => process.exit(0)).catch((error) => {
    console.error(error);
    process.exit(1);
});