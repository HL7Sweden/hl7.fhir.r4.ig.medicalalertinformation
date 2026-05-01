Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-9-DecisionSpecialCareRoutineFlag
Parent: SEAlertInformationFlag
// Title: "Beslut som kan leda till särskild vårdrutin"
Title: "Decision that may require special care routine"
// Description: "Profil för att hantera uppmärksamhetssignalen Beslut som kan leda till särskild vårdrutin."
Description: "Indicates a decision that may lead to special care routines for the patient, such as specific interventions or treatments based on the patient’s condition or needs.

[Mapping to UMI](StructureDefinition-SEAlertInformation-9-DecisionSpecialCareRoutineFlag-mappings.html)"
* code from SEAlertInformationDecisionSpecialCareRoutineSnomedCT (required)
* subject only Reference(SEAlertInformationPatient)
* category = SEAlertInformationCategoryCS#D2 "Decision that can lead to special care routine"
// * category = #D2 "Beslut som kan leda till sarskild vardrutin"
* extension[flag-detail] 0..0
* extension[criticalityLevel] 0..0

Instance: SEAlertInformation-9-DecisionSpecialCareRoutineFlagExample
InstanceOf: SEAlertInformation-9-DecisionSpecialCareRoutineFlag
Description: "Minimal example of a decision that may lead to a special care routine."
* status = #active
* code = $SCT#306103005 "Referral to department"
* extension[alertLabel].valueCodeableConcept = SEAlertLabelCS#blodsmitta-hos-gravid "Blodsmitta hos gravid"
* subject = Reference(SEAlertInformationPatientExample)

ValueSet: SEAlertInformationDecisionSpecialCareRoutineSnomedCT
Id: 103491000052103
// Title: "Snomed CT koder för beslut om särskild vårdrutin"
Title: "Snomed CT codes for decision about special care routine"
// Description: "Urval av Snomed CT koder relaterade till beslut om särskild vårdrutin."
Description: "Selection of Snomed CT codes related to decision about special care routine."
* ^experimental = false
* include $SESCT#"133571000052106" "utfärdande av förskrivningsrestriktion"
* include $SCT#306103005 "hänvisning till specifik vårdenhet"
* include $SESCT#"60741000052100" "läkarbeslut finns från brytpunktssamtal"
* include $SESCT#"61921000052102" "läkarbeslut finns om att inte utföra hjärt-lungräddning"
* include $SESCT#"61931000052100" "läkarbeslut finns om att avsluta livsuppehållande behandling"

Mapping:  SEAlertInformation-9-DecisionSpecialCareRoutineFlagToUMI
Source:   SEAlertInformation-9-DecisionSpecialCareRoutineFlag
Target: "https://www.socialstyrelsen.se/kunskapsstod-och-regler/omraden/e-halsa/tillampning/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Description..."
* code -> "Urval särskilda vårdrutiner utifrån fattade beslut, uppmärksamhetsinformation (103491000052103)"
* status -> "Beslut som kan leda till särskild vårdrutin(Beslut).bifall. Om bifall = true → active, om bifall = false → inactive."
* period.start -> "Beslut som kan leda till särskild vårdrutin(Beslut).tidpunkt" 
* subject -> "Patient"
* category -> "Typ av uppmärksamhetsinformation (huvudgrupp)"
