// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10

Profile: SEAlertInformationFlag
Parent: Flag
// Title: "SE AlertInformation Flag Profile"
Title: "SE AlertInformation Flag"
// Description: "Swedish profile of the Flag resource used for alert information based on the 
//    Swedich National Board of Social Affairs and Health (Socialstyrelsen) specification 
//    https://www.socialstyrelsen.se/kunskapsstod-och-regler/omraden/e-halsa/tillampning/uppmarksamhetsinformation/."
Description: "Swedish base profile of the Flag resource for medical alert information, based on the Swedish eHealth Agency's (E-hälsomyndigheten) information specification for medical alert information ([Uppmärksamhetsinformation - E-hälsomyndigheten](https://www.ehalsomyndigheten.se/verksamhet/ndi/interoperabilitet/uppmarksamhetsinformation/)).

The profile holds the requirements that are common to all medical alert information. The profiles SE AlertInformation 1–10, one for each subgroup of medical alert information, are derived from this profile and add the requirements that are specific to their subgroup."
* code 1..1
* subject only Reference(SEBasePatient)
* extension contains AlertLabelExtension named alertLabel 0..1
* extension[alertLabel].valueCodeableConcept from SEAlertLabelVS (preferred)
* category from SEAlertInformationCategoryVS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^slicing.description = "Sliced on the main group and the subgroup of medical alert information. The slices are defined in the derived profiles."

// Used by the derived profiles to fix the main group and the subgroup of medical alert information.
RuleSet: AlertInformationCategory(main, sub)
* category contains mainGroup 0..1 and subGroup 0..1
* category[mainGroup] = SEAlertInformationCategoryCS#{main}
* category[mainGroup] ^short = "Main group of medical alert information"
* category[subGroup] = SEAlertInformationCategoryCS#{sub}
* category[subGroup] ^short = "Subgroup of medical alert information"

Instance: SEAlertInformationFlagExample
InstanceOf: SEAlertInformationFlag
Title: "Example: Base profile"
// Description: "Exempel på svensk profil för Flag resource."
Description: "An example of the Swedish profile of the Flag resource."
* status = #active
* code = $SESCT#"64301000052105" "blodsmitta hos gravid"
* extension[alertLabel].valueCodeableConcept = SEAlertLabelCS#blodsmitta-hos-gravid "Blodsmitta hos gravid"
* subject = Reference(SEAlertInformationPatientExample)

//CriticalityLevel
Extension: CriticalityLevelExtension
Id: SECriticalityLevelExtension
// Title:  "SE AlertInformation Flag Severity level Extension"
Title:  "SE AlertInformation Flag Severity level Extension"
// Description: "En kod som klassificerar allvarlighetsgraden för en överkänslighet."
Description: "A code classifying the severity level of a hypersensitivity."
Context: Flag
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)
* value[x] only CodeableConcept
* value[x] from SEAlertInformationCriticalityLevelVS (required)
//* value[x] ^binding.description = "Indicates the severity level of the condition or event. The ValueSet 'Allvarlighetsgrad' includes the codes 'Life-threatening', 'Harmful', and 'Discomforting'. These codes are mapped to the ValueSet 'AllergyIntoleranceCriticality' as follows: 'Discomforting' and 'Harmful' map to 'low', while 'Life-threatening' maps to 'high'. The code 'unable-to-assess' is not permitted."
* value[x] ^binding.description = "Indicates the severity level of the condition or event. 
    In addition to using the codes from the ValueSet 'Allvarlighetsgrad', it is also possible to provide a Coding directly from the ValueSet 'AllergyIntoleranceCriticality'. 
    The ValueSet 'Allvarlighetsgrad' includes the codes 'Life-threatening', 'Harmful', and 'Discomforting'. 
    These codes are mapped to the ValueSet 'AllergyIntoleranceCriticality' as follows: 'Discomforting' and 'Harmful' map to 'low', while 'Life-threatening' maps to 'high'. 
    The code 'unable-to-assess' is not permitted."

Extension: AlertLabelExtension
Id: SEAlertLabelExtension
Title: "SE Alert Label Extension"
Description: "Stores the alert label shown to end users, from the national code list for medical alert information published by the Swedish eHealth Agency (E-hälsomyndigheten)."
Context: Flag
* value[x] only CodeableConcept
* value[x] from SEAlertLabelVS (preferred)
* value[x] ^binding.description = "Use SEAlertLabelVS when possible. If a label is missing, use code.text and extend the CodeSystem in a later release."

Extension: VerificationStatusExtension
Id: SEVerificationStatusExtension
Title: "SE AlertInformation Flag Verification Status Extension"
// Description: "Visshetsgrad för en överkänslighet."
Description: "The degree of certainty (visshetsgrad) of a hypersensitivity, expressed with the same codes as AllergyIntolerance.verificationStatus."
Context: Flag
* value[x] only CodeableConcept
* value[x] from http://hl7.org/fhir/ValueSet/allergyintolerance-verification (required)
* value[x] ^binding.description = "The degree of certainty 'misstänkt' (suspected) is given as presumed."

CodeSystem: SEAlertInformationCategoryCS
Id: SEAlertInformationCategoryCS
// Title: "Typ av uppmärksamhetsinformation"
Title: "Groups and sub groups of alert information code system"
// Description: "Kategorisering av uppmärksamhetsinformation."
Description: "The groups and subgroups of medical alert information, as defined in the code list for medical alert information."
* ^hierarchyMeaning = #is-a
* ^experimental = false
* ^caseSensitive = true
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)
* #A "Medical conditions and treatments" // Medicinska tillstånd och behandlingar
* #A ^definition = "Medical alert information about medical conditions and treatments."
* #A #A1 "Other medical condition" // Annat medicinskt tillstånd
* #A #A1 ^definition = "Alert category for a medical condition other than hypersensitivity, infection, implant, or transplant."
* #A #A2 "Treatment" // Behandling
* #A #A3 "Presence of transplant" // Förekomst av transplantat
* #A #A4 "Presence of implant" // Förekomst av implantat
* #B "Infection" // Smitta
* #B #B1 "Presence of infectious agent" // Förekomst av smittämne
* #B #B2 "Presence of infectious disease" // Förekomst av smittsam sjukdom
* #C "Hypersensitivity" // Överkänslighet
* #C #C1 "Chemical" // Kemikalie
* #C #C2 "Active substance" // Aktiv substans
* #C #C3 "Excipient" // Hjälpämne läkemedel
* #C #C4 "Medicinal product" // Läkemedelsprodukt
* #D "Special care routine" // Särskild vårdrutin
* #D #D1 "Information that can lead to special care routine" // Information som kan leda till särskild vårdrutin
* #D #D2 "Decision that can lead to special care routine" // Beslut som kan leda till särskild vårdrutin
* #E "Uncategorized medical alert information" // Ej strukturanpassad uppmärksamhetsinformation
* #E #E1 "Historically recorded medical alert information" // Historiskt angiven uppmärksamhetsinformation

ValueSet: SEAlertInformationCategoryVS
Id: SEAlertInformationCategoryVS
// Title: "Typ av uppmärksamhetsinformation"
Title: "Groups and sub groups of alert information"
// Description: "Kategorisering av uppmärksamhetsinformation."
Description: "The groups and subgroups of medical alert information, as defined in the code list for medical alert information."
* ^experimental = false
// url, status, purpose, and other metadata could be defined here using caret syntax (omitted)
* include codes from system SEAlertInformationCategoryCS

CodeSystem: SEAlertInformationCriticalityLevelCS
Id: SEAlertInformationCriticalityLevelCS
// Title: "Allvarlighetsgrad"
Title: "Severity level code system"
// Description: "Allvarlighetsgrad för överkänslighet"
Description: "Severity level for hypersensitivity."
* ^experimental = false
* ^caseSensitive = true
* #442452003 "Life-threatening" //Livshotande
* #442452003 ^definition = "Allergireaktion med livshotande allvarlighetsgrad."
* #59021000052107 "Harmful" //Skadlig
* #59021000052107 ^definition = "Harmful severity level for hypersensitivity documentation."
* #59031000052109 "Discomforting" //Besvärande
* #59031000052109 ^definition = "Discomforting severity level for hypersensitivity documentation."

ValueSet: SEAlertInformationCriticalityLevelVS
Id: SEAlertInformationCriticalityLevelVS
// Title: "Allvarlighetsgrad"
Title: "Severity level"
// Description: "Allvarlighetsgrad för överkänslighet."
Description: "Severity level for hypersensitivity."
* ^experimental = false
* include codes from system SEAlertInformationCriticalityLevelCS