// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10
Alias: $ATC = https://nzhts.digital.health.nz/fhir/ValueSet/atc-code

Profile: SEAlertInformation-2-TreatmentFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation 2 Treatment Flag Profile"
// Description: "Swedish profile of the Flag resource used for alert information about treatments."
* code from SEAlertInformationTreatmentVS (required)
* subject only Reference(SEAlertInformationPatient)
* category = #2 "Treatment"
// * extension[flag-detail].valueReference only Reference(Procedure)

Instance: SEAlertInformationTreatmentFlagExample
InstanceOf: SEAlertInformation-2-TreatmentFlag
Description: "An example of the Swedish profile of the treatment Flag resource."
* status = #active
* code = $SCT#64301000052105 "blodsmitta hos gravid"
* extension[flag-detail].valueReference = Reference(SEAlertInformationIncidenceOfInfectiousDiseaseObservationExample) "blodsmitta hos gravid"
* subject = Reference(SEAlertInformationPatientExample)

ValueSet: SEAlertInformationTreatmentATCVS
Id: 1.2.752.116.3.1.16.1.2.2
Title: "Behandling ATC"
* include $ATC#B01AA "Vitamin K-antagonister"
* include $ATC#B01AB "Heparingruppen"
* include $ATC#B01AE "Direkt trombinhämmande medel"
* include $ATC#B01AF "Direktverkande faktor Xa-hämmare"
* include $ATC#B01AA03 "Warfarin"
* include $ATC#L01 "Antineoplastiska medel"
* include $ATC#L03A "Immunstimulerande medel"
* include $ATC#L04 "Immunsuppressiva medel"

ValueSet: SEAlertInformationTreatmentICDVS
Id: 1.2.752.116.3.1.16.1.2.1
Title: "Behandling ICD-10-SE"
* include $ICD#Z92.1 "Långtidsanvändning (och pågående användning) av blodförtunnande medel i den egna sjukhistorien"
* include $ICD#Z99.2 "Beroende av njurdialys"

ValueSet: SEAlertInformationTreatmentSnomedVS
Id: 59831000052104
Title: "Urval behandlingar, uppmärksamhetsinformation"
* include $SCT#243142003 "BiPAP-behandling"
* include $SCT#385971003 "dialysbehandling"

ValueSet: SEAlertInformationTreatmentVS
Id: 1.2.752.116.3.1.16.1.2
Title: "Uppmärksamhetsinformation Behandling"
* include codes from valueset SEAlertInformationTreatmentATCVS
* include codes from valueset SEAlertInformationTreatmentICDVS
* include codes from valueset SEAlertInformationTreatmentSnomedVS