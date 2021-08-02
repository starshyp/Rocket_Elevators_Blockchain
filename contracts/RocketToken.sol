pragma solidity ^0.8.0;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
/* import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; */
/* import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol"; */

contract RocketToken is ERC20 {
  /* string public name;
  string public symbol;
  uint8 public decimals; */

  constructor(string memory _name, string memory _symbol)
    ERC20(_name, _symbol)
      public {
      /* name = _name;
      symbol = _symbol;
      decimals = _decimals; */
    }
}

/* contract RocketToken is ERC20, ERC20Detailed {
    constructor(uint256 initialSupply) ERC20Detailed("Gold", "GLD", 18) public {
        _mint(msg.sender, initialSupply);
    }
} */
