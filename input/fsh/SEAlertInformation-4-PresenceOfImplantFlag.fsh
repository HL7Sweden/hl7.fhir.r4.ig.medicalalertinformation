Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-4-PresenceOfImplantFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation 4 Presence of Implant Flag"
Description: "That the patient has, or does not have, an implant, i.e. something that has been surgically inserted into the body for diagnostic, therapeutic or experimental purposes. This is documented using the observation class in the reference model. Medical alert information about presence of implant is considered current if there is a documented presence of the implant in the patient, and no later record stating that the patient no longer has the implant. The implants that need to be highlighted are listed in the [value set for presence of implant](ValueSet-1.2.752.116.3.1.16.1.3.html).

[Mapping to UMI](StructureDefinition-SEAlertInformation-4-PresenceOfImplantFlag-mappings.html)"
* code from SEAlertInformationPresenceOfImplantVS (required)
// * status from flag-status where code in { "active", "inactive" }
* insert AlertInformationCategory(A, A4)

Instance: SEAlertInformation-4-PresenceOfImplantFlagExample
InstanceOf: SEAlertInformation-4-PresenceOfImplantFlag
Title: "Example 4: Presence of implant"
Description: "Minimal example of alert information about presence of an implant."
* status = #active
* category[mainGroup] = SEAlertInformationCategoryCS#A
* category[subGroup] = SEAlertInformationCategoryCS#A4
* code = $ICD10SE#"Z95.0" "Förekomst av elektronisk kardiell anordning"
* extension[alertLabel].valueCodeableConcept = SEAlertLabelCS#pacemaker "Pacemaker"
* subject = Reference(SEAlertInformationPatientExample)

ValueSet: SEAlertInformationPresenceOfImplantVS
Id: 1.2.752.116.3.1.16.1.3
// Title: "Uppmärksamhetsinformation Förekomst av implantat"
Title: "Alert Information Presence of Implant"
// Description: "Uppmärksamhetsinformation Förekomst av implantat."
Description: "Alert information about presence of implant."
* ^experimental = false
* include codes from valueset SEAlertInformationPresenceOfImplantICD10SEVS
* include codes from valueset SEAlertInformationPresenceOfImplantSnomedCTVS

ValueSet: SEAlertInformationPresenceOfImplantICD10SEVS
Id: 1.2.752.116.3.1.16.1.3.1
// Title: "Förekomst av implantat ICD-10-SE"
Title: "Presence of Implant ICD-10-SE"
// Description: "Valuesets för förekomsten av implantat enligt ICD-10-SE."
Description: "Value set for presence of implant according to ICD-10-SE."
* ^experimental = false
* include $ICD10SE#"Z95.0" "Förekomst av elektronisk kardiell anordning"
* include $ICD10SE#"Z95.2" "Förekomst av hjärtklaffprotes av icke-biologiskt material"
* include $ICD10SE#"Z95.4" "Förekomst av annan typ av hjärtklaffsersättning"
* include $ICD10SE#"Z98.2" "Tillstånd med förekomst av hjälpmedel för dränage av cerebrospinalvätska"
* include $ICD10SE#"Z96.0" "Artificiell uretrasfinkter"
* include $ICD10SE#"Z96.2" "Cochleaimplantat"
* include $ICD10SE#"Z96.8" "Förekomst av annat specificerat implantat"
* include $ICD10SE#"Z99.4" "Hjärtpump för vänster kammare"

ValueSet: SEAlertInformationPresenceOfImplantSnomedCTVS
Id: 59841000052105
// Title: "Uppmärksamhetsinformation Implantat Snomed CT"
Title: "Presence of Implant Snomed CT"
// Description: "Valuesets för uppmärksamhetsinformation om implantat enligt Snomed CT."
Description: "Value set for alert information about implant according to Snomed CT."
* ^experimental = false
* include $SCT#72506001 "implanterbar defibrillator"
* include $SCT#14106009 "pacemaker"
* include $SCT#705991002 "mekanisk hjärtklaffprotes"
* include $SESCT#"72821000052105" "mikrospiral, magnetisk metall"
* include $SESCT#"72811000052102" "kärlklämma, magnetisk metall"
* include $SCT#1010731003
* include $SCT#258593008 "ventrikelshunt"
* include $SCT#360100007 "trakeal stent"
* include $SCT#69805005 "insulinpump"
* include $SCT#261680000 "artificiell uretrasfinkter"
* include $SCT#43252007 "kokleaimplantat"
* include $SCT#1351253007 "Central nervous system neurostimulator"
* include $SCT#447033006 "vagal nervstimulator"
* include $SCT#705545001 "Diaphragm/phrenic nerve electrical stimulation system"
* include $SCT#360066001 "vänsterkammarassist"
* include $SCT#360125003 "pacemakerelektrod"

// Mapping:  SEAlertInformation-4-PresenceOfImplantFlagToRIVTA
// Source:   SEAlertInformation-4-PresenceOfImplantFlag
// Target:   "RIVTA-GetAlertInformation"
// Id:       RIVTA-GetAlertInformation
// Title:    "RIVTA-GetAlertInformation"
// Description: "Description..."
// * code -> "GetAlertInformationResponse.alertInformation.body.activity.code GetAlertInformationResponse.alertInformation.body.condition.value" 

Mapping:  SEAlertInformation-4-PresenceOfImplantFlagToUMI
Source:   SEAlertInformation-4-PresenceOfImplantFlag
Target: "https://www.ehalsomyndigheten.se/verksamhet/ndi/interoperabilitet/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Mapping from the elements of this profile to the classes and attributes of the information specification for medical alert information (UMI), version 6.1.2. For each element, the mapping gives the UMI class and attribute that the element corresponds to, and how the value is set."
// * code -> "Implantation(Aktivitet).kod Förekomst av implantat(Observation).värde" 
* code -> "Uppmärksamhetsinformation Förekomst av implantat (1.2.752.116.3.1.16.1.3)"
// TODO: Lägg till mappning till aktiviteterna för att sätta status
* status -> "Implantation(Aktivitet) Avlägsnande av implantat(Aktivitet) Förekomst av implantat(Observation)" "Flag.status ska sättas enligt följande: observerad förekomst & negation = falskt -> active observerad förekomst & negation = sant -> inactive. entered-in-error används inte."
* period.start -> "Implantation(Aktivitet).tid Förekomst av implantat(Observation).tid" 
* subject -> "Patient"
* category -> "Typ av uppmärksamhetsinformation (huvudgrupp)"