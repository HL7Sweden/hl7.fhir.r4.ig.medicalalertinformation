Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-4-PresenceOfImplantFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation 4 Presence Of Implant Flag Profile"
Description: "Swedish profile of the Flag resource used for alert information about presence of implant."
* code from SEAlertInformationPresenceOfImplantVS (required)
* subject only Reference(SEAlertInformationPatient)
* category = #4 "Presence of Implant"
* extension[flag-detail] 0..0
* extension[criticalityLevel] 0..0

ValueSet: SEAlertInformationPresenceOfImplantVS
Id: a1.2.752.116.3.1.16.1.3.1
Title: "Uppmärksamhetsinformation Förekomst av implantat"
Description: "Uppmärksamhetsinformation Förekomst av implantat."
* include codes from valueset SEAlertInformationPresenceOfImplantICD10SEVS
* include codes from valueset SEAlertInformationPresenceOfImplantSnomedCTVS

ValueSet: SEAlertInformationPresenceOfImplantICD10SEVS
Id: SEImplantatICD10SEVS
Title: "Förekomst av implantat ICD-10-SE"
Description: "Valuesets för förekomsten av implantat enligt ICD-10-SE."
* include $ICD#Z95.0 "Förekomst av elektronisk kardiell anordning"
* include $ICD#Z95.2 "Förekomst av hjärtklaffprotes av icke-biologiskt material"
* include $ICD#Z95.4 "Förekomst av annan typ av hjärtklaffsersättning"
* include $ICD#Z98.2 "Tillstånd med förekomst av hjälpmedel för dränage av cerebrospinalvätska"
* include $ICD#Z96.0
* include $ICD#Z96.2
* include $ICD#Z96.8
* include $ICD#Z99.4

ValueSet: SEAlertInformationPresenceOfImplantSnomedCTVS
Id: SEImplantatSnomedCTVS
Title: "Uppmärksamhetsinformation Implantat Snomed CT"
Description: "Valuesets för uppmärksamhetsinformation om implantat enligt Snomed CT."
* include $SCT#72506001 "implanterbar defibrillator"
* include $SCT#14106009 "pacemaker"
* include $SCT#705991002 "mekanisk hjärtklaffprotes"
* include $SCT#72821000052105 "mikrospiral, magnetisk metall"
* include $SCT#72811000052102 "kärlklämma, magnetisk metall"
* include $SCT#263805004 "magnetisk metall"
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
