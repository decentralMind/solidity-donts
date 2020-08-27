pragma solidity >= 0.5 .0 < 0.7 .0;

contract arrayElementSum{

  /*
   * @dev Take note on memory loading. For the arugment [3,4], the free memory pointer
   * which is 0x80 actually contains length of the _data array, to access array element 3,
   * free memory pointer 0x80 needs to be increase by 32 bytes(0x20) and to access array
   * element 4 free memory piotner 0x80 needs to icnrease by 64 bytes(0x40).
   **/

  function arraySum(uint[] memory _data) public pure returns(uint sum) {
    assembly {
      // Load the length (first 32 bytes)
      let len: = mload(_data)

      // Skip over the length field.
      //
      // Keep temporary variable so it can be incremented in place.
      //
      // NOTE: incrementing _data would result in an unusable
      //       _data variable after this assembly block


      // Get the current memory pointer
      // Increase the length of data with 1.
      let data: = add(_data, 0x20)

      // Iterate until the bound is not met.
      for
      // add extra one byte data.
      {
        let end: = add(data, mul(len, 0x20))
      }

      lt(data, end)

      {
        data: = add(data, 0x20)
      }

      {
        sum: = add(sum, mload(data))
      }
    }
  }


}
