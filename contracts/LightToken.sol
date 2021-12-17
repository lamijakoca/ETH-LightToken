//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract LightToken {
    string public name = "LightToken";
    string public symbol = "LT";
    string public standard = "LightToken v1.0";
    uint256 public totalSupply; //how many token exists

    mapping(address => uint256) public balanceOf; 
    mapping(address => mapping(address => uint256)) public allowance; //state variable
    //mapping inner mapping -> 1st mapping for 1 acc, 2nd mapping for 2 acc -> to approve uint256 value to be spended or whatever

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    constructor(uint256 initialSupply){
        balanceOf[msg.sender] = initialSupply;
        totalSupply = initialSupply;
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success){
        //check balance
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    //if i am account A i want to approve account B to spend amount 
    function approve(address _spender, uint256 _value) public returns(bool success){
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        
        return true;
    }

    //function for a withdraw workflow, allowing contracts to transfer tokens 
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        //da _from ima dovoljno tokena 
        require(_value <= balanceOf[_from]);
        //da je allowance dovoljno velik
        require(_value <= allowance[_from][msg.sender]);
        //change balance
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        //update allowance
        allowance[_from][msg.sender] -= _value;

        return true;
    }
    // function getBalance(address adr ) public view returns(uint){
    //     return balanceOf[adr];
    // }
}