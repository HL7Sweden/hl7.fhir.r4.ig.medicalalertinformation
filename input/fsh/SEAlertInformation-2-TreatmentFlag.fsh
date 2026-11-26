// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10
Alias: $ATC = http://www.whocc.no/atc

Profile: SEAlertInformation-2-TreatmentFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation 2 Treatment Flag"
Description: "Interventions intended to prevent ill health or to maintain or improve the individual's state of health. This is documented using the activity class in the reference model. Medical alert information about treatment is considered current if there is a documented treatment with the status ongoing, and no later record stating that the treatment is no longer ongoing. The treatments that need to be highlighted are listed in the [value set for treatment](ValueSet-1.2.752.116.3.1.16.1.2.html) and include both drug treatments and other treatments. Drug treatments are given as a selection of ATC codes (1.2.752.116.3.1.16.1.2.2). If SNOMED CT is used, the code 416608005 *drug therapy* is given in the class treatment, while the drug used in the treatment is given in the attribute type in the class active substance, or in the attribute product-id in the class medicinal product.

[Mapping to UMI](StructureDefinition-SEAlertInformation-2-TreatmentFlag-mappings.html)"
* code from SEAlertInformationTreatmentVS (required)
* insert AlertInformationCategory(A, A2)
* extension contains http://hl7.org/fhir/StructureDefinition/flag-detail|5.2.0 named flag-detail 0..*
// * extension[flag-detail].valueReference only Reference(Procedure)

Instance: SEAlertInformationTreatmentFlagExample
InstanceOf: SEAlertInformation-2-TreatmentFlag
Title: "Example 2: Treatment"
Description: "An example of the Swedish profile of the treatment Flag resource."
* status = #active
* category[mainGroup] = SEAlertInformationCategoryCS#A
* category[subGroup] = SEAlertInformationCategoryCS#A2
* code = $SCT#243142003 "BiPAP-behandling"
* extension[alertLabel].valueCodeableConcept = SEAlertLabelCS#beroende-av-icke-invasiv-ventilation "Beroende av icke-invasiv ventilation"
* subject = Reference(SEAlertInformationPatientExample)

ValueSet: SEAlertInformationTreatmentATCVS
Id: 1.2.752.116.3.1.16.1.2.2
Title: "Treatment ATC"
//Title: "Behandling ATC"
Description: "ATC codes for treatment-related alert information."
* ^experimental = false
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
Title: "Treatment ICD-10-SE"
//Title: "Behandling ICD-10-SE"
Description: "ICD-10-SE codes for treatment-related alert information."
* ^experimental = false
* include $ICD10SE#"Z92.1" "Långtidsanvändning (och pågående användning) av blodförtunnande medel i den egna sjukhistorien"
* include $ICD10SE#"Z99.2" "Beroende av njurdialys"

ValueSet: SEAlertInformationTreatmentSnomedVS
Id: 59831000052104
Title: "Treatment Snomed CT"
//Title: "Urval behandlingar, uppmärksamhetsinformation"
Description: "SNOMED CT subset for treatment-related alert information."
* ^experimental = false
* include $SCT#243142003 "BiPAP-behandling"
* include $SCT#385971003 "dialysbehandling"

ValueSet: SEAlertInformationTreatmentVS
Id: 1.2.752.116.3.1.16.1.2
Title: "Attention information – Treatment"
//Title: "Uppmärksamhetsinformation Behandling"
Description: "Combined value set for treatment-related alert information."
* ^experimental = false
* include codes from valueset SEAlertInformationTreatmentATCVS
* include codes from valueset SEAlertInformationTreatmentICDVS
* include codes from valueset SEAlertInformationTreatmentSnomedVS

Mapping:  SEAlertInformation-2-TreatmentFlagToUMI
Source:   SEAlertInformation-2-TreatmentFlag
Target: "https://www.ehalsomyndigheten.se/verksamhet/ndi/interoperabilitet/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Mapping from the elements of this profile to the classes and attributes of the information specification for medical alert information (UMI), version 6.1.2. For each element, the mapping gives the UMI class and attribute that the element corresponds to, and how the value is set."
// * code -> "Implantation(Aktivitet).kod Förekomst av implantat(Observation).värde" 
* code -> "Uppmärksamhetsinformation Behandling (1.2.752.116.3.1.16.1.2)"
// TODO: Lägg till mappning till aktiviteterna för att sätta status
* status -> "Behandling(Aktivitet).status"
* period.start -> "Behandling(Aktivitet).tid.starttid" 
* period.end -> "Behandling(Aktivitet).tid.sluttid" 
* subject -> "Patient"
* category -> "Typ av uppmärksamhetsinformation (huvudgrupp)"