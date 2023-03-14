// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;


contract ERC20 {
   string public constant NAME = "FIM Token";
   string public constant SYMBOL = "FIM";
   uint8 public constant DECIMALS = 18;
   uint256 public constant INITIAL_AMOUNT = 100000;
   address public owner;
   uint public totalSupply;
   mapping (address => uint256) public balances;
   mapping (address => mapping (address => uint256)) public allowed;
   event Transfer(address indexed from, address indexed to, uint256 value);
   event Approval(address indexed owner, address indexed spender, uint256 value);

   
   constructor() {
      totalSupply = INITIAL_AMOUNT;

      balances[msg.sender] = INITIAL_AMOUNT;

      owner = msg.sender;
   }
   function balanceOf(address _owner) public view returns (uint256 balance)
   {
     return balances[_owner];
   }
   function transfer(address _to, uint256 _value) public 
     returns (bool     success) {
     require(balances[msg.sender] >= _value, "Sender has not enough Token");
     balances[msg.sender] -= _value;

     balances[_to] += _value;

     emit Transfer(msg.sender, _to, _value);
     return true;
}
   function transferFrom(address _from, address _to, uint256 _value) public       
      returns (bool success) {

      require(balances[_from] >= _value, "Sender has not enought Token");

      require(allowed[_from][_to] >= _value, "There is no allowance for this value");
      balances[_to] += _value;

      balances[_from] -= _value;

      allowed[_from][msg.sender] -= _value;
      emit Transfer(_from, _to, _value); 

      return true;
   }
   function approve(address _spender, uint256 _value) public 
      returns (bool    success) {

      allowed[msg.sender][_spender] = _value;
      emit Approval(msg.sender, _spender, _value);

      return true;
   }
   function allowance(address _owner, address _spender) public view 
      returns (uint256 remaining) {

      return allowed[_owner][_spender];
   }
}
