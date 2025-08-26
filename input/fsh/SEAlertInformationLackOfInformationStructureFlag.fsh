// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10
Alias: $ATC = https://nzhts.digital.health.nz/fhir/ValueSet/atc-code

Profile: SEAlertInformationLackOfInformationStructureFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation lack of information structureF flag Profile"
Description: "Swedish profile of the Flag resource used for alerts missing the needed information structure."
* subject only Reference(SEAlertInformationPatient)
* category = #A
// * extension[flag-detail].valueReference only Reference(MedicationRequest)

Instance: SEAlertInformationLackOfInformationStructureFlagExample
InstanceOf: SEAlertInformationFlag
Description: "An example of the Swedish profile of the drug product Flag resource."
* status = #active
* code = $SCT#64301000052105 "blodsmitta hos gravid"
* extension[flag-detail].valueReference = Reference(SEAlertInformationIncidenceOfInfectiousDiseaseObservationExample) "blodsmitta hos gravid"
* subject = Reference(SEAlertInformationPatientExample)

