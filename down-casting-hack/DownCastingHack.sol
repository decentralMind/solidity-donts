pragma solidity ^0.6.0;

contract DownCasting {

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    function changeOwner(uint256 value) public returns(bool) {
        require(owner != msg.sender, "Sender address already registered as owner address.");
        require(value > 2** 8, "Input value should be greater than 2** 8");
        require(uint8(value) == 2 ** 4, "Uint8 conversion value should be equal to 2**4");
        owner = msg.sender;
        return true;
    }
}
