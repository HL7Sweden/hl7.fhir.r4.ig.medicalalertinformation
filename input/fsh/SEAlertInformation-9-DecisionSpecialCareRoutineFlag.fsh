Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-9-DecisionSpecialCareRoutineFlag
Parent: SEAlertInformationFlag
// Title: "Beslut som kan leda till särskild vårdrutin"
Title: "SE AlertInformation 9 Decision Special Care Routine Flag"
// Description: "Profil för att hantera uppmärksamhetssignalen Beslut som kan leda till särskild vårdrutin."
Description: "For example, a decision made during an end-of-life care conversation (brytpunktssamtal) about palliative care at the end of life. This is documented using the decision class in the reference model. The decision is made by the patient, by healthcare professionals or jointly. Medical alert information about a decision on a special care routine is considered current if there is a documented decision on a special care routine that has not been revoked by a later documented decision. Note that decisions about cardiopulmonary resuscitation and life-sustaining treatment imply a special care routine when the attribute approval (bifall) has the value false, whereas decisions about palliative care, issuing of a prescription restriction and referral to a specific care unit imply a special care routine when approval has the value true.

[Mapping to UMI](StructureDefinition-SEAlertInformation-9-DecisionSpecialCareRoutineFlag-mappings.html)"
* code from SEAlertInformationDecisionSpecialCareRoutineSnomedCT (required)
* insert AlertInformationCategory(D, D2)
// The note extension is defined for R5 and published for R4 in the FHIR extensions package
* extension contains http://hl7.org/fhir/StructureDefinition/note|5.4.1 named note 0..1
* extension[note] ^short = "Description of the decision"
* extension[note] ^definition = "Description of the decision that can lead to a special care routine (Beslut som kan leda till särskild vårdrutin.beskrivning)."

Instance: SEAlertInformation-9-DecisionSpecialCareRoutineFlagExample
InstanceOf: SEAlertInformation-9-DecisionSpecialCareRoutineFlag
Title: "Example 9: Decision special care routine"
Description: "Minimal example of a decision that may lead to a special care routine."
* status = #active
* category[mainGroup] = SEAlertInformationCategoryCS#D
* category[subGroup] = SEAlertInformationCategoryCS#D2
* code = $SCT#306103005 "Referral to department"
* extension[alertLabel].valueCodeableConcept = SEAlertLabelCS#hanvisning-finns-till-en-specifik-vardenhet "Hänvisning finns till en specifik vårdenhet"
* extension[note].valueAnnotation.text = "Vid akut försämring ska patienten hänvisas till hematologiska kliniken."
* subject = Reference(SEAlertInformationPatientExample)

ValueSet: SEAlertInformationDecisionSpecialCareRoutineSnomedCT
Id: 103491000052103
// Title: "Snomed CT koder för beslut om särskild vårdrutin"
Title: "Decision Special Care Routine Snomed CT"
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
Target: "https://www.ehalsomyndigheten.se/verksamhet/ndi/interoperabilitet/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Mapping from the elements of this profile to the classes and attributes of the information specification for medical alert information (UMI), version 6.1.2. For each element, the mapping gives the UMI class and attribute that the element corresponds to, and how the value is set."
* code -> "Urval särskilda vårdrutiner utifrån fattade beslut, uppmärksamhetsinformation (103491000052103)"
* status -> "Beslut som kan leda till särskild vårdrutin(Beslut).bifall. Om bifall = true → active, om bifall = false → inactive."
* period.start -> "Beslut som kan leda till särskild vårdrutin(Beslut).tidpunkt" 
* subject -> "Patient"
* category -> "Typ av uppmärksamhetsinformation (huvudgrupp)"
* extension[note] -> "Beslut som kan leda till särskild vårdrutin(Beslut).beskrivning"
