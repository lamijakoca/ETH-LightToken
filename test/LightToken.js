var LightToken = artifacts.require("./LightToken.sol");

contract('LightToken', function(accounts){
    var tokenInstance;
    it('initializes the contract with the correct values', function(){
        return LightToken.deployed()
        .then(function(instance){
            tokenInstance = instance;
            return tokenInstance.name();
        }).then(function(name){
            assert.equal(name, "LightToken", "has correct name");
            return tokenInstance.symbol();
        }).then(function(symbol){
            assert.equal(symbol, "LT", "has the correct symbol");
            return tokenInstance.standard();
        }).then(function(standard){
            assert.equal(standard, "LightToken v1.0", "has the correct standard");
        })
    })
    it('sets the total supply upon deployment', function(){
        return LightToken.deployed().then(function(instance){
            tokenInstance = instance;
            return tokenInstance.totalSupply();
        }).then(function(totalSupply){
            assert.equal(totalSupply.toNumber(), 100000, 'sets the total supply to 1,000,000');
            return tokenInstance.balanceOf(accounts[0]);
        }).then(function(adminBalance){
            assert.equal(adminBalance.toNumber(),1000000, 'it allocates the inital supply to the admin')
        })
    });

    // it('transfers token ownership', function(){
    //     return LightToken.deployed().then(function(instance){
    //         tokenInstance = instance;
    //         return tokenInstance.transfer.call(accounts[1], 999999999999999999);
    //     }).then(assert.fail).catch(function(error){
    //         assert(error.message.indexOf('revert') >= 0, 'error msg must contain revert')
    //     })
    // })
});