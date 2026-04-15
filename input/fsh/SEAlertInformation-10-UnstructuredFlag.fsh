Profile: SEAlertInformation-10-UnstructuredFlag
Parent: SEAlertInformationFlag
Title: "Unstructured alert information"
Description: "Non-structured attention information refers to historically recorded attention information that does not meet current requirements for information structure.

[Mapping to UMI](StructureDefinition-SEAlertInformation-10-UnstructuredFlag-mappings.html)"
* subject only Reference(SEAlertInformationPatient)
* category = #10 "Unstructured"
* extension[flag-detail] 0..0
* extension[criticalityLevel] 0..0

Mapping:  SEAlertInformation-10-UnstructuredFlagToUMI
Source:   SEAlertInformation-10-UnstructuredFlag
Target:   "UMI"
Id:       UMI
Title:    "UMI"
Description: "Description..."
* code -> "Typ av uppmärksamhetsinformation (huvudgrupp).Ej strukturanpassad uppmärksamhetsinformation"
* period.start -> "Ej strukturanpassad uppmärksamhetsinformation.dokumentationstidpunkt" 
* subject -> "Patient"
* category -> "Typ av uppmärksamhetsinformation (huvudgrupp)"