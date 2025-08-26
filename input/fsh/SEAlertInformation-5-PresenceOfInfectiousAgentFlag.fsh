Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformation-5-PresenceOfInfectiousAgentFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation 5 Presence Of Infectious Agent Flag Profile"
Description: "Swedish profile of the Flag resource used for alert information about presence of infectious agent."
* code from SEAlertInformationPresenceOfInfectiousAgentVS (required)
* subject only Reference(SEAlertInformationPatient)
* category = #5 "Presence of Infectious Agent"
* extension[flag-detail] 0..0
* extension[criticalityLevel] 0..0

ValueSet: SEAlertInformationPresenceOfInfectiousAgentVS
Id: 1.2.752.116.3.1.16.1.5
Title: "Uppmärksamhetsinformation Förekomst av smittämne"
Description: "Koder för uppmärksamhetsinformation om förekomst av smittämne."
* include codes from valueset SEICDPresenceOfInfectiousAgentVS
* include codes from valueset SESCTInfectiousAgentAlertInformationVS

ValueSet: SEICDPresenceOfInfectiousAgentVS
Id: 1.2.752.116.3.1.16.1.5.1
Title: "Förekomst av smittämne ICD-10-SE"
Description: "Koder i ICD-10 för förekomst av smittämne."
* include $ICD#Z22.3W+B95.6+U82.1 "Bärare av stafylokocker + Staphylococcus aureus som orsak till sjukdomar som klassificeras i andra kapitel + Resistens mot meticillin"
* include $ICD#Z22.3C+B95.2+U83.0 "Bärare av ESBL-producerande bakterier + Streptokocker grupp D och enterokocker som orsak till sjukdomar som klassificeras i andra kapitel + Resistens mot vankomycin"
* include $ICD#Z22.3C+B96.1+U82.2 "Bärare av ESBL- och karbapenemasproducerande bakterier + Klebsiella pneumoniae som orsak till sjukdomar som klassificeras i andra kapitel + Resistens på grund av betalaktamaser med utvidgat spektrum (ESBL)"
* include $ICD#Z22.1+B96.1+U82.2C "Bärare av andra patogena tarmbakterier + Klebsiella pneumoniae som orsak till sjukdomar som klassificeras i andra kapitel + ESBL-CARBA"

ValueSet: SESCTInfectiousAgentAlertInformationVS
Id: 59851000052108
Title: "Urval smittämnen, uppmärksamhetsinformation"
Description: "Snomed CT-koder för smittämnen som används för uppmärksamhetsinformation."
* include $SCT#432415000 "bärare av meticillinresistent Staphylococcus aureus"
* include $SCT#431109006 "bärare av vankomycinresistenta enterokocker"
* include $SCT#762988003 "bärare av ESBL-producerande bakterier"
* include $SCT#61751000052107 "bärare av ESBL- och karbapenemasproducerande bakterier"
