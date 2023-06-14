# DLA-BlockChain Module Overview

[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](./LICENSE) 
[![Language](https://img.shields.io/badge/Solidity-e6e6e6?style=for-the-badge&logo=solidity&logoColor=black)](https://docs.soliditylang.org/en/v0.8.19/)
[![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)](https://developer.mozilla.org/en-US/docs/)
[![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html)

## Information ℹ️
This is the repository for the DLA Blockchain Module.
The purpose of this documentation is to aid you not only during the live module but also if you wish to review what you have learned at a later time.

Below you will see three fold-out sections which will get you from zero to your first smart contract step-by-step.
+ **Section 1** deals with setting up the tools for coding
+ **Section 2** covers the core concepts of the Solidity programming language
+ **Section 3** comprises tasks from which you can build your first own project

This coding introduction assumes a certain familiarity with the theoretical foundations of blockchains and smart contracts.

<details>
<summary><h2>1) Getting Started with Coding 🚀</h2></summary>
After you are fimiliar with the concepts of blockchains and smart contracts it is time to put this knowledge to practice.
In the following, you will learn how to start your journey into Web3 development by setting up your development environment.

### Integrated Development Environment (IDE)
IDEs are used when programming, especially for beginners, because they provide a comprehensive environment for writing, testing, and debugging code. They offer features like auto-complete, code highlighting, simplified interfaces, and built-in documentation and tutorials.

### Remix IDE
For this module, we want to make use of a language-specific IDE, because we only need to programm in one language and they offer special support and functionalities for this use-case.

The [Remix IDE](https://remix-project.org/) is an IDE especially tailored for Solidity, the Ethereum smart contract language.
It comes in two different flavors with a [Browser-integrated Version](https://remix.ethereum.org/) and a [Desktop App](https://github.com/ethereum/remix-desktop/releases). Please make your selection.

All information about the Remix IDE can be found in the [Remix documentation](https://remix-ide.readthedocs.io/en/latest/).
</details>

<details>
<summary><h2>2) Basics of Solidity 📚</h2></summary>
Now that we have a place where we can write and test code, we need to write the code in the first place.
However, before being able to write, we need to learn the appropriate language. This is where Solidity comes in.
As previously mentioned, smart contract code for Ethereum is written in Solidity, a high-level programming language based on JavaScript.  
<br><br>
All information about Solidity can be found in the <a href="https://docs.soliditylang.org/en/v0.8.18/">Soldity documentation</a>.<br>
Also make sure to check out the <a href="https://ethereum.org/en/developers/docs/standards/tokens/">ERC token standards</a> and their <a href="https://github.com/OpenZeppelin/openzeppelin-contracts/tree/master/contracts/token">code implementations</a>.
<br><br>
In the following, we will provide a rough overview over core concepts in this language:

### Formalities
```solidity
// This is a comment, it needs to be indexed by the "//" at the beginning
/* This can be used to comment over
multiple lines*/

// A smart contract file starts with a license identifier and a compiler instructon (pragma):
	
// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

	
// A contract itself is created in the file as follows:
contract myContract {

/* Content of the contract goes here */

}
```

### Data Types
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataTypes {
    // Boolean
    bool trueOrFalse;
    // Unsigned integer. default size is 256
    uint firstInteger;
    // The same as above, with definition
    uint256 secondInteger;
    // Signed integer, 128
    int128 thirdinteger;
    // Address, add keywork 'payable' to be able to send ether to it
    address myAddress;
    // sequence of two bytes
    bytes2 twoBytes;
    // Sixteen byte sequence:
    bytes16 sixteenBytes;
    // String
    string myString;
	
   /* Note that all data variables declared like that are mutable.
      If you wish to make them immutable (read-only), use the "immutable"  or the "constant" keyword */
   constant uint immutableUint_1 = 123;
   immutable uint immutableUint_2 = 456;
}
```

### Functions
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract functions {

	//Function syntax
	function basicFunction(/*data type*/ /*input variable*/) /*modifers*/ returns(/*data type*/ /*output variable*/) {
	  //...
	return(/*output variable*/);
	}

}
```	
	
### Data Structures
#### Mappings
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mappings {

    // State variable
    mapping(address => uint) public myMapping;

    // Store a new value in the mapping
    function putThing(address _key, uint _value) public {
        myMapping[_key] = _value;
    }

    // Retrieve a value from the mapping using key to search
    function getThing(address _search) public view returns (uint){
        return myMapping[_search];
    }

}
```
	
#### Arrays
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Arrays {
  
  // Define the array and its type (Solidity only supports homogenous arrays, i.e., same data type)
  uint[] public myArray;

  // Add a new value to the end of the array
  function pushValue(uint _value) public {
    myArray.push(_value);
  }	
	
  // Get the length of the array
  function getLength() public view returns (uint) {
      return myArray.length;
  }
	
  // Remove and return the last value from the array
  function popValue() public returns (uint) {
    require(myArray.length > 0, "Array is empty");
    return myArray.pop();
}

  }	

  // Retrieve a value from the array using an index
  function getValue(uint _index) public view returns (uint) {
      return myArray[_index];
  }
}
```		
	
#### Structs
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Structs {
  
  // Define the Person struct
  struct Person {
  string name;
  uint8 age;
  }

  // Create a new person struct,
  // Access the age of the struct
  function personAge() external pure returns(uint8) {
    Person memory person = Person("Alex", 27);
    // Will return 27
    return person.age;
    }
}
```
	
### Control Flow
#### Conditionals
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
	
contract Conditionals {

  uint256 a = 10;
  uint256 b = 20;

  if (a == b) {
    // execute this block of code if a is equal b
    // ...
  } else if (a < b) {
    // execute this block of code if a is less than b
    // ...	  
  } else {
    // execute this block if nothing of the above applies (here: a > b)
    // ...
  }		
}
```
#### Loops
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
	
contract Loops {
  
  // For-Loop	
  for (uint i = 0; i < 10; i++) {
    // do something
  }			  
	
  // While-Loop			  
  while (uint i = 0; i < 10) {
    // do something
    i++;
  }
	
  // Do...While	
  uint i = 0;
  do {
    // do something
    i++;
  } while (i < 10);			
}
```	
	
### Access Control
#### Require Statements
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RequireStatements {

    function someFunction(address _anAddress) external {
        // Require that the address given as a parameter is not equal to an empty addess.
        // If the address is empty, the whole transaction will not be completed and will be reverted
        require(_anAddress != address(0), "Not a valid address");
          //...
    }
}
```
#### Access modifers
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccessModifiers {
    // Public modifer exposes a getter for state variable
    string public myString;
    // Private variable only accessible within contract
    string private myPrivateString;

    // Internal functions can only be used within this contract
    function innerFunction() internal {}
    // External functions are part of the contract interface and can be called from outside
    function outerFunction() external {}
}
```
#### Custom modifiers
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CustomModifiers {

    // State variable
    address private owner;

	// Custom modifier requiring that the sender of the transaction is the owner
	// otherwise revert the transaction
    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

	// Constructor takes an address and stores it in the owner variable
    constructor(address _owner) public {
        owner = _owner;
    }

     // someFunction() uses the onlyOwner modifier to make use of our
    // custom definition on line 10
    function someFunction() external onlyOwner { 
        //...
    }
}
```
	
### Imports and inheritance
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Imports a contract from another contract file in the same directory (i.e., folder)
import "./vehicle.sol";

//Car inherits from Vehicle contract (which is located in vehicle.sol and was imported before)
//Inheritance means that the car contract can now access non-private functions and variables of its parent contract
contract Car is Vehicle {
  //...
}
```
</details>

<details>
<summary><h2>3) Your Task 📝</h2></summary>
That was a lot of information, but that's how it is (just like learning vocabulary). <br>
<br>
Now that you know how to express yourself, there are virtually no limits to what you can do in your programm, except the limits of the language itself. Congratulations! You are equipped with the necessary knowledge to code your first Smart Contract, and that is exactly what we will do now. In the following you will find tasks that will guide you step by step towards your own smart contract: <br>
<br>	

* Take a look at the token smart contract [here](./contracts/FIM_Token_Example.sol)
* Implement a "buyProduct" function which takes in an amount of the contract's token and sends it to the owner
* Change the constructor of the contract so that the total supply is set to the contract itself and not the owner 
* Implement a "buyToken" function that takes in an ether amount (e.g, in wei) transfers it to the owner and sends an amount of tokens to the buyer
* Now, write a second contract that accepts the token of the first contract to buy its tokens
	
And that is it for this introduction to Smart Contract Coding. Remember, it is important to practice your "vocabulary" every now and then. Otherwise you will slowly forget about how to use the language and how to write useful programms with it. 	
</details>

## Disclaimer ⚠️
This repository is affiliated with the [Research Center Finance & Information Management, Branch Business & Information Systems Engineering
of the Fraunhofer FIT](https://www.fim-rc.de/en/).

For use, modification, or distribution, please refer to the [open source license](./LICENSE).
