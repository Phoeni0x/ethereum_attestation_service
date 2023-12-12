const { expect } = require("chai");

describe("Profile contract", function () {
    const ZERO_ADDRESS = "0x0000000000000000000000000000000000000000";

  it("Profile - should not emit NewProfile", async function () {
    const [owner] = await ethers.getSigners();

    // TODO: test creation is only accepted via Registry.
    // const profile = await expect(ethers.deployContract("Profile", 0, ZERO_ADDRESS)).to.not.emit();
    
  });


});