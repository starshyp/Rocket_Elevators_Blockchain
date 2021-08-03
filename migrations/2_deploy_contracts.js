var RocketToken = artifacts.require("RocketToken");

module.exports = function(deployer) {
  deployer.deploy(RocketToken, 'RocketToken', 'RT');
};

var SolutionManufacturing = artifacts.require("SolutionManufacturing");

module.exports = function(deployer) {
  deployer.deploy(SolutionManufacturing);
};
