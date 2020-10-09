const { web3 } = require('../utils/getWeb3');

//=Replace this with current deployed factory contract
const ca = "0xf78F216295481bca0f8239D499Cd2fDCcE719464";
const accountBytecode = "0x608060405234801561001057600080fd5b5060fd8061001f6000396000f3fe60806040526004361060335760003560e01c806312065fe014603e5780633ccfd60b146062578063d0e30db0146088576039565b36603957005b600080fd5b348015604957600080fd5b506050608e565b60408051918252519081900360200190f35b348015606d57600080fd5b5060746092565b604080519115158252519081900360200190f35b605060c3565b4790565b60405160009033904780156108fc029184818181858888f1935050505015801560bf573d6000803e3d6000fd5b5090565b349056fea26469706673582212202fab3ae78d4741f304b82e0b242107955d75791c6f710adf9654ced84c6ec77d64736f6c63430006000033"

function numTo32BitHex(value) {
  const hex = value.toString(16)
  const convert32 = '0x' + '0'.repeat(64-hex.length) + hex
  return convert32
}

function create2Address(creatorAddress, saltHex, byteCode) {
  const byteHash = web3.utils.sha3(byteCode);
  const concatAll = '0xff' + creatorAddress.slice(2) + saltHex.slice(2) + byteHash.slice(2);
  const final = web3.utils.sha3(concatAll)
  return '0x' + final.slice(26)
}

const numToHex = numTo32BitHex(1);
console.log(create2Address(ca, numToHex, accountBytecode));
