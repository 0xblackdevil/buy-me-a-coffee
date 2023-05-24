const BuyCoffeeContract = artifacts.require("BuyMeACoffee");

contract("BuyContractTest", function (accounts) {
  
  // get contract deployed
  it("should deploy successfully", async function () {
    await BuyCoffeeContract.deployed();
    return assert.isTrue(true);
  })

  // can send amount to contract
  it("should receive amount", async function () {
    const contract = await BuyCoffeeContract.deployed();
    const amount = 1;
    await contract.buyCoffee("0xblackdevil", "great work", { value: amount, from: accounts[0] });
    const balance = await web3.eth.getBalance(contract.address);
    assert.equal(balance, amount);
  });

  // view contract balance 
  it("should view contract balance", async function () {
    const contract = await BuyCoffeeContract.deployed();
    const balance = await contract.getBalance();
    assert.equal(balance, 1);
  });

});
