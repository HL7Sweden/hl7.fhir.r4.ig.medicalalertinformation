Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10
Alias: $ATC = http://www.whocc.no/atc

Profile: SEAlertInformation-2-TreatmentFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation 2 Treatment Flag"
Description: "Interventions intended to prevent ill health or to maintain or improve the individual's state of health. This is documented using the activity class in the reference model. Medical medical alert information about treatment is considered current if there is a documented treatment with the status ongoing, and no later record stating that the treatment is no longer ongoing. The treatments that need to be highlighted are listed in the [value set for treatment](ValueSet-1.2.752.116.3.1.16.1.2.html) and include both drug treatments and other treatments. Drug treatments are given as a selection of ATC codes (1.2.752.116.3.1.16.1.2.2). If SNOMED CT is used, the code 416608005 *drug therapy* is given in the class treatment, while the drug used in the treatment is given in the attribute type in the class active substance, or in the attribute product-id in the class medicinal product.

[Mapping to UMI](StructureDefinition-SEAlertInformation-2-TreatmentFlag-mappings.html)"
* code from SEAlertInformationTreatmentVS (required)
* insert AlertInformationCategory(A, A2)

Instance: SEAlertInformationTreatmentFlagExample
InstanceOf: SEAlertInformation-2-TreatmentFlag
Title: "Example 2: Treatment"
Description: "An example of the Swedish profile of the treatment Flag resource."
* status = #active
* category[mainGroup] = SEAlertInformationCategoryCS#A
* category[subGroup] = SEAlertInformationCategoryCS#A2
* code = $SCT#243142003 "BiPAP-behandling"
* code.text = "Beroende av icke-invasiv ventilation"
* subject = Reference(SEAlertInformationPatientExample)

ValueSet: SEAlertInformationTreatmentATCVS
Id: 1.2.752.116.3.1.16.1.2.2
Title: "Treatment ATC"
Description: "ATC codes for medical alert information about treatment."
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
Description: "ICD-10-SE codes for medical alert information about treatment."
* ^experimental = false
* include $ICD10SE#"Z92.1" "Långtidsanvändning (och pågående användning) av blodförtunnande medel i den egna sjukhistorien"
* include $ICD10SE#"Z99.2" "Beroende av njurdialys"

ValueSet: SEAlertInformationTreatmentSnomedVS
Id: 59831000052104
Title: "Treatment Snomed CT"
Description: "SNOMED CT subset for medical alert information about treatment."
* ^experimental = false
* include $SCT#243142003 "BiPAP-behandling"
* include $SCT#385971003 "dialysbehandling"

ValueSet: SEAlertInformationTreatmentVS
Id: 1.2.752.116.3.1.16.1.2
Title: "Alert Information – Treatment"
Description: "Codes for medical alert information about treatment (Uppmärksamhetsinformation Behandling): the ATC, ICD-10-SE and SNOMED CT subsets."
* ^experimental = false
* include codes from valueset SEAlertInformationTreatmentATCVS
* include codes from valueset SEAlertInformationTreatmentICDVS
* include codes from valueset SEAlertInformationTreatmentSnomedVS

Mapping:  SEAlertInformation-2-TreatmentFlagToUMI
Source:   SEAlertInformation-2-TreatmentFlag
Target: "https://www.ehalsomyndigheten.se/verksamhet/ndi/interoperabilitet/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Mapping from the elements of this profile to the classes and attributes of the information specification for medical alert information (UMI), version 6.1.2. The mappings common to all medical alert information (subject, category) are given in the profile SE AlertInformation Flag."
* code -> "Behandling(Aktivitet).kod" "A code from the value set Uppmärksamhetsinformation Behandling (1.2.752.116.3.1.16.1.2), or the NPL-id of a medicinal product or the NSL-id of an active substance."
* status -> "Behandling(Aktivitet).status" "Flag.status is set as follows: ongoing (pågående) → active; completed or cancelled (utförd, avbruten) → inactive. entered-in-error is not used."
* period -> "Behandling(Aktivitet).tid"
