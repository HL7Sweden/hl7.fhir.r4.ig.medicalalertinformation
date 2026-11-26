Profile: SEAlertInformation-10-UncategorizedFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation 10 Uncategorized Flag"
Description: "Uncategorized medical alert information refers here to historically recorded medical alert information that does not meet the current requirements for information structure, as well as medical alert information that is not nationally agreed. This is documented using the document class in the reference model.

[Mapping to UMI](StructureDefinition-SEAlertInformation-10-UncategorizedFlag-mappings.html)"
* insert AlertInformationCategory(E, E1)

Instance: SEAlertInformation-10-UncategorizedFlagExample
InstanceOf: SEAlertInformation-10-UncategorizedFlag
Title: "Example 10: Uncategorized medical alert information"
Description: "Minimal example of historically recorded unstructured medical alert information."
* status = #active
* category[mainGroup] = SEAlertInformationCategoryCS#E
* category[subGroup] = SEAlertInformationCategoryCS#E1
* code = $ICD10SE#"A49.9" "Bakteriell infektion, ospecificerad"
* extension[alertLabel].valueCodeableConcept = SEAlertLabelCS#ej-strukturanpassad-uppmarksamhetsinformation "Ej strukturanpassad uppmärksamhetsinformation"
* subject = Reference(SEAlertInformationPatientExample)

Mapping:  SEAlertInformation-10-UncategorizedFlagToUMI
Source:   SEAlertInformation-10-UncategorizedFlag
Target: "https://www.ehalsomyndigheten.se/verksamhet/ndi/interoperabilitet/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Mapping from the elements of this profile to the classes and attributes of the information specification for medical alert information (UMI), version 6.1.2. For each element, the mapping gives the UMI class and attribute that the element corresponds to, and how the value is set."
* code -> "Typ av uppmärksamhetsinformation (huvudgrupp).Ej strukturanpassad uppmärksamhetsinformation"
* period.start -> "Ej strukturanpassad uppmärksamhetsinformation.dokumentationstidpunkt" 
* subject -> "Patient"
* category -> "Typ av uppmärksamhetsinformation (huvudgrupp)"