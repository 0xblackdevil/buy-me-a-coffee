var BuyCoffeeContract = artifacts.require("BuyMeACoffee");

module.exports = function (deployer) {
  deployer.deploy(BuyCoffeeContract);
};
