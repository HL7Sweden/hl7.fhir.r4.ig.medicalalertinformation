Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-3-PresenceOfTransplantFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation 3 Presence of Transplant Flag"
Description: "That the patient has, or does not have, a transplant, i.e. surgically transferred living tissue. This is documented using the observation class in the reference model. Information about a transplant is to be highlighted if there is a documented transplantation or presence of transplant in the patient, and no later documented negation of the presence of the transplant. The transplants that need to be highlighted are listed in the [value set for presence of transplant](ValueSet-1.2.752.116.3.1.16.1.4.html).

[Mapping to UMI](StructureDefinition-SEAlertInformation-3-PresenceOfTransplantFlag-mappings.html)"
* code from SEAlertInformationPresenceOfTransplantVS (required)
* insert AlertInformationCategory(A, A3)

Instance: SEAlertInformation-3-PresenceOfTransplantFlagExample
InstanceOf: SEAlertInformation-3-PresenceOfTransplantFlag
Title: "Example 3: Presence of transplant"
Description: "Minimal example of medical alert information about presence of a transplant."
* status = #active
* category[mainGroup] = SEAlertInformationCategoryCS#A
* category[subGroup] = SEAlertInformationCategoryCS#A3
* code = $SCT#737295003 "transplanterad njure föreligger"
* code.text = "Njurtransplanterad"
* subject = Reference(SEAlertInformationPatientExample)

ValueSet: SEAlertInformationPresenceOfTransplantVS
Id: 1.2.752.116.3.1.16.1.4
Title: "Alert Information – Presence of Transplant"
Description: "Codes for medical alert information about presence of transplant (Uppmärksamhetsinformation Förekomst av transplantat): the ICD-10-SE and SNOMED CT subsets."
* ^experimental = false
* include codes from valueset SEAlertInformationPresenceOfTransplantICDVS
* include codes from valueset SEAlertInformationPresenceOfTransplantSnomedVS
* include codes from valueset SEAlertInformationTransplantSnomedVS

ValueSet: SEAlertInformationPresenceOfTransplantICDVS
Id: 1.2.752.116.3.1.16.1.4.1
Title: "Presence of Transplant ICD-10-SE"
Description: "ICD-10-SE codes for medical alert information about presence of transplant."
* ^experimental = false
* include $ICD10SE#"Z94.0" "Njurtransplanterad"
* include $ICD10SE#"Z94.1" "Hjärttransplanterad"
* include $ICD10SE#"Z94.2" "Lungtransplanterad"
* include $ICD10SE#"Z94.4" "Levertransplanterad"
* include $ICD10SE#"Z94.8" "Andra specificerade transplantationstillstand"

ValueSet: SEAlertInformationTransplantSnomedVS
Id: 59861000052106
Title: "Transplants Snomed CT"
Description: "SNOMED CT codes for transplant material, used for medical alert information about presence of transplant."
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

ValueSet: SEAlertInformationPresenceOfTransplantSnomedVS
Id: 113471000052100
Title: "Presence of Transplant Snomed CT"
Description: "SNOMED CT codes for medical alert information about presence of transplant."
* ^experimental = false
* include $SESCT#"413781000052107" "stamcelltransplantat föreligger"
* include $SESCT#"73111000052103" "transplanterad pankreas föreligger"
* include $SESCT#"73131000052108" "transplanterad tarm föreligger"
* include $SCT#737295003 "transplanterad njure föreligger"
* include $SCT#737296002 "transplanterad lunga föreligger"
* include $SCT#737297006 "transplanterad lever föreligger"
* include $SCT#739024006 "transplanterat hjarta foreligger"

Mapping:  SEAlertInformation-3-PresenceOfTransplantFlagToUMI
Source:   SEAlertInformation-3-PresenceOfTransplantFlag
Target: "https://www.ehalsomyndigheten.se/verksamhet/ndi/interoperabilitet/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Mapping from the elements of this profile to the classes and attributes of the information specification for medical alert information (UMI), version 6.1.2. The mappings common to all medical alert information (subject, category) are given in the profile SE AlertInformation Flag."
* code -> "Förekomst av transplantat(Observation).värde" "A code from the value set Uppmärksamhetsinformation Förekomst av transplantat (1.2.752.116.3.1.16.1.4). The class Transplantation is not mapped, since documentation of a transplantation implies presence of transplant. Kroppsstruktur is not handled."
* status -> "Förekomst av transplantat(Observation).status, negation" "Flag.status is set as follows: observed presence (observerad förekomst) and negation = false → active; observed presence and negation = true → inactive. entered-in-error is not used."
* period -> "Förekomst av transplantat(Observation).tid"
