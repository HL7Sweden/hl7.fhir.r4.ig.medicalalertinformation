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
* extension contains http://hl7.org/fhir/StructureDefinition/flag-detail named flag-detail 0..*
* extension contains CriticalityLevelExtension named criticalityLevel 0..1
* extension[flag-detail].valueReference only Reference(SEAlertInformationIncidenceOfInfectiousDiseaseObservation or
                                                            SEAlertInformationPresenceOfInfectiousAgentObservation)
// todo: beskrivning för category
* category from SEAlertInformationCategoryVS
* extension[criticalityLevel] ^comment = "Är det här en bra plats att beskriva att beskriva att även criticality i AllergyIntolerance kan användas och hur den mappas?"
  
Instance: SEAlertInformationFlagExample
InstanceOf: SEAlertInformationFlag
Description: "An example of the Swedish profile of the Flag resource."
* status = #active
* code = $SCT#64301000052105 "blodsmitta hos gravid"
* extension[flag-detail].valueReference = Reference(SEAlertInformationIncidenceOfInfectiousDiseaseObservationExample) "blodsmitta hos gravid"
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
* value[x] ^binding.description = "Indicates the severity level of the condition or event. 
    In addition to using the codes from the ValueSet 'Allvarlighetsgrad', it is also possible to provide a Coding directly from the ValueSet 'AllergyIntoleranceCriticality'. 
    The ValueSet 'Allvarlighetsgrad' includes the codes 'Life-threatening', 'Harmful', and 'Discomforting'. 
    These codes are mapped to the ValueSet 'AllergyIntoleranceCriticality' as follows: 'Discomforting' and 'Harmful' map to 'low', while 'Life-threatening' maps to 'high'. 
    The code 'unable-to-assess' is not permitted."

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
// * #A #A1 "Annat medicinskt tillstånd"                            //SEAlertInformationFlag
// * #A #A2 "Behandling"
// * #A #A3 "Förekomst av implantat Implantat"
// * #A #A4 "Förekomst av transplantat Transplantat"
* #B "Smitta"
// * #B #B1 "Förekomst av smittämne"                                //SEAlertInformationPresenceOfInfectiousAgentObservation
// * #B #B2 "Förekomst av smittsam sjukdom"                         //SEAlertInformationIncidenceOfInfectiousDiseaseObservation
* #C "Överkänslighet"
// * #C #C1 "Kemikalie"
// * #C #C2 "Aktiv substans"
// * #C #C3 "Hjälpämne läkemedel"
// * #C #C4 "Läkemedelsprodukt"
* #D "Särskild vårdrutin"
// * #D #D1 "Information som kan leda till särskild vårdrutin"
// * #D #D2 "Beslut som kan leda till särskild vårdrutin"
* #E "Ej strukturanpassad uppmärksamhetsinformation"
// * #E #E1 "Historiskt angiven uppmärksamhetsinformation"

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


// //Förekomst av implantat

// ValueSet: SEImplantatICD10SEVS
// Id: SEImplantatICD10SEVS
// Title: "Förekomst av implantat ICD-10-SE"
// Description: "Valuesets för förekomsten av implantat enligt ICD-10-SE."
// * include $ICD#Z95.0 "Förekomst av elektronisk kardiell anordning"
// * include $ICD#Z95.2 "Förekomst av hjärtklaffprotes av icke-biologiskt material"
// * include $ICD#Z95.4 "Förekomst av annan typ av hjärtklaffsersättning"
// * include $ICD#Z98.2 "Tillstånd med förekomst av hjälpmedel för dränage av cerebrospinalvätska"
// * include $ICD#Z96.0 ""
// * include $ICD#Z96.2 ""
// * include $ICD#Z96.8 ""
// * include $ICD#Z96.8 ""
// * include $ICD#Z96.8 ""
// * include $ICD#Z99.4 ""
// * include $ICD#Z95.0 ""

// ValueSet: SEImplantatSnomedCTVS
// Id: SEImplantatSnomedCTVS
// Title: "Uppmärksamhetsinformation Implantat Snomed CT"
// Description: "Valuesets för uppmärksamhetsinformation om implantat enligt Snomed CT."
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
// Description: "Valueset som kombinerar ICD-10-SE och Snomed CT koder för uppmärksamhetsinformation om förekomsten av implantat."
// * include codes from valueset "SEImplantatICD10SEVS"
// * include codes from valueset "SEImplantatSnomedCTVS"


// // Förekomst av transplantat

// ValueSet: SEImplantatTransplantICD10SEVS
// Id: 1.2.752.116.3.1.16.1.4.1
// Title: "Förekomst av transplantat ICD-10-SE"
// Description: "Valueset för ICD-10-SE koder relaterade till förekomsten av transplantat."
// * include $ICD#Z94.8 "Andra specificerade transplantationstillstånd"
// * include $ICD#Z94.1 "Hjärttransplanterad"
// * include $ICD#Z94.4 "Levertransplanterad"
// * include $ICD#Z94.2 "Lungtransplanterad"
// * include $ICD#Z94.0 "Njurtransplanterad"
// * include $ICD#113471000052100 "urval förekomst av transplantat, uppmärksamhetsinformation"
// * include $ICD#59861000052106 "urval transplantat, uppmärksamhetsinformation"

// ValueSet: SEImplantatTransplantSnomedCTVS
// Id: SEImplantatTransplantSnomedCTVS
// Title: "Uppmärksamhetsinformation Förekomst av transplantat Snomed CT"
// Description: "Valueset för Snomed CT koder relaterade till förekomsten av transplantat."
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
// Description: "Valueset som kombinerar ICD-10-SE och Snomed CT koder för uppmärksamhetsinformation om förekomsten av transplantat."
// * include codes from valueset "SEImplantatTransplantICD10SEVS"
// * include codes from valueset "SEImplantatTransplantSnomedCTVS"