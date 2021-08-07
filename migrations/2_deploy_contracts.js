// var Adoption = artifacts.require("Adoption");
const MaterialProvider = artifacts.require("MaterialProvider");
var RocketToken = artifacts.require("RocketToken");
var ProjectOffice = artifacts.require("ProjectOffice");
var SolutionManufacturing = artifacts.require("SolutionManufacturing");
var Quality = artifacts.require("Quality");

module.exports = function(deployer) {
  // deployer.deploy(Adoption);
  deployer.deploy(RocketToken, 1000000);
  deployer.deploy(Quality);
  deployer.deploy(ProjectOffice);
  deployer.deploy(MaterialProvider);
  deployer.deploy(SolutionManufacturing);
};
