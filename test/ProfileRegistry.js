const { expect } = require("chai");

describe("ProfileRegistry contract", function () {
    const ZERO_ADDRESS = "0x0000000000000000000000000000000000000000";
    const VALID_TWITTER_UID = 1; // any > 0
    const VALID_EOA = "0x1e3de6aE412cA218FD2ae3379750388D414532dc"; // any != 0x0

    it("Deployment should revert searching for empty profile", async function () {
        const registry = await ethers.deployContract("ProfileRegistry");
        await registry.waitForDeployment();
        await expect(registry.profileExists(0, ZERO_ADDRESS))
            .to.be.revertedWith("Missing Profile creation arguments");    
    });
    
    it("Deployment should create new profile", async function () {
        const registry = await ethers.deployContract("ProfileRegistry");
        await registry.waitForDeployment();
        await expect(registry.profileExists(VALID_TWITTER_UID, VALID_EOA))
            .to.emit(registry, "NewProfile")
            .withArgs(VALID_TWITTER_UID, VALID_EOA);
    });

});  