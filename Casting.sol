pragma solidity ^0.5.0;

contract Casting {

     /*
    *
    * For input 0xffffffffffffffff(8 bytes),  returns 0xffff(2**16 - 1).
    * Note: byte to uint type converstion has to be matched in their respective conversion size. 8 bytes can hold
    * 2 ** 64 - 1 numbers. Trying to to convert 8 bytes to uint32, uint16, or uint128 will throw an error.
    *
    **/
    function bytes8toUint64(bytes8 gatekeep) public pure returns(uint64) {
        return uint64(gatekeep);
    }


    /*
    * For input 0xffffffffffffffff(2**64 -1) returns 0xffff(2**16 - 1).
    **/
    function uint64toUint16(uint64 gatekeep) public pure returns(uint16) {
        return uint16(gatekeep);
    }

    /*
    *
    * For input 0xffffffffffffffff(2**64 -1) returns 0xffff(2**32 - 1).
    *
    **/
    function uint64toUint32(uint64 gatekeep) public pure returns(uint32) {
        return uint32(gatekeep);
    }

    /*
    *
    * For input 0xffff(2**32 - 1), returns same value, 0xffff(2**32 - 1).
    *
    **/
    function uint32toUint64(uint32 gatekeep) public pure returns(uint64) {
        return uint64(gatekeep);
    }


    /*
    *
    * For input 0xff(2**16 - 1), returns same value, 0xffff(2**16 - 1).
    *
    **/
    function uint16toUint64(uint16 gatekeep) public pure returns(uint64) {
        return uint64(gatekeep);
    }


    /*
    *bytes8 input: 0x73616e6465736872
    * bytes16 output:  0x73616e64657368720000000000000000
    */
    function byte8ToByte16(bytes8 value8) public pure returns(bytes16) {
        return bytes16(value8);
    }

    /*Input bytes32
    *0x000000000000000000000000ca35b7d915458ef540ade6068dfe2f44e8fa733c
    *Output bytes16
    *0x000000000000000000000000ca35b7d9
    **/
    function bytes32ToBytes16(bytes32 convBytes32) public pure returns(bytes16) {
        return bytes16(convBytes32);
    }

}
