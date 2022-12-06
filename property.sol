// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;
contract RealEstate{
    address public Admin;
    constructor() {
        Admin=msg.sender;
    }
    modifier onlyAdmin() {
        require(msg.sender==Admin);
        _;
    }
    struct Property{
        uint256 surveyNo;
        uint256 area;
        string town;
        string owner;
        uint256 value;
    }
    mapping(uint32=>Property)property;

    function addProperty(
        uint32 _id,
        uint256 _surveyNo,
        uint256 _area,
        string memory _town,
        string memory _owner,
        uint256 _value 
    )
    public onlyAdmin {
        property[_id].surveyNo=_surveyNo;
        property[_id].area=_area;
        property[_id].town=_town;
        property[_id].owner=_owner;
        property[_id].value=_value;
    }

    function showPropertyDetails(uint32 _id) public view returns(
        uint256 _surveyNo,
        uint256 _area,
        string memory _town,
        string memory _owner,
        uint256 _value)  
        {
            return(
        property[_id].surveyNo,
        property[_id].area,
        property[_id].town,
        property[_id].owner,
        property[_id].value);
        }

    function TransferProperty(uint32 _id,uint256 _surveyNo,string memory _newOwner,uint256 _newValue)public onlyAdmin{
        property[_id].owner=_newOwner;
        property[_id].value=_newValue;
    }

}