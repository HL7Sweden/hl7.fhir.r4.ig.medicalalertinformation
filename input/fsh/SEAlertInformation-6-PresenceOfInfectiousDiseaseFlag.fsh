Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-6-PresenceOfInfectiousDiseaseFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation 6 Presence of Infectious Disease Flag"
Description: "That the patient has, or does not have, an infectious disease. This is documented using the observation class in the reference model. Medical medical alert information about an infectious disease is considered current if there is a documented presence of the infectious disease in the patient, and no later record stating that the patient no longer has it. The infectious diseases that need to be highlighted are listed in the [value set for presence of infectious disease](ValueSet-1.2.752.116.3.1.16.1.6.html).

[Mapping to UMI](StructureDefinition-SEAlertInformation-6-PresenceOfInfectiousDiseaseFlag-mappings.html)"
* code from SEAlertInformationPresenceOfInfectiousDiseaseVS (required)
* insert AlertInformationCategory(B, B2)

Instance: SEAlertInformation-6-PresenceOfInfectiousDiseaseFlagExample
InstanceOf: SEAlertInformation-6-PresenceOfInfectiousDiseaseFlag
Title: "Example 6: Presence of infectious disease"
Description: "Minimal example of medical alert information about presence of an infectious disease."
* status = #active
* category[mainGroup] = SEAlertInformationCategoryCS#B
* category[subGroup] = SEAlertInformationCategoryCS#B2
* code = $SESCT#"64301000052105" "blodsmitta hos gravid"
* code.text = "Blodsmitta hos gravid"
* subject = Reference(SEAlertInformationPatientExample)

ValueSet: SEAlertInformationPresenceOfInfectiousDiseaseSnomedVS
Id: 60661000052106
Title: "Presence of Infectious Disease Snomed CT"
Description: "SNOMED CT codes for medical alert information about presence of infectious disease."
* ^experimental = false
* include $SESCT#"64301000052105" "blodsmitta hos gravid"

ValueSet: SEAlertInformationPresenceOfInfectiousDiseaseICDVS
Id: 1.2.752.116.3.1.16.1.6.1
Title: "Presence of Infectious Disease ICD-10-SE"
Description: "ICD-10-SE codes for medical alert information about presence of infectious disease. The code list for medical alert information (version 6.1.2) contains no ICD-10-SE codes for this subgroup, so the value set is currently empty."
* ^experimental = false

ValueSet: SEAlertInformationPresenceOfInfectiousDiseaseVS
Id: 1.2.752.116.3.1.16.1.6
Title: "Alert Information – Presence of Infectious Disease"
Description: "Codes for medical alert information about presence of infectious disease (Uppmärksamhetsinformation Förekomst av smittsam sjukdom): the SNOMED CT subset. The code list for medical alert information (version 6.1.2) contains no ICD-10-SE codes for this subgroup."
* ^experimental = false
* include codes from valueset SEAlertInformationPresenceOfInfectiousDiseaseSnomedVS

Mapping:  SEAlertInformation-6-PresenceOfInfectiousDiseaseFlagToUMI
Source:   SEAlertInformation-6-PresenceOfInfectiousDiseaseFlag
Target: "https://www.ehalsomyndigheten.se/verksamhet/ndi/interoperabilitet/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Mapping from the elements of this profile to the classes and attributes of the information specification for medical alert information (UMI), version 6.1.2. The mappings common to all medical alert information (subject, category) are given in the profile SE AlertInformation Flag."
* code -> "Förekomst av smittsam sjukdom(Observation).värde" "A code from the value set Uppmärksamhetsinformation Förekomst av smittsam sjukdom (1.2.752.116.3.1.16.1.6), for example blodsmitta hos gravid."
* status -> "Förekomst av smittsam sjukdom(Observation).status, negation" "Flag.status is set as follows: observed presence (observerad förekomst) and negation = false → active; observed presence and negation = true → inactive. entered-in-error is not used."
* period -> "Förekomst av smittsam sjukdom(Observation).tid"
