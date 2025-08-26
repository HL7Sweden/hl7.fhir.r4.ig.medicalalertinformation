Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-6-PresenceOfContagiousDiseaseFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation 6 Förekomst av smittsam sjukdom"
Description: "Profil för att hantera uppmärksamhetssignalen Förekomst av smittsam sjukdom."
* code from SEAlertInformationPresenceOfContagiousDiseaseSnomedCT (required)
* subject only Reference(SEAlertInformationPatient)
* category = #6 "PresenceOfContagiousDisease"
* extension[flag-detail] 0..0
* extension[criticalityLevel] 0..0

Instance: SEAlertInformation-6-PresenceOfContagiousDiseaseFlagExample
InstanceOf: SEAlertInformationFlag
Description: "Exempel på uppmärksamhetssignal för förekomst av smittsam sjukdom"
* status = #active
* code = $SCT#64301000052105 "blodsmitta hos gravid"
* subject = Reference(SEAlertInformationPatientExample)

ValueSet: SEAlertInformationPresenceOfContagiousDiseaseSnomedCT
Id: 60661000052106
Title: "Urval smittsamma sjukdomar, uppmärksamhetsinformation"
Description: "Urval av Snomed CT koder relaterade till smittsamma sjukdomar."
* include $SCT#64301000052105 "blodsmitta hos gravid"