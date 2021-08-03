pragma solidity ^0.8.0;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
/* import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; */
/* import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol"; */

contract RocketToken is ERC20 {
  /* address public _mint; */
  /* string public name;
  string public symbol;
  uint8 public decimals; */

    /* constructor() ERC20("Fixed", "FIX") {
        _mint(msg.sender, 1000000);
    } */

    constructor(uint256 initialSupply)
      public ERC20("RocketToken", "RT") {
        _mint(msg.sender, initialSupply * (10 ** decimals()));
    }

    /* function mint(address _account, uint256 _amount) public {
      require(msg.sender == minter, 'User is not the minter');
      _mint(_account, _amount);
    } */

  /* constructor(string memory _name, string memory _symbol)
    ERC20(_name, _symbol)
      public {
      /* name = _name;
      symbol = _symbol;
      decimals = _decimals;
    }
} */

/* contract RocketToken is ERC20, ERC20Detailed {
    constructor(uint256 initialSupply) ERC20Detailed("Gold", "GLD", 18) public {
        _mint(msg.sender, initialSupply);
    }
} */

}
