Profile: SEAlertInformation-10-UnstructuredFlag
Parent: SEAlertInformationFlag
Title: "Unstructured alert information"
Description: "Non-structured attention information refers to historically recorded attention information that does not meet current requirements for information structure.

[Mapping to UMI](StructureDefinition-SEAlertInformation-10-UnstructuredFlag-mappings.html)"
* subject only Reference(SEAlertInformationPatient)
* category = SEAlertInformationCategoryCS#E1 "Historically recorded medical alert information"
// * category = #E1 "Historiskt angiven uppmarksamhetsinformation"
* extension[flag-detail] 0..0
* extension[criticalityLevel] 0..0

Instance: SEAlertInformation-10-UnstructuredFlagExample
InstanceOf: SEAlertInformation-10-UnstructuredFlag
Description: "Minimal example of historically recorded unstructured medical alert information."
* status = #active
* code = $ICD10SE#"A49.9" "Bakteriell infektion, ospecificerad"
* extension[alertLabel].valueCodeableConcept = SEAlertLabelCS#ej-strukturanpassad-uppmarksamhetsinformation "Ej strukturanpassad uppmärksamhetsinformation"
* subject = Reference(SEAlertInformationPatientExample)

Mapping:  SEAlertInformation-10-UnstructuredFlagToUMI
Source:   SEAlertInformation-10-UnstructuredFlag
Target: "https://www.socialstyrelsen.se/kunskapsstod-och-regler/omraden/e-halsa/tillampning/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Description..."
* code -> "Typ av uppmärksamhetsinformation (huvudgrupp).Ej strukturanpassad uppmärksamhetsinformation"
* period.start -> "Ej strukturanpassad uppmärksamhetsinformation.dokumentationstidpunkt" 
* subject -> "Patient"
* category -> "Typ av uppmärksamhetsinformation (huvudgrupp)"