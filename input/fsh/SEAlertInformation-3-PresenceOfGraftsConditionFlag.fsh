// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-3-PresenceOfGraftsConditionFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation 3 Presence Of Grafts Condition Flag Profile"
Description: "Indicates the presence of grafts in the patient, such as transplanted organs or tissues. Attention information regarding grafts is considered current if there is a documented occurrence of the graft in the patient, and no later record indicating that the graft is no longer present.

[Mapping to UMI](StructureDefinition-SEAlertInformation-3-PresenceOfGraftsConditionFlag-mappings.html)"
* code from SEAlertInformationPresenceOfGraftsConditionVS (required)
* subject only Reference(SEAlertInformationPatient)
* category = SEAlertInformationCategoryCS#A3 "Presence of transplant"
// * category = #A3 "Förekomst av transplantat"
* extension[flag-detail] 0..0
* extension[criticalityLevel] 0..0

Instance: SEAlertInformation-3-PresenceOfGraftsConditionFlagExample
InstanceOf: SEAlertInformation-3-PresenceOfGraftsConditionFlag
Description: "Minimal example of alert information about presence of a graft or transplant."
* status = #active
* code = $SCT#737295003 "transplanterad njure föreligger"
* extension[alertLabel].valueCodeableConcept = SEAlertLabelCS#blodsmitta-hos-gravid "Blodsmitta hos gravid"
* subject = Reference(SEAlertInformationPatientExample)

ValueSet: SEAlertInformationPresenceOfGraftsConditionVS
Id: a1.2.752.116.3.1.16.1.3
Title: "Attention information - Presence of grafts"
Description: "Attention information - Presence of grafts."
* ^experimental = false
* include codes from valueset SEAlertInformationMedicalConditionSnomedVS
* include codes from valueset SEAlertInformationPresenceOfGraftsConditionOccurrenceSnomedVS
* include codes from valueset SEAlertInformationPresenceOfGraftsConditionSnomedVS

ValueSet: SEAlertInformationPresenceOfGraftsConditionSnomedICDVS
Id: 1.2.752.116.3.1.16.1.4.1
Title: "Presence of grafts ICD-10-SE"
Description: "ICD-10-SE codes for presence of grafts alert information."
* ^experimental = false
* include $ICD10SE#"Z94.0" "Njurtransplanterad"
* include $ICD10SE#"Z94.1" "Hjärttransplanterad"
* include $ICD10SE#"Z94.2" "Lungtransplanterad"
* include $ICD10SE#"Z94.4" "Levertransplanterad"
* include $ICD10SE#"Z94.8" "Andra specificerade transplantationstillstand"

ValueSet: SEAlertInformationPresenceOfGraftsConditionSnomedVS
Id: 59861000052106
Title: "Selection of grafts, attention information"
Description: "SNOMED CT graft material codes for presence of grafts alert information."
* ^experimental = false
* include $SCT#413478009 "allogen benmärgsvätska"
* include $SCT#413604003 "autolog benmärgsvätska"
* include $SCT#413679007 "benmärgsvätska"
* include $SCT#420291005 "transplantatmaterial från hjärta"
* include $SCT#420852008 "transplantatmaterial från njure"
* include $SCT#421263007 "transplantatmaterial från pankreas"
* include $SCT#421525000 "transplantatmaterial från lunga"
* include $SCT#421751001 "transplantatmaterial från lever"
* include $SESCT#"73341000052100" "transplantatmaterial från tarm"

ValueSet: SEAlertInformationPresenceOfGraftsConditionOccurrenceSnomedVS
Id: 113471000052100
Title: "Selection of presence of grafts, attention information"
Description: "SNOMED CT occurrence codes for presence of grafts alert information."
* ^experimental = false
* include $SESCT#"413781000052107" "stamcelltransplantat föreligger"
* include $SESCT#"73111000052103" "transplanterad pankreas föreligger"
* include $SESCT#"73131000052108" "transplanterad tarm föreligger"
* include $SCT#737295003 "transplanterad njure föreligger"
* include $SCT#737296002 "transplanterad lunga föreligger"
* include $SCT#737297006 "transplanterad lever föreligger"
* include $SCT#739024006 "transplanterat hjarta foreligger"

Mapping:  SEAlertInformation-3-PresenceOfGraftsConditionFlagToUMI
Source:   SEAlertInformation-3-PresenceOfGraftsConditionFlag
Target: "https://www.socialstyrelsen.se/kunskapsstod-och-regler/omraden/e-halsa/tillampning/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Description..."
// * code -> "Implantation(Aktivitet).kod Förekomst av implantat(Observation).värde" 
* code -> "Uppmarksamhetsinformation Forekomst av transplantat (1.2.752.116.3.1.16.1.4)"
// TODO: Lägg till mappning till aktiviteterna för att sätta status
* status -> "Transplantation(Aktivitet) Avlagsnande av transplantat(Aktivitet) Forekomst av transplantat(Observation)" "Flag.status ska sattas enligt foljande: observerad forekomst & negation = falskt -> active observerad forekomst & negation = sant -> inactive. entered-in-error anvands inte."
* period.start -> "Transplantation(Aktivitet).tid Forekomst av transplantat(Observation).tid" 
* period.end -> "Avlagsnande av transplantat(Aktivitet).tid.sluttid Forekomst av transplantat(Observation).tid" 
* subject -> "Patient"
* category -> "Typ av uppmärksamhetsinformation (huvudgrupp)"

