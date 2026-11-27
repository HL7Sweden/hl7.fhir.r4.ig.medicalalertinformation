/*
    Example instances of the Swedish base patient profile (SEBasePatient),
    which this guide uses directly instead of defining its own patient profile.
    The example data is based on test persons available in the Inera PU Test environment.
*/
Instance: SEAlertInformationPatientExample
InstanceOf: SEBasePatient
Title: "Example: Patient"
// Description: "Patientexempel"
Description: "Patient example"
* meta.security[0] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST "test health data"
* meta.security[1] = SecurityLabelCS#sekretessmarkering
* id = "PatientExample1"
* identifier[personnummer].value = "195009072553"
* name[0].use = #official
* name[0].family = "Goode Johansson"
* name[0].given[0] = "John"
* name[0].given[1] = "Bob"
* name[0].given[0].extension[nameQualifier].valueCode = #CL
* name[0].extension[middleName].valueString = "Johansson"
* name[0].extension[ownFamily].valueString = "Goode"
* name[0].text = "John Bob Goode Johansson"
* gender = #male
* maritalStatus = SEBaseMaritalStatusCS#RP "Registrerad partner"
* birthDate = "1950-09-07"
* address.line = "Storgatan 1"
* address.city = "Stockholm"
* address.postalCode = "11122"
* address.country = "SE"