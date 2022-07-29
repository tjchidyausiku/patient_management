// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.5.0;

contract Pharmacies {
	uint256 public pharmacyCount;
	mapping(address => Pharmacy) public PharmacyInfo;

	constructor () {
		pharmacyCount= 0;
	}	

	struct Pharmacy {
		string name;
		string uAddress;
		string city;
		string country;
		string phone;
		string email;
		string website;
	}

	function setPharmacy (
		address _id, 
		string memory _name, 
		string memory _uAddress, 
		string memory _city, 
		string memory _country, 
		string memory _phone, 
		string memory _email, 
		string memory _website) public {
			PharmacyInfo[_id] = Pharmacy(_name, _uAddress, _city, _country, _phone, _email, _website);
			pharmacyCount++;
	}

	function getPharmacy (address _id) public view returns (Pharmacy memory) {
		return PharmacyInfo[_id];
	}
}