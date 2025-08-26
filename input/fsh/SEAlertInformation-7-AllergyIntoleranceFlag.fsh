Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-7-AllergyIntoleranceFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation 7 Allergy Intolerance Flag Profile"
Description: "Swedish profile of the Flag resource used for alert information about allergy intolerance."
* code from SEAlertInformationChemicalAllergySnomedVS (required)
* subject only Reference(SEAlertInformationPatient)
* category = #7 "Allergy Intolerance"
* extension[flag-detail] 0..0
* extension[criticalityLevel] 0..0

ValueSet: SEAlertInformationChemicalAllergySnomedVS
Id: 59871000052102
Title: "Urval kemikalieöverkänsligheter, uppmärksamhetsinformation"
* include $SCT#373568007 "klorhexidin"
* include $SCT#111088007 "latex"
* include $SCT#281000220103 "taurolidin"


