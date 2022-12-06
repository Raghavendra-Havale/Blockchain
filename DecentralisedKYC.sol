// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;
contract DecentralisedKYC{
    address RBI;
    constructor(){
        RBI=msg.sender;
    }
    modifier onlyRBI(){
        require(msg.sender==RBI);
        _;
    }
    struct Bank{
        string bankName;
        address bankAddress;
        bool KYCfunction;
        bool AddCustomerFunction;
    }
    mapping (uint8=>Bank)bank;
    //Adding new bank
    function addBank(uint8 _bankId,string memory _bankName,address _bankAddress)public onlyRBI{
        bank[_bankId].bankName=_bankName;
        bank[_bankId].bankAddress=_bankAddress;
        bank[_bankId].KYCfunction=true;
        bank[_bankId].AddCustomerFunction=true;
    }

    struct Customer{
        string customerName;
        string customerData;
        bool KYCStatus;
    }
    mapping(uint8=>Customer)customer;

    function addCustomer(
        uint8 _customerId,
        uint8 _bankId,
        string memory _customerName,
        string memory _customerData)
        public {
            require(bank[_bankId].AddCustomerFunction==true);
            customer[_customerId].customerName=_customerName;
            customer[_customerId].customerData=_customerData;
        }

    function checkKYCStatus(uint8 _customerId,string memory _customerName)public returns(bool KYCStatus) {
        if(KYCStatus==true){
            return true;
        }
        else{
            return false;
        }

    }

    function doKYC(uint8 _customerId,string memory _customerName,uint8 _bankId)public{
        require(bank[_bankId].KYCfunction==true);
            customer[_customerId].KYCStatus=true;
    }

    function blockAddFunction(uint8 _bankId,address _bankAddress)public onlyRBI{
        bank[_bankId].AddCustomerFunction=false;
    }

    function blockKYCFunction(uint8 _bankId,address _bankAddress)public onlyRBI{
        bank[_bankId].KYCfunction=false;
    }
    function ReviveAddFunction(uint8 _bankId,address _bankAddress)public onlyRBI{
        bank[_bankId].AddCustomerFunction=true;
    } 
    function ReviveKYCFunction(uint8 _bankId,address _bankAddress)public onlyRBI{
        bank[_bankId].KYCfunction=true;
    } 
    function CustomerDetails(uint8 _customerId,string memory _customerName)public view returns(string memory customerName,string memory customerData,bool KYCStatus){
        return (customer[_customerId].customerName,customer[_customerId].customerData,customer[_customerId].KYCStatus);
    }
}