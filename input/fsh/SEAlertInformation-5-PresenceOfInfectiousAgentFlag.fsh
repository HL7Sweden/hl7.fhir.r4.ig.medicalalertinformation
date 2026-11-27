Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-5-PresenceOfInfectiousAgentFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation 5 Presence of Infectious Agent Flag"
Description: "That the patient carries, or does not carry, an infectious agent, i.e. disease-causing organisms that cause infectious diseases, such as viruses, bacteria, fungi and certain parasites. This is documented using the observation class in the reference model. Medical medical alert information about a specific infectious agent is considered current if there is a documented presence of the infectious agent in the patient, and no later record stating that the patient no longer carries it. The infectious agents that need to be highlighted are listed in the [value set for presence of infectious agent](ValueSet-1.2.752.116.3.1.16.1.5.html).

[Mapping to UMI](StructureDefinition-SEAlertInformation-5-PresenceOfInfectiousAgentFlag-mappings.html)"
* code from SEAlertInformationPresenceOfInfectiousAgentVS (required)
* insert AlertInformationCategory(B, B1)

Instance: SEAlertInformation-5-PresenceOfInfectiousAgentFlagExample
InstanceOf: SEAlertInformation-5-PresenceOfInfectiousAgentFlag
Title: "Example 5: Presence of infectious agent"
Description: "Minimal example of medical alert information about presence of an infectious agent."
* status = #active
* category[mainGroup] = SEAlertInformationCategoryCS#B
* category[subGroup] = SEAlertInformationCategoryCS#B1
* code = $SCT#432415000 "MRSA (methicillin resistant Staphylococcus aureus) carrier"
* code.text = "MRSA (meticillinresistenta Staphylococcus aureus)"
* subject = Reference(SEAlertInformationPatientExample)

ValueSet: SEAlertInformationPresenceOfInfectiousAgentVS
Id: 1.2.752.116.3.1.16.1.5
Title: "Alert Information – Presence of Infectious Agent"
Description: "Codes for medical alert information about presence of infectious agent (Uppmärksamhetsinformation Förekomst av smittämne): the SNOMED CT subset. The corresponding combinations of ICD-10-SE codes are given in the concept map [Presence of Infectious Agent SNOMED CT to ICD-10-SE](ConceptMap-SEAlertInformationInfectiousAgentSnomedToICD10SE.html)."
* ^experimental = false
* include codes from valueset SESCTInfectiousAgentAlertInformationVS

ValueSet: SESCTInfectiousAgentAlertInformationVS
Id: 59851000052108
Title: "Presence of Infectious Agent Snomed CT"
Description: "SNOMED CT codes for medical alert information about presence of infectious agent. The corresponding ICD-10-SE codes are given in the concept map Presence of Infectious Agent SNOMED CT to ICD-10-SE."
* ^experimental = false
* include $SCT#432415000 "bärare av meticillinresistent Staphylococcus aureus"
* include $SCT#431109006 "bärare av vankomycinresistenta enterokocker"
* include $SCT#762988003 "bärare av ESBL-producerande bakterier"
* include $SESCT#"61751000052107" "bärare av ESBL- och karbapenemasproducerande bakterier"


// Each SNOMED CT code corresponds to a combination of three ICD-10-SE codes in the code list for medical alert information.
// The first ICD-10-SE code is given as target.code and the other two as target.product.
RuleSet: InfectiousAgentMap(g, sct, display, icd1, icd2, icd3)
* group[{g}].element[+].code = #{sct}
* group[{g}].element[=].display = "{display}"
* group[{g}].element[=].target[0].code = #{icd1}
* group[{g}].element[=].target[0].equivalence = #equivalent
* group[{g}].element[=].target[0].comment = "Combination of the ICD-10-SE codes {icd1} + {icd2} + {icd3}."
* group[{g}].element[=].target[0].product[0].property = "http://hl7.org/fhir/StructureDefinition/Flag#Flag.code.coding"
* group[{g}].element[=].target[0].product[0].system = $ICD10SE
* group[{g}].element[=].target[0].product[0].value = "{icd2}"
* group[{g}].element[=].target[0].product[1].property = "http://hl7.org/fhir/StructureDefinition/Flag#Flag.code.coding"
* group[{g}].element[=].target[0].product[1].system = $ICD10SE
* group[{g}].element[=].target[0].product[1].value = "{icd3}"

Instance: SEAlertInformationInfectiousAgentSnomedToICD10SE
InstanceOf: ConceptMap
Usage: #definition
Title: "Presence of Infectious Agent SNOMED CT to ICD-10-SE"
Description: "Maps the SNOMED CT codes for presence of infectious agent to the corresponding combination of ICD-10-SE codes (Förekomst av smittämne ICD-10-SE, 1.2.752.116.3.1.16.1.5.1) in the code list for medical alert information. Each SNOMED CT code corresponds to three ICD-10-SE codes: the first is given as the target code and the other two as products of the map."
* url = "http://hl7.se/fhir/r4/ig/medicalalertinformation/ConceptMap/SEAlertInformationInfectiousAgentSnomedToICD10SE"
* name = "SEAlertInformationInfectiousAgentSnomedToICD10SE"
* status = #draft
* experimental = false
* sourceCanonical = Canonical(SESCTInfectiousAgentAlertInformationVS)
* group[0].source = "http://snomed.info/sct"
* group[0].target = $ICD10SE
* insert InfectiousAgentMap(0, 432415000, bärare av meticillinresistent Staphylococcus aureus, Z22.3C, B95.6, U82.1)
* insert InfectiousAgentMap(0, 431109006, bärare av vankomycinresistenta enterokocker, Z22.3W, B95.2, U83.0)
* insert InfectiousAgentMap(0, 762988003, bärare av ESBL-producerande bakterier, Z22.1, B96.1, U82.2)
// Swedish national SNOMED CT extension code
* group[1].source = $SESCT
* group[1].target = $ICD10SE
* insert InfectiousAgentMap(1, 61751000052107, bärare av ESBL- och karbapenemasproducerande bakterier, Z22.1, B96.1, U82.5)

Mapping:  SEAlertInformation-5-PresenceOfInfectiousAgentFlagToUMI
Source:   SEAlertInformation-5-PresenceOfInfectiousAgentFlag
Target: "https://www.ehalsomyndigheten.se/verksamhet/ndi/interoperabilitet/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Mapping from the elements of this profile to the classes and attributes of the information specification for medical alert information (UMI), version 6.1.2. The mappings common to all medical alert information (subject, category) are given in the profile SE AlertInformation Flag."
* code -> "Förekomst av smittämne(Observation).värde" "A code from the value set Uppmärksamhetsinformation Förekomst av smittämne (1.2.752.116.3.1.16.1.5), for example MRSA. The corresponding ICD-10-SE codes are given in the concept map Presence of Infectious Agent SNOMED CT to ICD-10-SE."
* status -> "Förekomst av smittämne(Observation).status, negation" "Flag.status is set as follows: observed presence (observerad förekomst) and negation = false → active; observed presence and negation = true → inactive. entered-in-error is not used."
* period -> "Förekomst av smittämne(Observation).tid"
