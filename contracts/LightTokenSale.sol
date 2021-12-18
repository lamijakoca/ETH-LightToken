//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./LightToken.sol";

//da bismo dozvolili nalozima da kupuju token
contract LightTokenSale{
    LightToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokenSold;
    address payable admin;

    event Sell(address _buyer, uint256 _amount);

    constructor(LightToken _tokenContract, uint256 _tokenPrice){
        admin = payable(msg.sender);
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }

    function multiply(uint x, uint y) internal pure returns(uint z){
        require(y == 0 || (z = x * y) / y == x);
    }
    
    function buyTokens(uint256 _numOfTokens) public payable {
        
        require(msg.value == multiply(_numOfTokens, tokenPrice));
        require(tokenContract.balanceOf(address(this)) >= _numOfTokens);
        require(tokenContract.transfer(msg.sender, _numOfTokens));
        tokenSold += _numOfTokens;
        
        emit Sell(msg.sender, _numOfTokens);    
    }

    //only admin can do this
    function endSale() public {
        require(msg.sender == admin);
        
        require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this))));

        selfdestruct(admin);
    }
}