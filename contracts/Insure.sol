// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.5.0;

contract Insurers {
	uint256 public insurerCount;
	mapping(address => Insurer) public InsurerInfo;

	constructor () {
		insurerCount = 0;
	}

	struct Insurer {
		string name;
		string uAddress;
		string city;
		string country;
		string phone;
		string email;
		string website;
	}

	function setInsurer (
		address _id, 
		string memory _name, 
		string memory _uAddress, 
		string memory _city, 
		string memory _country, 
		string memory _phone, 
		string memory _email, 
		string memory _website) public {
			InsurerInfo[_id] = Insurer(_name, _uAddress, _city, _country, _phone, _email, _website);
			insurerCount++;

	}

	function getInsurer (address _id) public view returns (Insurer memory) {
		return InsurerInfo[_id];
	}
}