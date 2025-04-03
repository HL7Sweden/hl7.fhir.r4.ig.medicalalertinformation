// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformationFlag
Parent: Flag
Title: "SE AlertInformation Flag Profile"
Description: "Swedish profile of the Flag resource used for alert information based on the 
    Swedich National Board of Social Affairs and Health (Socialstyrelsen) specification 
    https://www.socialstyrelsen.se/kunskapsstod-och-regler/omraden/e-halsa/tillampning/uppmarksamhetsinformation/."
* code from SEAlertInformationVS (required)
* subject only Reference(SEAlertInformationPatient)
* extension contains http://hl7.org/fhir/StructureDefinition/flag-detail named supportingInfo 0..*
* extension contains CriticalityLevelExtension named criticalityLevel 0..1
* extension[supportingInfo].valueReference only Reference(SEAlertInformationIncidenceOfInfectiousDiseaseObservation or
                                                            SEAlertInformationPresenceOfInfectiousAgentObservation)
// todo: beskrivning för category
* category from SEAlertInformationCategoryVS
* extension[criticalityLevel] ^comment = "Är det här en bra plats att beskriva att beskriva att även criticality i AllergyIntolerance kan användas och hur den mappas?"
  
Instance: SEAlertInformationFlagExample
InstanceOf: SEAlertInformationFlag
Description: "An example of the Swedish profile of the Flag resource."
* status = #active
* code = $SCT#64301000052105 "blodsmitta hos gravid"
* extension[supportingInfo].valueReference = Reference(SEAlertInformationIncidenceOfInfectiousDiseaseObservationExample) "blodsmitta hos gravid"
* subject = Reference(SEAlertInformationPatientExample)

//CriticalityLevel
Extension: CriticalityLevelExtension
Id: 1
Title:  "SE AlertInformation Flag Criticality Level Extension"
Description: "A code classifying the criticality level of an allergy."
Context: SEAlertInformationFlag
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)
* value[x] only CodeableConcept
* value[x] from SEAlertInformationCriticalityLevelVS (required)
//* value[x] ^binding.description = "Indicates the severity level of the condition or event. The ValueSet 'Allvarlighetsgrad' includes the codes 'Life-threatening', 'Harmful', and 'Discomforting'. These codes are mapped to the ValueSet 'AllergyIntoleranceCriticality' as follows: 'Discomforting' and 'Harmful' map to 'low', while 'Life-threatening' maps to 'high'. The code 'unable-to-assess' is not permitted."
* value[x] ^binding.description = "Indicates the severity level of the condition or event. In addition to using the codes from 'Allvarlighetsgrad', it is also possible to provide a Coding directly from the ValueSet 'AllergyIntoleranceCriticality'. The ValueSet 'Allvarlighetsgrad' includes the codes 'Life-threatening', 'Harmful', and 'Discomforting'. These codes are mapped to the ValueSet 'AllergyIntoleranceCriticality' as follows: 'Discomforting' and 'Harmful' map to 'low', while 'Life-threatening' maps to 'high'. The code 'unable-to-assess' is not permitted."

ValueSet: SEAlertInformationVS
Id: 1
Title: "Uppmärksamhetsinformation"
Description: "Codes used for alert information."
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)
* include codes from valueset SEAlertInformationInfectiousDiseaseVS // Förekomst av smittsam sjukdom
* include codes from valueset SEAlertInformationPresenceOfInfectiousAgentVS // Förekomst av smittämne

CodeSystem: SEAlertInformationCategoryCS
Id: SEAlertInformationCategoryCS
Title: "Typ av uppmärksamhetsinformation"
Description: "Kategorisering av uppmärksamhetsinformation."
* ^hierarchyMeaning = #is-a
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)
* #A "Medicinska tillstånd och behandlingar"
* #A #A1 "Annat medicinskt tillstånd"
* #A #A2 "Behandling"
* #A #A3 "Förekomst av implantat Implantat"
* #A #A4 "Förekomst av transplantat Transplantat"
* #B "Smitta"
* #B #B1 "Förekomst av smittämne"
* #B #B2 "Förekomst av smittsam sjukdom"
* #C "Överkänslighet"
* #C #C1 "Kemikalie"
* #C #C2 "Aktiv substans"
* #C #C3 "Hjälpämne läkemedel"
* #C #C4 "Läkemedelsprodukt"
* #D "Särskild vårdrutin"
* #D #D1 "Information som kan leda till särskild vårdrutin"
* #D #D2 "Beslut som kan leda till särskild vårdrutin"
* #E "Ej strukturanpassad uppmärksamhetsinformation"
* #E #E1 "Historiskt angiven uppmärksamhetsinformation"

ValueSet: SEAlertInformationCategoryVS
Id: SEAlertInformationCategoryVS
Title: "Typ av uppmärksamhetsinformation"
Description: "Kategorisering av uppmärksamhetsinformation."
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)
* include codes from system SEAlertInformationCategoryCS

CodeSystem: SEAlertInformationCriticalityLevelCS
Id: SEAlertInformationCriticalityLevelCS
Title: "Allvarlighetsgrad"
Description: "Allvarlighetsgrad för överkänslighet"
* #A "Life-threatening" //Livshotande
* #B "Harmful" //Skadlig
* #C "Discomforting" //Besvärande

ValueSet: SEAlertInformationCriticalityLevelVS
Id: SEAlertInformationCriticalityLevelVS
Title: "Allvarlighetsgrad"
Description: "Allvarlighetsgrad för överkänslighet."
* include codes from system SEAlertInformationCriticalityLevelCS