Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-8-SpecialCareRoutineFlag
Parent: SEAlertInformationFlag
// Title: "Information som kan leda till särskild vårdrutin"
Title: "Information that may require special care routine"
// Description: "Profil för att hantera uppmärksamhetssignalen Information som kan leda till särskild vårdrutin."
Description: "Indicates information that may lead to special care routines for the patient, such as specific interventions or treatments based on the patient’s condition or needs.

[Mapping to UMI](StructureDefinition-SEAlertInformation-8-SpecialCareRoutineFlag-mappings.html)"
* code from SEAlertInformationSpecialCareRoutineSnomedCT (required)
* subject only Reference(SEAlertInformationPatient)
* category = SEAlertInformationCategoryCS#D1 "Information that can lead to special care routine"
// * category = #D1 "Information som kan leda till sarskild vardrutin"
* extension[flag-detail] 0..0
* extension[criticalityLevel] 0..0

Instance: SEAlertInformation-8-SpecialCareRoutineFlagExample
InstanceOf: SEAlertInformation-8-SpecialCareRoutineFlag
Description: "Minimal example of information that may lead to a special care routine."
* status = #active
* code = $SCT#699128009 "Blood transfusion declined"
* extension[alertLabel].valueCodeableConcept = SEAlertLabelCS#blodsmitta-hos-gravid "Blodsmitta hos gravid"
* subject = Reference(SEAlertInformationPatientExample)

ValueSet: SEAlertInformationSpecialCareRoutineSnomedCT
Id: 59881000052100
// Title: "Snomed CT koder för särskild vårdrutin"
Title: "Snomed CT codes for special care routine"
// Description: "Urval av Snomed CT koder relaterade till särskild vårdrutin."
Description: "Selection of Snomed CT codes related to special care routine."
* ^experimental = false
* include $SESCT#"1304232008"
* include $SESCT#"60761000052104" "avböjt autolog blodtransfusion eller cell saver"
* include $SESCT#"60781000052105" "hotbild mot patient"
* include $SCT#699128009 "avböjt transfusion av blodprodukt"
* include $SCT#713670002 "deltar i klinisk läkemedelsprövning"

Mapping:  SEAlertInformation-8-SpecialCareRoutineFlagToUMI
Source:   SEAlertInformation-8-SpecialCareRoutineFlag
Target: "https://www.socialstyrelsen.se/kunskapsstod-och-regler/omraden/e-halsa/tillampning/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Description..."
* code -> "Urval särskilda vårdrutiner, uppmärksamhetsinformation (59881000052100)"
* status -> "Information som kan leda till särskild vårdrutin(Observation).negation. Om negation = true → inactive, om negation = false → active."
* period.start -> "Information som kan leda till särskild vårdrutin(Observation).tid" 
* subject -> "Patient"
* category -> "Typ av uppmärksamhetsinformation (huvudgrupp)"
