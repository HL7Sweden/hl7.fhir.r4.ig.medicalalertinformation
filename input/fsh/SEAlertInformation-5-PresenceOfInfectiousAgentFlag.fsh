Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-5-PresenceOfInfectiousAgentFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation 5 Presence of Infectious Agent Flag"
Description: "That the patient carries, or does not carry, an infectious agent, i.e. disease-causing organisms that cause infectious diseases, such as viruses, bacteria, fungi and certain parasites. This is documented using the observation class in the reference model. Medical alert information about a specific infectious agent is considered current if there is a documented presence of the infectious agent in the patient, and no later record stating that the patient no longer carries it. The infectious agents that need to be highlighted are listed in the [value set for presence of infectious agent](ValueSet-1.2.752.116.3.1.16.1.5.html).

[Mapping to UMI](StructureDefinition-SEAlertInformation-5-PresenceOfInfectiousAgentFlag-mappings.html)"
* code from SEAlertInformationPresenceOfInfectiousAgentVS (required)
* insert AlertInformationCategory(B, B1)

Instance: SEAlertInformation-5-PresenceOfInfectiousAgentFlagExample
InstanceOf: SEAlertInformation-5-PresenceOfInfectiousAgentFlag
Title: "Example 5: Presence of infectious agent"
Description: "Minimal example of alert information about presence of an infectious agent."
* status = #active
* category[mainGroup] = SEAlertInformationCategoryCS#B
* category[subGroup] = SEAlertInformationCategoryCS#B1
* code = $SCT#432415000 "MRSA (methicillin resistant Staphylococcus aureus) carrier"
* extension[alertLabel].valueCodeableConcept = SEAlertLabelCS#mrsa-meticillinresistenta-staphylococcus-aureus "MRSA (meticillinresistenta Staphylococcus aureus)"
* subject = Reference(SEAlertInformationPatientExample)

ValueSet: SEAlertInformationPresenceOfInfectiousAgentVS
Id: 1.2.752.116.3.1.16.1.5
// Title: "Uppmärksamhetsinformation Förekomst av smittämne"
Title: "Alert Information Presence of Infectious Agent"
// Description: "Koder för uppmärksamhetsinformation om förekomst av smittämne."
Description: "Codes for alert information about presence of infectious agent."
* ^experimental = false
* include codes from valueset SEICDPresenceOfInfectiousAgentVS
* include codes from valueset SESCTInfectiousAgentAlertInformationVS

ValueSet: SEICDPresenceOfInfectiousAgentVS
Id: 1.2.752.116.3.1.16.1.5.1
// Title: "Förekomst av smittämne ICD-10-SE"
Title: "Presence of Infectious Agent ICD-10-SE"
// Description: "Koder i ICD-10 för förekomst av smittämne."
Description: "Pre-coordinated combination codes representing ICD-10-SE code combinations for presence of infectious agent."
* ^experimental = false
* include codes from system SEAlertInformationInfectiousAgentICDCombinationCS

CodeSystem: SEAlertInformationInfectiousAgentICDCombinationCS
Id: SEAlertInformationInfectiousAgentICDCombinationCS
Title: "Presence of Infectious Agent ICD-10-SE combinations"
Description: "Local pre-coordinated codes for national ICD-10-SE combinations used for infectious agent alerts."
* ^experimental = false
* ^caseSensitive = true
* #mrsa "MRSA (meticillinresistenta Staphylococcus aureus)"
* #mrsa ^definition = "ICD-10-SE combination: Z22.3C + B95.6 + U82.1"
* #vre "VRE (vankomycinresistenta enterokocker)"
* #vre ^definition = "ICD-10-SE combination: Z22.3W + B95.2 + U83.0"
* #esbl "Tarmbakterier som bildar ESBL"
* #esbl ^definition = "ICD-10-SE combination: Z22.1 + B96.1 + U82.2"
* #esbl-carba "Tarmbakterier som bildar ESBL CARBA"
* #esbl-carba ^definition = "ICD-10-SE combination: Z22.1 + B96.1 + U82.5"

ValueSet: SESCTInfectiousAgentAlertInformationVS
Id: 59851000052108
// Title: "Urval smittämnen, uppmärksamhetsinformation"
Title: "Presence of Infectious Agent Snomed CT"
// Description: "Snomed CT-koder för smittämnen som används för uppmärksamhetsinformation."
Description: "Snomed CT codes for infectious agents used for alert information."
* ^experimental = false
* include $SCT#432415000 "bärare av meticillinresistent Staphylococcus aureus"
* include $SCT#431109006 "bärare av vankomycinresistenta enterokocker"
* include $SCT#762988003 "bärare av ESBL-producerande bakterier"
* include $SESCT#"61751000052107" "bärare av ESBL- och karbapenemasproducerande bakterier"

Mapping:  SEAlertInformation-5-PresenceOfInfectiousAgentFlagToUMI
Source:   SEAlertInformation-5-PresenceOfInfectiousAgentFlag
Target: "https://www.ehalsomyndigheten.se/verksamhet/ndi/interoperabilitet/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Mapping from the elements of this profile to the classes and attributes of the information specification for medical alert information (UMI), version 6.1.2. For each element, the mapping gives the UMI class and attribute that the element corresponds to, and how the value is set."
* code -> "Uppmärksamhetsinformation Förekomst av smittämne (1.2.752.116.3.1.16.1.5)"
* status -> "Förekomst av smittämne(Observation).negation. Om negation = true → inactive, om negation = false → active."
* period.start -> "Förekomst av smittämne(Observation).tid" 
* subject -> "Patient"
* category -> "Typ av uppmärksamhetsinformation (huvudgrupp)"
