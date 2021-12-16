//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract LightToken {
    //constructor 
    //set the total number of tokens
    //read the total number of tokens
    uint256 public totalSupply; //how many token exists
    mapping(address => uint256) public balanceOf;

    function Light(uint256 initialSupply) public{
        balanceOf[msg.sender] = initialSupply;
        totalSupply = initialSupply;
    }
    
}