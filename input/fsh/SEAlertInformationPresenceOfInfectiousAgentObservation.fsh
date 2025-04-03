// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Profile: SEAlertInformationPresenceOfInfectiousAgentObservation
Parent: Observation
Title: "SE AlertInformation Presence Ff Infectious Agent Profile"
Description: "Swedish profile for the observation of presence of infectious 
                agent used as supportingInfo to the profile SEAlertInformationFlag."
* code from SEAlertInformationPresenceOfInfectiousAgentVS (required)

Instance: SEAlertInformationPresenceOfInfectiousAgentObservationExample
InstanceOf: SEAlertInformationPresenceOfInfectiousAgentObservation
Description: "An example of the Swedish profile for the observation of incidence 
                of infectious disease used as reference to the profile SEBaseFlag."
* status = #final
* code = $SCT#432415000 "bärare av meticillinresistent Staphylococcus aureus"
* subject = Reference(Patient/example) "Förnamn Efternamn"

ValueSet: SESCTInfectiousAgentAlertInformationVS
Id: 59851000052108
Title: "Urval smittämnen, uppmärksamhetsinformation"
Description: "Codes in Snomed CT representing infectious agents used for alert information."
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)
* include $SCT#432415000 "bärare av meticillinresistent Staphylococcus aureus"
* include $SCT#431109006 "bärare av vankomycinresistenta enterokocker"
* include $SCT#762988003 "bärare av ESBL-producerande bakterier"
* include $SCT#61751000052107 "bärare av ESBL- och karbapenemasproducerande bakterier"

ValueSet: SEICDPresenceOfInfectiousAgentVS
Id: 1.2.752.116.3.1.16.1.5.1
Title: "Förekomst av smittämne"
Description: "Codes in ICD-10 representing presence of infectious agent used for alert information."
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)
* include $ICD#Z22.3C+B95.6+U82.1 "Bärare av stafylokocker + Staphylococcus aureus som orsak till sjukdomar som klassificeras i andra kapitel + Resistens mot meticillin"
// todo: lägg till fler

ValueSet: SEAlertInformationPresenceOfInfectiousAgentVS
Id: 1.2.752.116.3.1.16.1.5
Title: "Uppmärksamhetsinformation Förekomst av smittämne"
Description: "Codes in Snomed CT representing infectious diseases used for alert information."
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)
* include codes from valueset SEICDPresenceOfInfectiousAgentVS
* include codes from valueset SESCTInfectiousAgentAlertInformationVS