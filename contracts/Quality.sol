pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Quality is ERC721 {
  string[] public verifications;
  /* string[] public battPermit; */
  mapping(string => bool) _verificationExists;
  uint public qualityChk = 1;
  /* mapping(bool => Checks) public checks; */

  constructor() ERC721("Quality", "QA") public {
  }

  function verifyQuality(string memory _verify) public {
    /* require(!_verificationExists[_verify]);
    verifications.push(_verify);
    uint _id = verifications.length -1; */
    _mint(msg.sender, qualityChk);
    _verificationExists[_verify] = true;
    qualityChk += 1;
  }

  /* bool doorTest; //guarantee
  bool cableTest; //guarantee
  bool brakeTest; //guarantee
  uint battPermitTest; //obtain permit
  bool colCert; //cert of conformity for each col. */

  /* struct Checks {
    bool doorCheck; //guarantee
    bool cableCheck; //guarantee
    bool brakeCheck; //guarantee
    bool batteryCheck; //obtain permit
    bool colCheck; //cert of conformity for each col.
  } */

  struct Permit {
    uint battID; //random function
    string battIssued; //string
    uint battDate; //timestamp
    uint battChain; //current chain ID
    uint battBlock; //block number
  }
  Permit batteryShow;
  Permit[] public battPermit;

  /* function remove() public {
    selfdestruct(0x0);
  } */

  function door(bool doorTest) public returns(string memory) {
    /* _mint(msg.sender, qualityChk);
    _verificationExists[doorTest] = true;
    qualityChk += 1; */
    return doorTest ? 'Pass' : 'Fail';
  }

  function cable(bool cableTest) public returns(string memory) {
    return cableTest ? 'Pass' : 'Fail';
  }

  function brake(bool brakeTest) public returns(string memory) {
    return brakeTest ? 'Pass' : 'Fail';
  }

  function batteryPermit(uint numOfPermits) public returns(Permit memory batteryShow) {
    /* _mint(msg.sender, qualityChk);
    _verificationExists[numOfPermits] = true;
    qualityChk += 1;
    uint id = qualityChk; */

    for(uint i=0; i<numOfPermits; i++) {
      Permit memory batteryPermitNew;
      batteryPermitNew.battID = random();
      batteryPermitNew.battIssued = "Rocket Elevators";
      batteryPermitNew.battDate = block.timestamp;
      batteryPermitNew.battChain = block.chainid;
      batteryPermitNew.battBlock = block.number;
      battPermit.push(batteryPermitNew);
      return batteryPermitNew;
    }
  }

  function certificate(bool door, bool brake, bool cable, uint Permit/*, Permit memory permit*/) public returns(string memory) {
    /* grade; */
    return door && brake && cable && (Permit > 0) /*&& (permit > 0)*/ ? 'Pass' : 'Fail';
    /* return grade; */
  }

  /* mapping(address => mapping(address => bool)) private _operatorApprovals; */

  /* function createTask(string memory _content) public {
    taskCount++;
    tasks[taskCount] = Task(taskCount, _content, false)
  } */

  /* function setApprovalForAll(address operator, bool approved) public virtual override {
      require(operator != _msgSender(), "ERC721: approve to caller");

      _operatorApprovals[_msgSender()][operator] = approved;
      emit ApprovalForAll(_msgSender(), operator, approved);
  } */

  /* function random() {
  numbers = [10221, 12445, 56732];
  random = numbers[Math.floor(Math.random() * 10) + 1];
  return random;
  }
  */

  /* function random() private view returns (uint8) {
  return uint8(uint256(keccak256(block.timestamp, block.difficulty))%251);
  } */

  function random() private view returns (uint) {
     return uint(keccak256(abi.encodePacked(block.timestamp))) % 11;
  }

}
