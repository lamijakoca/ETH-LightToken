const LightToken = artifacts.require("LightToken.sol");
const LightTokenSale = artifacts.require("LightTokenSale.sol");

module.exports = function (deployer) {
  deployer.deploy(LightToken,1000000).then(function() {
      return deployer.deploy(LightTokenSale, LightToken.address, 1000000000000000);    //posto zavisi od prethodne adrese, 10...000 je token price - gwei
  })
};
