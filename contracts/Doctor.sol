// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.5.0;

contract Doctors {

	constructor () {
	}

	uint256 public doctorCount = 0;
	mapping(address => Doctor) public DoctorInfo;	

	modifier onlyDoctor {
        require (DoctorInfo[msg.sender].isActive == true, "Only doctors can add medical record");
        _;
    }

	struct Doctor {
		string firstName;
		string lastName;
		string gender;
		string birthDate;
		string doctorId;
		string practiceId;
		string uAddress;
		string city;
		string country;
		string phone;
		bool isActive;
	}

	function setDoctor (
		address _id, 
		string memory _firstName, 
		string memory _lastName, 
		string memory _gender,
        string memory _birthDate, 
		string memory _doctorId, 
		string memory _practiceId, 
		string memory _uAddress, 
		string memory _city, 
		string memory _country, 
		string memory _phone) public {
			DoctorInfo[_id] = Doctor(_firstName, _lastName, _gender, _birthDate, _doctorId, _practiceId, _uAddress, _city, _country, _phone, false);
			doctorCount++;

	}

	function getDoctor (address _id) public view returns (Doctor memory) {
		return DoctorInfo[_id];
	}

	function activeAccount(address _id) public {
        DoctorInfo[_id].isActive = true;
    }

    function isDoctor (address _id) public view returns (bool) {
        return DoctorInfo[_id].isActive;
    }
}