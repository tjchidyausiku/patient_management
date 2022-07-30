// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.5.0;

import "./Patient.sol";
import "./Doctor.sol";

contract MedicalRecords is Patients, Doctors {
	uint256 public medicalRecordCount;
    uint256 public medicalUuid;
	mapping(address => mapping(uint => MedicalRecord[])) public Records;

	constructor () {
        medicalRecordCount = 0;
        medicalUuid = 1000;
	}

    struct MedicalRecord {
    	uint8 bp;
        uint8 temprature;
        uint8 weight;
        string diagnosis;
        Doctor doctor;
        Patient patient;
        uint createdAt;
    }

    struct Prescription {
    	string dosage;
        uint16 qty;
        string details;        
        address doctorId;
        string createdAt;
        bool collected;
    }
    
    //generate uuid
    function generateRecordId() internal returns (uint) {
        return medicalUuid++;
    }

    // create MedicalRecord
    function setMedicalRecord (
        uint256 _uuid,
        uint8 _bp,
        uint8 _temprature,
        uint8 _weight,
        string memory _diagnosis,
        address _doctorId,
        address _patientId
    ) public onlyDoctor {
        // update patient MedicalRecords
        Records[_patientId][_uuid].push(
            MedicalRecord(
                _bp, 
                _temprature, 
                _weight, 
                _diagnosis, 
                DoctorInfo[_doctorId],
                PatientInfo[_patientId], 
                block.timestamp
            )
        );
    }
}