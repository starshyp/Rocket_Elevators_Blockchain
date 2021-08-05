const MaterialProvider = artifacts.require("MaterialProvider");

var RocketToken = artifacts.require("RocketToken");

module.exports = function(deployer) {
  deployer.deploy(RocketToken, 'RocketToken', 'RT');
  deployer.deploy(MaterialProvider);
};
