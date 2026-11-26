Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-6-PresenceOfInfectiousDiseaseFlag
Parent: SEAlertInformationFlag
// Title: "SE AlertInformation 6 Förekomst av smittsam sjukdom"
Title: "SE AlertInformation 6 Presence of Infectious Disease Flag"
// Description: "Profil för att hantera uppmärksamhetssignalen Förekomst av smittsam sjukdom."
Description: "That the patient has, or does not have, an infectious disease. This is documented using the observation class in the reference model. Medical alert information about an infectious disease is considered current if there is a documented presence of the infectious disease in the patient, and no later record stating that the patient no longer has it. The infectious diseases that need to be highlighted are listed in the [value set for presence of infectious disease](ValueSet-1.2.752.116.3.1.16.1.6.html).

[Mapping to UMI](StructureDefinition-SEAlertInformation-6-PresenceOfInfectiousDiseaseFlag-mappings.html)"
* code from SEAlertInformationPresenceOfInfectiousDiseaseVS (required)
* insert AlertInformationCategory(B, B2)

Instance: SEAlertInformation-6-PresenceOfInfectiousDiseaseFlagExample
InstanceOf: SEAlertInformation-6-PresenceOfInfectiousDiseaseFlag
Title: "Example 6: Presence of infectious disease"
// Description: "Exempel på uppmärksamhetssignal för förekomst av smittsam sjukdom"
Description: "Minimal example of alert information about presence of an infectious disease."
* status = #active
* category[mainGroup] = SEAlertInformationCategoryCS#B
* category[subGroup] = SEAlertInformationCategoryCS#B2
* code = $SESCT#"64301000052105" "blodsmitta hos gravid"
* extension[alertLabel].valueCodeableConcept = SEAlertLabelCS#blodsmitta-hos-gravid "Blodsmitta hos gravid"
* subject = Reference(SEAlertInformationPatientExample)

ValueSet: SEAlertInformationPresenceOfInfectiousDiseaseSnomedVS
Id: 60661000052106
// Title: "Urval smittsamma sjukdomar, uppmärksamhetsinformation"
Title: "Presence of Infectious Disease Snomed CT"
// Description: "Urval av Snomed CT koder relaterade till smittsamma sjukdomar."
Description: "SNOMED CT codes for alert information about presence of infectious disease."
* ^experimental = false
* include $SESCT#"64301000052105" "blodsmitta hos gravid"

ValueSet: SEAlertInformationPresenceOfInfectiousDiseaseICDVS
Id: 1.2.752.116.3.1.16.1.6.1
// Title: "Förekomst av smittsam sjukdom ICD-10-SE"
Title: "Presence of Infectious Disease ICD-10-SE"
Description: "ICD-10-SE codes for alert information about presence of infectious disease. The code list for medical alert information (version 6.1.2) contains no ICD-10-SE codes for this subgroup, so the value set is currently empty."
* ^experimental = false

ValueSet: SEAlertInformationPresenceOfInfectiousDiseaseVS
Id: 1.2.752.116.3.1.16.1.6
// Title: "Uppmärksamhetsinformation Förekomst av smittsam sjukdom"
Title: "Alert Information Presence of Infectious Disease"
Description: "Codes for alert information about presence of infectious disease. Only the SNOMED CT subset is included, since the ICD-10-SE subset is empty in the code list."
* ^experimental = false
* include codes from valueset SEAlertInformationPresenceOfInfectiousDiseaseSnomedVS

Mapping:  SEAlertInformation-6-PresenceOfInfectiousDiseaseFlagToUMI
Source:   SEAlertInformation-6-PresenceOfInfectiousDiseaseFlag
Target: "https://www.ehalsomyndigheten.se/verksamhet/ndi/interoperabilitet/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Mapping from the elements of this profile to the classes and attributes of the information specification for medical alert information (UMI), version 6.1.2. For each element, the mapping gives the UMI class and attribute that the element corresponds to, and how the value is set."
* code -> "Uppmärksamhetsinformation Förekomst av smittsam sjukdom (1.2.752.116.3.1.16.1.6)"
* status -> "Förekomst av smittsam sjukdom(Observation).negation. Om negation = true → inactive, om negation = false → active."
* period.start -> "Förekomst av smittsam sjukdom(Observation).tid" 
* subject -> "Patient"
* category -> "Typ av uppmärksamhetsinformation (huvudgrupp)"