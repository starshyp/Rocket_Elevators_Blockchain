var RocketToken = artifacts.require("RocketToken");
// var ProjectOffice = artifacts.require("ProjectOffice");
// var MaterialProvider = artifacts.require("MaterialProvider");
// var SolutionManufacturing = artifacts.require("SolutionManufacturing");
// var Quality = artifacts.require("Quality");

module.exports = function(deployer) {
  deployer.deploy(RocketToken, 1000000);
  // deployer.deploy(RocketToken);
};

var SolutionManufacturing = artifacts.require("SolutionManufacturing");

module.exports = function(deployer) {
  deployer.deploy(SolutionManufacturing);
};
