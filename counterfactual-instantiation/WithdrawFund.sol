pragma solidity 0.6.0;

interface fundManage {
    function deposit() external payable returns(uint deposited);
    function withdraw() external  returns(bool);
    function getBalance() external view returns(uint);
}

contract WithdrawFund is fundManage {

    receive() external payable {

    }

    function deposit() external payable override returns(uint deposited){
        return msg.value;
    }

    function withdraw() external override returns(bool) {
        // address payable sender = msg.sender;
        msg.sender.transfer(address(this).balance);
    }

    function getBalance() external view override returns(uint) {
        return address(this).balance;
    }
}
