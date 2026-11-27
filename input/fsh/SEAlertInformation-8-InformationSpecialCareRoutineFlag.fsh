Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-8-InformationSpecialCareRoutineFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation 8 Information Special Care Routine Flag"
Description: "For example, that there is a threat against the patient. This is documented using the observation class in the reference model. The information is considered current if it is documented, and there is no later documentation stating that it no longer applies.

[Mapping to UMI](StructureDefinition-SEAlertInformation-8-InformationSpecialCareRoutineFlag-mappings.html)"
* code from SEAlertInformationSpecialCareRoutineSnomedCT (required)
* insert AlertInformationCategory(D, D1)

Instance: SEAlertInformation-8-InformationSpecialCareRoutineFlagExample
InstanceOf: SEAlertInformation-8-InformationSpecialCareRoutineFlag
Title: "Example 8: Information special care routine"
Description: "Minimal example of information that can lead to a special care routine."
* status = #active
* category[mainGroup] = SEAlertInformationCategoryCS#D
* category[subGroup] = SEAlertInformationCategoryCS#D1
* code = $SCT#699128009 "Blood transfusion declined"
* code.text = "Patienten accepterar ej blod- eller plasmatransfusion"
* subject = Reference(SEAlertInformationPatientExample)

ValueSet: SEAlertInformationSpecialCareRoutineSnomedCT
Id: 59881000052100
Title: "Information Special Care Routine Snomed CT"
Description: "SNOMED CT codes for information that can lead to special care routine."
* ^experimental = false
* include $SESCT#"1304232008" "deltar i klinisk prövning"
* include $SESCT#"60761000052104" "avböjt autolog blodtransfusion eller cell saver"
* include $SESCT#"60781000052105" "hotbild mot patient"
* include $SCT#699128009 "avböjt transfusion av blodprodukt"
* include $SCT#713670002 "deltar i klinisk läkemedelsprövning"

Mapping:  SEAlertInformation-8-InformationSpecialCareRoutineFlagToUMI
Source:   SEAlertInformation-8-InformationSpecialCareRoutineFlag
Target: "https://www.ehalsomyndigheten.se/verksamhet/ndi/interoperabilitet/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Mapping from the elements of this profile to the classes and attributes of the information specification for medical alert information (UMI), version 6.1.2. The mappings common to all medical alert information (subject, category) are given in the profile SE AlertInformation Flag."
* code -> "Information som kan leda till särskild vårdrutin(Observation).värde" "A code from the value set urval särskilda vårdrutiner, uppmärksamhetsinformation (59881000052100)."
* status -> "Information som kan leda till särskild vårdrutin(Observation).status, negation" "Flag.status is set as follows: observed presence (observerad förekomst) and negation = false → active; observed presence and negation = true → inactive. entered-in-error is not used."
* period -> "Information som kan leda till särskild vårdrutin(Observation).tid"
