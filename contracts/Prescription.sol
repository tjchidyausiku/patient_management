// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.5.0;

import "./Patient.sol";

contract Prescriptions {
	uint256 public prescriptionCount;
	mapping(address => mapping(string => Prescription[])) public prescriptions;

	constructor () {
        prescriptionCount = 0;
	}

    struct Prescription {
    	string dosage;
        uint16 qty;
        string details;        
        address doctorId;
        string createdAt;
        bool collected;
    }

    // create prescription
    function setPrescription (
        address _patientId,
    	string memory _dosage, 
    	uint16 _qty, 
    	string memory _details, 
    	address _doctorId,
    	string memory _createdAt,
        string memory _uuid
    ) public {
        prescriptions[_patientId][_uuid].push(
            Prescription(_dosage, _qty, _details, _doctorId, _createdAt, false)
        );
    }
}