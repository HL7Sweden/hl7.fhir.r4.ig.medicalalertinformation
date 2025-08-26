Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-8-SpecialCareRoutineFlag
Parent: SEAlertInformationFlag
Title: "Information som kan leda till särskild vårdrutin"
Description: "Profil för att hantera uppmärksamhetssignalen Information som kan leda till särskild vårdrutin."
* code from SEAlertInformationSpecialCareRoutineICD10SE (required)
* subject only Reference(SEAlertInformationPatient)
* category = #8 "SpecialCareRoutine"
* extension[flag-detail] 0..0
* extension[criticalityLevel] 0..0

ValueSet: SEAlertInformationSpecialCareRoutineICD10SE
Title: "ICD-10-SE koder för särskild vårdrutin"
Description: "Urval av ICD-10-SE koder relaterade till särskild vårdrutin."
* include $ICD#Z22.3 "Bärare av Staphylococcus aureus"
* include $ICD#Z22.1 "Bärare av vancomycinresistenta enterokocker"
* include $ICD#Z22.2 "Bärare av ESBL-producerande bakterier"
* include $ICD#Z22.4 "Bärare av multiresistenta bakterier"

ValueSet: SEAlertInformationSpecialCareRoutineSnomedCT
Title: "Snomed CT koder för särskild vårdrutin"
Description: "Urval av Snomed CT koder relaterade till särskild vårdrutin."
* include $SCT#123456 "Bärare av Staphylococcus aureus"
* include $SCT#234567 "Bärare av vancomycinresistenta enterokocker"
* include $SCT#345678 "Bärare av ESBL-producerande bakterier"
* include $SCT#456789 "Bärare av multiresistenta bakterier"
