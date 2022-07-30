// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.5.0;

import "./Patient.sol";
import "./Doctor.sol";
import "./Prescription.sol";

contract MedicalRecord is Patients, Doctors {
	uint256 public medicalRecordCount;
	mapping(address => MedicalRecord[]) public MedicalRecords;

	constructor () {
        //medicalRecordCount = 0;
	}

    struct MedicalRecord {
    	uint8 bp;
        uint8 temprature;
        uint8 weight;
        string diagnosis;
        Doctor doctor;
        Patient patient;
        Prescription prescription,
        string createdAt;
    }

    // create MedicalRecord
    function setMedicalRecord (
        string memory _uuid,
        uint8 _bp,
        uint8 _temprature,
        uint8 weight,
        string memory _diagnosis,
        address _doctorId,
        address _patientId,
    ) public onlyDoctor {
        MedicalRecords[_uuid].push(
            MedicalRecord(
                _bp, 
                _temprature, 
                _weight, 
                _diagnosis, 
                DoctorInfo[_doctorId],
                PatientInfo[_patientId] 
                now
            )
        );

        // update patient MedicalRecords count
        PatientMedicalRecords[_patientId][_uuid].push(
            MedicalRecord(
                _bp, 
                _temprature, 
                _weight, 
                _diagnosis, 
                DoctorInfo[_doctorId],
                PatientInfo[_patientId] 
                now
            )
        );

        // update doctors MedicalRecord record
        /*PatientMedicalRecords[_patientId][_uuid].push(
            MedicalRecord(
                _bp, 
                _temprature, 
                _weight, 
                _diagnosis, 
                DoctorInfo[_doctorId],
                PatientInfo[_patientId] 
                now
            )
        );*/
    }
}