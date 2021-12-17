//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./LightToken.sol";

contract LightTokenSale{
    LightToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokenSold;
    address admin;

    constructor(LightToken _tokenContract, uint256 _tokenPrice){
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }

    function buyTokens(uint256 _numOfTokens) public payable {
        //Sell
    }

    function endSale() public {
        //transfer
    }
}