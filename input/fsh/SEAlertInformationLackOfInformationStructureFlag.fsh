// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10
Alias: $ATC = http://www.whocc.no/atc

Profile: SEAlertInformationLackOfInformationStructureFlag
Parent: SEAlertInformationFlag
// Title: "SE AlertInformation saknar informationsstruktur Profil"
Title: "SE AlertInformation lack of information structureF flag Profile"
// Description: "Svensk profil av Flag resource som används för uppmärksamhetssignaler som saknar nödvändig informationsstruktur."
Description: "Swedish profile of the Flag resource used for alerts missing the needed information structure."
* subject only Reference(SEAlertInformationPatient)
* category = SEAlertInformationCategoryCS#E1 "Historically recorded medical alert information"
// * category = #E1 "Ej strukturanpassad uppmärksamhetsinformation"
// * extension[flag-detail].valueReference only Reference(MedicationRequest)

Instance: SEAlertInformationLackOfInformationStructureFlagExample
InstanceOf: SEAlertInformationLackOfInformationStructureFlag
// Description: "Exempel på svensk profil för Flag resource för saknad informationsstruktur."
Description: "Example of the Swedish Flag profile for alert information that lacks the required information structure."
* status = #active
* code = $ICD10SE#"A49.9" "Bakteriell infektion, ospecificerad"
* extension[alertLabel].valueCodeableConcept = SEAlertLabelCS#ej-strukturanpassad-uppmarksamhetsinformation "Ej strukturanpassad uppmärksamhetsinformation"
* extension[flag-detail].valueReference = Reference(SEAlertInformationIncidenceOfInfectiousDiseaseObservationExample) "blodsmitta hos gravid"
* subject = Reference(SEAlertInformationPatientExample)

