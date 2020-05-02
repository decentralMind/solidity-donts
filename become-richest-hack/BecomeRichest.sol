pragma solidity ^0.5.0;

/**
* @dev Whoever sents the highest ether amount, their address is set as richest.
* However there is a flaw in this contract during transfer initiation process.
*/
contract BecomeRichest {
    address payable richest;
    uint public mostSent;

    constructor() public payable {
        richest = msg.sender;
        mostSent = msg.value;
    }

    function makeMeRich() public payable returns (bool) {
        if (msg.value > mostSent) {
            // This line can cause problems as malicious contract could set their fallback
            // to revert, there this contract will never set new sender as highest.
            richest.transfer(msg.value);
            richest = msg.sender;
            mostSent = msg.value;
            return true;
        } else {
            return false;
        }
    }
}
