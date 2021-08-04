var RocketToken = artifacts.require("RocketToken");
var ProjectOffice = artifacts.require("ProjectOffice");

module.exports = function(deployer) {
  deployer.deploy(RocketToken, 'RocketToken', 'RT');
  deployer.deploy(ProjectOffice);
};
