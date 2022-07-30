// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.5.0;

contract Patients {
	uint256 public patientCount = 0;
	mapping(address => Patient) public PatientInfo;

	constructor () {}

	modifier onlyPatient {
		require(PatientInfo[msg.sender].isActive == true, "Only patient can make these changes");
		_;
	}

	struct Patient {
		string firstName;
		string lastName;
		string birthDate;
		string gender;
		string bloodType;
		string uAddress;
		string city;
		string country;
		string phone;
		uint8 medicalCheckups;
		uint8 prescriptions;
        bool isActive;
	}

    // set patient details
	function setPatient (
		address _patientId, 
        string memory _firstName, 
        string memory _lastName, 
		string memory _birthDate, 
        string memory _gender, 
        string memory _bloodType, 
		string memory _uAddress, 
        string memory _city, 
        string memory _patientCountry, 
        string memory _phone) public {
			PatientInfo[_patientId] = Patient(_firstName, _lastName, _birthDate, _gender, _bloodType, _uAddress, _city, _patientCountry, _phone, 0, 0, true);
			patientCount++;

	}

	// get patient details
	function getPatient (address _id) public view returns (Patient memory) {
		return PatientInfo[_id];
	}

    // set number of medical vists
    function updateMedicalVisits(address _id) public {
        PatientInfo[_id].medicalCheckups++;
    }

    // set number of prescriptions
    function updatePrescriptions(address _id) public {
        PatientInfo[_id].prescriptions++;
    }
}