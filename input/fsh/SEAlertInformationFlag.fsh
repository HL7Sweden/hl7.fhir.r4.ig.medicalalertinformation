// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformationFlag
Parent: Flag
// Title: "SE AlertInformation Flag Profile"
Title: "SE AlertInformation Flag Profile"
// Description: "Swedish profile of the Flag resource used for alert information based on the 
//    Swedich National Board of Social Affairs and Health (Socialstyrelsen) specification 
//    https://www.socialstyrelsen.se/kunskapsstod-och-regler/omraden/e-halsa/tillampning/uppmarksamhetsinformation/."
Description: "Swedish profile of the Flag resource used for alert information based on the 
    Swedish National Board of Social Affairs and Health (Socialstyrelsen) specification 
    https://www.socialstyrelsen.se/kunskapsstod-och-regler/omraden/e-halsa/tillampning/uppmarksamhetsinformation/."
* code 1..1
* subject only Reference(SEAlertInformationPatient)
* extension contains http://hl7.org/fhir/StructureDefinition/flag-detail|5.2.0 named flag-detail 0..*
* extension contains CriticalityLevelExtension named criticalityLevel 0..1
* extension contains AlertLabelExtension named alertLabel 0..1
* extension[flag-detail].valueReference only Reference(Resource)
* extension[alertLabel].valueCodeableConcept from SEAlertLabelVS (preferred)
// todo: beskrivning för category
* category from SEAlertInformationCategoryVS
* extension[criticalityLevel] ^comment = "Indicates the severity level of the condition or event. 
    In addition to using the codes from the ValueSet 'Allvarlighetsgrad', it is also possible to provide a Coding directly from the ValueSet 'AllergyIntoleranceCriticality'. 
    The ValueSet 'Allvarlighetsgrad' includes the codes 'Life-threatening', 'Harmful', and 'Discomforting'. 
    These codes are mapped to the ValueSet 'AllergyIntoleranceCriticality' as follows: 'Discomforting' and 'Harmful' map to 'low', while 'Life-threatening' maps to 'high'. 
    The code 'unable-to-assess' is not permitted."
  
Instance: SEAlertInformationFlagExample
InstanceOf: SEAlertInformationFlag
// Description: "Exempel på svensk profil för Flag resource."
Description: "An example of the Swedish profile of the Flag resource."
* status = #active
* code = $ICD10SE#"A49.9" "Bakteriell infektion, ospecificerad"
* extension[alertLabel].valueCodeableConcept = SEAlertLabelCS#blodsmitta-hos-gravid "Blodsmitta hos gravid"
* extension[criticalityLevel].valueCodeableConcept = SEAlertInformationCriticalityLevelCS#59031000052109 "Discomforting"
* extension[flag-detail].valueReference = Reference(SEAlertInformationIncidenceOfInfectiousDiseaseObservationExample) "blodsmitta hos gravid"
* subject = Reference(SEAlertInformationPatientExample)

//CriticalityLevel
Extension: CriticalityLevelExtension
Id: SECriticalityLevelExtension
// Title:  "SE AlertInformation Flag Criticality Level Extension"
Title:  "SE AlertInformation Flag Criticality Level Extension"
// Description: "En kod som klassificerar allvarlighetsgraden för en överkänslighet."
Description: "A code classifying the criticality level of an allergy."
Context: Flag
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)
* value[x] only CodeableConcept
* value[x] from SEAlertInformationCriticalityLevelVS (required)
//* value[x] ^binding.description = "Indicates the severity level of the condition or event. The ValueSet 'Allvarlighetsgrad' includes the codes 'Life-threatening', 'Harmful', and 'Discomforting'. These codes are mapped to the ValueSet 'AllergyIntoleranceCriticality' as follows: 'Discomforting' and 'Harmful' map to 'low', while 'Life-threatening' maps to 'high'. The code 'unable-to-assess' is not permitted."
* value[x] ^binding.description = "Indicates the severity level of the condition or event. 
    In addition to using the codes from the ValueSet 'Allvarlighetsgrad', it is also possible to provide a Coding directly from the ValueSet 'AllergyIntoleranceCriticality'. 
    The ValueSet 'Allvarlighetsgrad' includes the codes 'Life-threatening', 'Harmful', and 'Discomforting'. 
    These codes are mapped to the ValueSet 'AllergyIntoleranceCriticality' as follows: 'Discomforting' and 'Harmful' map to 'low', while 'Life-threatening' maps to 'high'. 
    The code 'unable-to-assess' is not permitted."

Extension: AlertLabelExtension
Id: SEAlertLabelExtension
Title: "SE Alert Label Extension"
Description: "Stores the alert label shown to end users, aligned with the national code list published by Socialstyrelsen."
Context: Flag
* value[x] only CodeableConcept
* value[x] from SEAlertLabelVS (preferred)
* value[x] ^binding.description = "Use SEAlertLabelVS when possible. If a label is missing, use code.text and extend the CodeSystem in a later release."

// VerificationStatusExtension

ValueSet: SEAlertInformationVS
Id: 1
// Title: "Uppmärksamhetsinformation"
Title: "Alert Information"
// Description: "Koder som används för uppmärksamhetsinformation."
Description: "Codes used for alert information."
* ^experimental = false
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)
* include codes from valueset SEAlertInformationOtherMedicalConditionVS // Annat medicinskt tillstånd
* include codes from valueset SEAlertInformationTreatmentVS // Behandling
* include codes from valueset SEAlertInformationPresenceOfGraftsConditionVS // Förekomst av transplantat
* include codes from valueset SEAlertInformationPresenceOfImplantVS // Förekomst av implantat
* include codes from valueset SEAlertInformationInfectiousDiseaseVS // Förekomst av smittsam sjukdom
* include codes from valueset SEAlertInformationPresenceOfInfectiousAgentVS // Förekomst av smittämne
* include codes from valueset SEAlertInformationChemicalAllergySnomedVS // Överkänslighet
* include codes from valueset SEAlertInformationSpecialCareRoutineSnomedCT // Information som kan leda till särskild vårdrutin
* include codes from valueset SEAlertInformationDecisionSpecialCareRoutineSnomedCT // Beslut som kan leda till särskild vårdrutin
* include codes from valueset SEAlertInformationDrugProductVS // Läkemedelsprodukt

CodeSystem: SEAlertInformationCategoryCS
Id: SEAlertInformationCategoryCS
// Title: "Typ av uppmärksamhetsinformation"
Title: "Type of alert information"
// Description: "Kategorisering av uppmärksamhetsinformation."
Description: "Categorization of alert information."
* ^hierarchyMeaning = #is-a
* ^experimental = false
* ^caseSensitive = true
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)
* #A "Medical conditions and treatments" // Medicinska tillstånd och behandlingar
* #A ^definition = "Medical alert information about medical conditions and treatments."
* #A #A1 "Other medical condition" // Annat medicinskt tillstånd
* #A #A1 ^definition = "Alert category for a medical condition other than allergy, infection, implant, or graft."
* #A #A2 "Treatment" // Behandling
* #A #A3 "Presence of transplant" // Förekomst av transplantat
* #A #A4 "Presence of implant" // Förekomst av implantat
* #B "Infection" // Smitta
* #B #B1 "Presence of infectious agent" // Förekomst av smittämne
* #B #B2 "Presence of infectious disease" // Förekomst av smittsam sjukdom
* #C "Hypersensitivity" // Överkänslighet
* #C #C1 "Hypersensitivity condition" // Överkänslighetstillstånd
* #C #C2 "Active substance" // Aktiv substans
* #C #C3 "Excipient" // Hjälpämne läkemedel
* #C #C4 "Medicinal product" // Läkemedelsprodukt
* #D "Special care routine" // Särskild vårdrutin
* #D #D1 "Information that can lead to special care routine" // Information som kan leda till särskild vårdrutin
* #D #D2 "Decision that can lead to special care routine" // Beslut som kan leda till särskild vårdrutin
* #E "Unstructured medical alert information" // Ej strukturanpassad uppmärksamhetsinformation
* #E #E1 "Historically recorded medical alert information" // Historiskt angiven uppmärksamhetsinformation

ValueSet: SEAlertInformationCategoryVS
Id: SEAlertInformationCategoryVS
// Title: "Typ av uppmärksamhetsinformation"
Title: "Type of alert information"
// Description: "Kategorisering av uppmärksamhetsinformation."
Description: "Categorization of alert information."
* ^experimental = false
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)
* include codes from system SEAlertInformationCategoryCS

CodeSystem: SEAlertInformationCriticalityLevelCS
Id: SEAlertInformationCriticalityLevelCS
// Title: "Allvarlighetsgrad"
Title: "Criticality Level"
// Description: "Allvarlighetsgrad för överkänslighet"
Description: "Criticality level for allergy."
* ^experimental = false
* ^caseSensitive = true
* #442452003 "Life-threatening" //Livshotande
* #442452003 ^definition = "Allergireaktion med livshotande allvarlighetsgrad."
* #59021000052107 "Harmful" //Skadlig
* #59021000052107 ^definition = "Harmful criticality level for hypersensitivity documentation."
* #59031000052109 "Discomforting" //Besvärande
* #59031000052109 ^definition = "Discomforting criticality level for hypersensitivity documentation."

ValueSet: SEAlertInformationCriticalityLevelVS
Id: SEAlertInformationCriticalityLevelVS
// Title: "Allvarlighetsgrad"
Title: "Criticality Level"
// Description: "Allvarlighetsgrad för överkänslighet."
Description: "Criticality level for allergy."
* ^experimental = false
* include codes from system SEAlertInformationCriticalityLevelCS