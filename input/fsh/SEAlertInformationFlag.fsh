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

// //Förekomst av implantat

// ValueSet: SEImplantatICD10SEVS
// Id: SEImplantatICD10SEVS
// Title: "Förekomst av implantat ICD-10-SE"
// Title: "Presence of Implant ICD-10-SE"
// Description: "Valuesets för förekomsten av implantat enligt ICD-10-SE."
// Description: "Value set for presence of implant according to ICD-10-SE."
// * include $ICD10SE#"Z95.0" "Förekomst av elektronisk kardiell anordning"
// * include $ICD10SE#"Z95.2" "Förekomst av hjärtklaffprotes av icke-biologiskt material"
// * include $ICD10SE#"Z95.4" "Förekomst av annan typ av hjärtklaffsersättning"
// * include $ICD10SE#"Z98.2" "Tillstånd med förekomst av hjälpmedel för dränage av cerebrospinalvätska"
// * include $ICD10SE#"Z96.0" ""
// * include $ICD10SE#"Z96.2" ""
// * include $ICD10SE#"Z96.8" ""
// * include $ICD10SE#"Z96.8" ""
// * include $ICD10SE#"Z96.8" ""
// * include $ICD10SE#"Z99.4" ""
// * include $ICD10SE#"Z95.0" ""

// ValueSet: SEImplantatSnomedCTVS
// Id: SEImplantatSnomedCTVS
// Title: "Uppmärksamhetsinformation Implantat Snomed CT"
// Title: "Alert Information Implant Snomed CT"
// Description: "Valuesets för uppmärksamhetsinformation om implantat enligt Snomed CT."
// Description: "Value set for alert information about implant according to Snomed CT."
// * include $sct#72506001 "implanterbar defibrillator"
// * include $sct#14106009 "pacemaker"
// * include $sct#705991002 "mekanisk hjärtklaffprotes"
// * include $sct#72821000052105 "mikrospiral, magnetisk metall"
// * include $sct#72811000052102 "kärlklämma, magnetisk metall"
// * include $sct#263805004 "magnetisk metall"
// * include $sct#258593008 "ventrikelshunt"
// * include $sct#360100007 "trakeal stent"
// * include $sct#69805005 "insulinpump"
// * include $sct#261680000 "artificiell uretrasfinkter"
// * include $sct#43252007 "kokleaimplantat"
// * include $sct#1351253007 "Central nervous system neurostimulator"
// * include $sct#447033006 "vagal nervstimulator"
// * include $sct#705545001 "Diaphragm/phrenic nerve electrical stimulation system"
// * include $sct#360066001 "vänsterkammarassist"
// * include $sct#360125003 "pacemakerelektrod"

// ValueSet: SEImplantatVS
// Id: 1.2.752.116.3.1.16.1.3
// Title: "Uppmärksamhetsinformation Förekomst av implantat"
// Title: "Alert Information Presence of Implant"
// Description: "Valueset som kombinerar ICD-10-SE och Snomed CT koder för uppmärksamhetsinformation om förekomsten av implantat."
// Description: "Value set combining ICD-10-SE and Snomed CT codes for alert information about presence of implant."
// * include codes from valueset "SEImplantatICD10SEVS"
// * include codes from valueset "SEImplantatSnomedCTVS"


// // Förekomst av transplantat

// ValueSet: SEImplantatTransplantICD10SEVS
// Id: 1.2.752.116.3.1.16.1.4.1
// Title: "Förekomst av transplantat ICD-10-SE"
// Title: "Presence of Transplant ICD-10-SE"
// Description: "Valueset för ICD-10-SE koder relaterade till förekomsten av transplantat."
// Description: "Value set for ICD-10-SE codes related to presence of transplant."
// * include $ICD10SE#"Z94.8" "Andra specificerade transplantationstillstånd"
// * include $ICD10SE#"Z94.1" "Hjärttransplanterad"
// * include $ICD10SE#"Z94.4" "Levertransplanterad"
// * include $ICD10SE#"Z94.2" "Lungtransplanterad"
// * include $ICD10SE#"Z94.0" "Njurtransplanterad"
// * include $ICD10SE#"113471000052100" "urval förekomst av transplantat, uppmärksamhetsinformation"
// * include $ICD10SE#"59861000052106" "urval transplantat, uppmärksamhetsinformation"

// ValueSet: SEImplantatTransplantSnomedCTVS
// Id: SEImplantatTransplantSnomedCTVS
// Title: "Uppmärksamhetsinformation Förekomst av transplantat Snomed CT"
// Title: "Alert Information Presence of Transplant Snomed CT"
// Description: "Valueset för Snomed CT koder relaterade till förekomsten av transplantat."
// Description: "Value set for Snomed CT codes related to presence of transplant."
// * include $sct#413781000052107 "stamcelltransplantat föreligger"
// * include $sct#413679007 "benmärgsvätska"
// * include $sct#413604003 "autolog benmärgsvätska"
// * include $sct#413478009 "allogen benmärgsvätska"
// * include $sct#739024006 "transplanterat hjärta föreligger"
// * include $sct#420291005 "transplantatmaterial från hjärta"
// * include $sct#737297006 "transplanterad lever föreligger"
// * include $sct#421751001 "transplantatmaterial från lever"
// * include $sct#737296002 "transplanterad lunga föreligger"
// * include $sct#421525000 "transplantatmaterial från lunga"
// * include $sct#737295003 "transplanterad njure föreligger"
// * include $sct#420852008 "transplantatmaterial från njure"
// * include $sct#73111000052103 " transplanterad pankreas föreligger "
// * include $sct#421263007 "transplantatmaterial från pankreas"
// * include $sct#73131000052108 " transplanterad tarm föreligger "
// * include $sct#73341000052100 "transplantatmaterial från tarm"

// ValueSet: SEImplantatTransplantCombinedVS
// Id: 1.2.752.116.3.1.16.1.4
// Title: "Uppmärksamhetsinformation Förekomst av transplantat"
// Title: "Alert Information Presence of Transplant"
// Description: "Valueset som kombinerar ICD-10-SE och Snomed CT koder för uppmärksamhetsinformation om förekomsten av transplantat."
// * include codes from valueset "SEImplantatTransplantICD10SEVS"
// * include codes from valueset "SEImplantatTransplantSnomedCTVS"