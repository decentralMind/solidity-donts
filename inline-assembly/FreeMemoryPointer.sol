pragma solidity ^0.6.0;

contract FreeMemoryPointer {
    /*
     * @dev Free Memory Pointer(FMP) for single byte argument(fmpsba).
     * For bytes less than 32, eg 0xaa, it returns FMP 192(0x80 + 0x20 + 0x20).
     * At memory location 0x80 it stores length of the bytes size. For input 0xaa it stores 1.
     * At memory location (0x80 + 0x20 = a0) it stores the actual input bytes, which is 0xaa.
     * Memory address(0x80 + 0x20 + 0x20 = c0) is the next available free memory pointer.
     * If the input bytes is greater than 32 bytes than free memory pointer is increase to 32 bytes(0x20).
     * Returns current available free memory pointer.
    **/
    function fmpsba(bytes memory data) public pure returns(uint x) {
        assembly {
            //Silence unused variable warning remix-ide.
            let _ := data
            x := mload(0x40)
        }
    }

    /*
     * @dev Free Memory Pointer(FMP) for multiple bytes arguments(fmpmba).
     * For input data less than 32 bytes (data1 = 0xaa, data2 = 0xbb), it returns FMP 256(0x100). Deconstructing...
     * 1: 0x80 - Stores length of data1, for input 0xaa, stores 1.
     * 2: 0x20 - Stores input bytes. Stores 0xaa.
     * 3: 0x20 - Stores length of data2, for input 0xbb, stores 1.
     * 4: 0x20 - Stores input bytes. Stores 0xbb.
     * 5: 0x20 - Current available FMP if 0x100 (0x80 + 0x20 + 0x20 + 0x20 + 0x20 = 0x100).
     * If the input bytes is greater than 32 bytes than free memory pointer is increase to 32 bytes(0x20).
     * Returns current available free memory pointer.
    **/
    function fmpmba(bytes memory data1, bytes memory data2) public pure returns(uint x) {
        assembly {
            //Silence unused variable warning remix-ide.
            let _ := data1
            let __:= data2
            x := mload(0x40)
        }
    }

    /*
    * @dev 'add' low level function retrieves the starting memory address of the given input.
    * For input 0xaa, it retrieves starting memory pointer 0x80 and add 0x01
    * and returns final value 0x81(129).
    *
    **/
    function dataAddition(bytes memory data) public pure returns(uint result) {
        assembly {
            result := add(data, 0x01)
        }
    }


     /*
    * @dev 'add' low level function retrieve the starting memory address of the given input.
    * For input 0xaa and 0xbb, it retrieves starting memory pointer for data 0xaa which is 0xc0(192) and add 0x01
    * and returns final value 0xc1(123).
    *
    **/
    function dataAdditionSecond(bytes memory dataOne, bytes memory dataTwo) public pure returns(uint result) {
        assembly {
            let _ := dataOne
            result := add(dataTwo, 0x01)
        }
    }
}
