pragma solidity 0.6.0;

contract Factory {
    event Show(address ca, bytes32 encodeSalt);

    function deploy(bytes memory bytecode, bytes32 salt) public {
        address addr;
        assembly {
            addr := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
        }
        emit Show(addr, salt);
    }
}
