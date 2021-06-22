const { expect } = require("chai");

describe("PaymentProcessor", function () {

  before(async function (){
    [owner, ...addrs] = await ethers.getSigners();
    PaymentProcesor = await ethers.getContractFactory("PaymentProcessor");
    Dai = await ethers.getContractFactory("Dai");
    DaiToken = await Dai.deploy()
  })

  beforeEach(async function () {
    PaymentProcesorContract = await PaymentProcesor.deploy(owner.address, DaiToken.address)
  })

  it("Should Initialized correctly", async function() {
    expect(await PaymentProcesorContract.admin()).to.equal(owner.address)
    expect(await PaymentProcesorContract.dai()).to.equal(DaiToken.address)
  })

  it("Should make a payment", async function() {
    await DaiToken.faucet(owner.address,10);

    await DaiToken.approve(owner.address,9)

    await PaymentProcesorContract.pay(8, 1342)

    console.log(PaymentProcessorContract.value)
  })

})