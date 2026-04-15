// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Profile: SEAlertInformationIncidenceOfInfectiousDiseaseObservation
Parent: Observation
// Title: "SE AlertInformation Förekomst av smittsam sjukdom Profil"
Title: "SE AlertInformation Incidence Of Infectious Disease Profile"
// Description: "Svensk profil för observation av förekomst av smittsam sjukdom som används som flag-detail till profilen SEAlertInformationFlag."
Description: "Swedish profile for the observation of incidence of infectious 
                disease used as flag-detail to the profile SEAlertInformationFlag."
* code from SEAlertInformationInfectiousDiseaseVS (required)

Instance: SEAlertInformationIncidenceOfInfectiousDiseaseObservationExample
InstanceOf: SEAlertInformationIncidenceOfInfectiousDiseaseObservation
// Description: "Exempel på svensk profil för observation av förekomst av smittsam sjukdom som används som referens till profilen SEBaseFlag."
Description: "An example of the Swedish profile for the observation of incidence 
                of infectious disease used as reference to the profile SEBaseFlag."
* status = #final
* code = $SCT#64301000052105 "blodsmitta hos gravid"
* subject = Reference(Patient/example) "Förnamn Efternamn"

ValueSet: SESCTInfectiousDiseaseAlertInformationVS
Id: 60661000052106xxxxxx
// Title: "Urval smittsamma sjukdomar, uppmärksamhetsinformation"
Title: "Selection of infectious diseases, alert information"
// Description: "Koder i Snomed CT som representerar smittsamma sjukdomar som används för uppmärksamhetsinformation."
Description: "Codes in Snomed CT representing infectious diseases used for alert information."
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)
* include $SCT#64301000052105 "blodsmitta hos gravid"

ValueSet: SEICDIncidenceOfInfectiousDiseaseVS
Id: 1.2.752.116.3.1.16.1.6.1
// Title: "Förekomst av smittsam sjukdom"
Title: "Incidence of infectious disease"
// Description: "Koder i ICD-10 som representerar förekomst av smittsamma sjukdomar som används för uppmärksamhetsinformation."
Description: "Codes in ICD-10 representing incidence of infectious diseases used for alert information."
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)

ValueSet: SEAlertInformationInfectiousDiseaseVS
Id: 1.2.752.116.3.1.16.1.6
// Title: "Uppmärksamhetsinformation Förekomst av smittsam sjukdom"
Title: "Alert Information Incidence of Infectious Disease"
// Description: "Koder i Snomed CT som representerar smittsamma sjukdomar som används för uppmärksamhetsinformation."
Description: "Codes in Snomed CT representing infectious diseases used for alert information."
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)
* include codes from valueset SEICDIncidenceOfInfectiousDiseaseVS
* include codes from valueset SESCTInfectiousDiseaseAlertInformationVS