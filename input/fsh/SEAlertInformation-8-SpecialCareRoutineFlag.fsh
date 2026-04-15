Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-8-SpecialCareRoutineFlag
Parent: SEAlertInformationFlag
// Title: "Information som kan leda till särskild vårdrutin"
Title: "Information that may require special care routine"
// Description: "Profil för att hantera uppmärksamhetssignalen Information som kan leda till särskild vårdrutin."
Description: "Indicates information that may lead to special care routines for the patient, such as specific interventions or treatments based on the patient’s condition or needs.

[Mapping to UMI](StructureDefinition-SEAlertInformation-8-SpecialCareRoutineFlag-mappings.html)"
* code from SEAlertInformationSpecialCareRoutineICD10SE (required)
* subject only Reference(SEAlertInformationPatient)
* category = #8 "SpecialCareRoutine"
* extension[flag-detail] 0..0
* extension[criticalityLevel] 0..0

ValueSet: SEAlertInformationSpecialCareRoutineICD10SE
// Title: "ICD-10-SE koder för särskild vårdrutin"
Title: "ICD-10-SE codes for special care routine"
// Description: "Urval av ICD-10-SE koder relaterade till särskild vårdrutin."
Description: "Selection of ICD-10-SE codes related to special care routine."
* include $ICD#Z22.3 "Bärare av Staphylococcus aureus"
* include $ICD#Z22.1 "Bärare av vancomycinresistenta enterokocker"
* include $ICD#Z22.2 "Bärare av ESBL-producerande bakterier"
* include $ICD#Z22.4 "Bärare av multiresistenta bakterier"

ValueSet: SEAlertInformationSpecialCareRoutineSnomedCT
// Title: "Snomed CT koder för särskild vårdrutin"
Title: "Snomed CT codes for special care routine"
// Description: "Urval av Snomed CT koder relaterade till särskild vårdrutin."
Description: "Selection of Snomed CT codes related to special care routine."
* include $SCT#123456 "Bärare av Staphylococcus aureus"
* include $SCT#234567 "Bärare av vancomycinresistenta enterokocker"
* include $SCT#345678 "Bärare av ESBL-producerande bakterier"
* include $SCT#456789 "Bärare av multiresistenta bakterier"

Mapping:  SEAlertInformation-8-SpecialCareRoutineFlagToUMI
Source:   SEAlertInformation-8-SpecialCareRoutineFlag
Target:   "UMI"
Id:       UMI
Title:    "UMI"
Description: "Description..."
* code -> "Urval särskilda vårdrutiner, uppmärksamhetsinformation (59881000052100)"
* status -> "Information som kan leda till särskild vårdrutin(Observation).negation. Om negation = true → inactive, om negation = false → active."
* period.start -> "Information som kan leda till särskild vårdrutin(Observation).tid" 
* subject -> "Patient"
* category -> "Typ av uppmärksamhetsinformation (huvudgrupp)"
