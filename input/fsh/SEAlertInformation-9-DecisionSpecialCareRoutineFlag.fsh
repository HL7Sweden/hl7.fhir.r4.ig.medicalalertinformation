Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-9-DecisionSpecialCareRoutineFlag
Parent: SEAlertInformationFlag
Title: "Beslut som kan leda till särskild vårdrutin"
Description: "Profil för att hantera uppmärksamhetssignalen Beslut som kan leda till särskild vårdrutin."
* code from SEAlertInformationDecisionSpecialCareRoutineSnomedCT (required)
* subject only Reference(SEAlertInformationPatient)
* category = #9 "DecisionSpecialCareRoutine"
* extension[flag-detail] 0..0
* extension[criticalityLevel] 0..0

ValueSet: SEAlertInformationDecisionSpecialCareRoutineICD10SE
Title: "ICD-10-SE koder för beslut om särskild vårdrutin"
Description: "Urval av ICD-10-SE koder relaterade till beslut om särskild vårdrutin."
* include $ICD#Z22.3 "Bärare av Staphylococcus aureus"
* include $ICD#Z22.1 "Bärare av vancomycinresistenta enterokocker"
* include $ICD#Z22.2 "Bärare av ESBL-producerande bakterier"
* include $ICD#Z22.4 "Bärare av multiresistenta bakterier"

ValueSet: SEAlertInformationDecisionSpecialCareRoutineSnomedCT
Title: "Snomed CT koder för beslut om särskild vårdrutin"
Description: "Urval av Snomed CT koder relaterade till beslut om särskild vårdrutin."
* include $SCT#123456 "Bärare av Staphylococcus aureus"
* include $SCT#234567 "Bärare av vancomycinresistenta enterokocker"
* include $SCT#345678 "Bärare av ESBL-producerande bakterier"
* include $SCT#456789 "Bärare av multiresistenta bakterier"
