const LightToken = artifacts.require("./LightToken.sol");

module.exports = function (deployer) {
  deployer.deploy(LightToken);
};
