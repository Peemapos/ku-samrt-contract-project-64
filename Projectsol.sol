pragma solidity =0.5.0;

contract Mycontract{
    address ownerId;
    address userId;
    string  status1="Transaction not complete";
    mapping (address => uint)public balance;
    constructor ()public{
        userId=msg.sender; //คนจ่ายเป็น msg sender
    }
    function addIdowner(address _ownerId) public { //เพิ่ม address เจ้าของ
        ownerId=_ownerId;
    }
    function checkuserId()public view returns(address){//เข็ค address คนจ่าย
        return address(msg.sender);
    }
    function checkownerId()public view returns(address){//เช็ค address เจ้าของ
        return address(ownerId);
    }
    function sendmoney(address payable _ownerId)payable external { //จ่าย
        uint amount=msg.value;
        _ownerId.transfer(amount);
        balance[_ownerId]+=amount;
        if (amount>=1 ether){
            status1="Thankyou"; //เปลี่ยน status เป็น thankyou
        }
    }
    function showstatus() public view returns(string memory){ //แสดง status ปัจจุบัน
            return string(status1);
    }
}