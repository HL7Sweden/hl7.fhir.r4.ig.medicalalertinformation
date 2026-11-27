Alias: $SCT = http://snomed.info/sct
Alias: $ActReason = http://terminology.hl7.org/CodeSystem/v3-ActReason

Profile: SEAlertInformationFlag
Parent: Flag
Title: "SE AlertInformation Flag"
Description: "Swedish base profile of the Flag resource for medical alert information, based on the Swedish eHealth Agency's (E-hälsomyndigheten) information specification for medical alert information ([Uppmärksamhetsinformation - E-hälsomyndigheten](https://www.ehalsomyndigheten.se/verksamhet/ndi/interoperabilitet/uppmarksamhetsinformation/)).

The profile holds the requirements that are common to all medical alert information: the patient, the main group and subgroup of medical alert information, a comment, the priority and references to supplementary information. The profiles SE AlertInformation 1–10, one for each subgroup of medical alert information, are derived from this profile and add the requirements that are specific to their subgroup.

[Mapping to UMI](StructureDefinition-SEAlertInformationFlag-mappings.html)"
* code 1..1
* code.text ^comment = "The value the user has selected in the system, for example the term in column A of the code list for medical alert information, can be given in code.text."
* status ^comment = "entered-in-error is not used for medical alert information. How active and inactive are set is described for each subgroup in its profile."
* subject only Reference(SEBasePatient)
// Main group and subgroup of medical alert information. The derived profiles set the values.
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^slicing.description = "Sliced on the main group and the subgroup of medical alert information. The derived profiles set the values."
* category contains mainGroup 0..1 and subGroup 0..1
* category[mainGroup] from SEAlertInformationMainGroupVS (required)
* category[mainGroup] ^short = "Main group of medical alert information"
* category[subGroup] from SEAlertInformationSubgroupVS (required)
* category[subGroup] ^short = "Subgroup of medical alert information"
// Extensions common to all medical alert information
* extension contains
    http://hl7.org/fhir/StructureDefinition/note|5.2.0 named comment 0..* and
    http://hl7.org/fhir/StructureDefinition/flag-priority|5.2.0 named priority 0..1 and
    http://hl7.org/fhir/StructureDefinition/flag-detail|5.2.0 named detail 0..*
* extension[comment] ^short = "Comment on the medical alert information"
* extension[priority] ^short = "Priority of the medical alert information"
* extension[detail] ^short = "Reference to supplementary information"
* extension[detail] ^comment = "Reference to a resource that holds supplementary information about the medical alert information, for example a Condition, Procedure or AllergyIntolerance."

Instance: SEAlertInformationFlagExample
InstanceOf: SEAlertInformationFlag
Title: "Example: Base profile"
Description: "An example of the Swedish base profile of the Flag resource."
* status = #active
* category[mainGroup] = SEAlertInformationCategoryCS#B "Infection"
* category[subGroup] = SEAlertInformationCategoryCS#B2 "Presence of infectious disease"
* code = $SESCT#"64301000052105" "blodsmitta hos gravid"
* code.text = "Blodsmitta hos gravid"
* extension[comment].valueAnnotation.text = "Example of a comment on the medical alert information."
* subject = Reference(SEAlertInformationPatientExample)

// Main groups and subgroups of medical alert information
CodeSystem: SEAlertInformationCategoryCS
Id: SEAlertInformationCategoryCS
Title: "Groups and Subgroups of Medical Alert Information Code System"
Description: "The main groups and subgroups of medical alert information, as defined in the code list for medical alert information. The codes are defined in this code system; the profiles bind to the value sets Main Groups of Medical Alert Information and Subgroups of Medical Alert Information."
* ^hierarchyMeaning = #is-a
* ^experimental = false
* ^caseSensitive = true
* #A "Medical conditions and treatments" // Medicinska tillstånd och behandlingar
* #A ^definition = "Medical alert information about medical conditions and treatments."
* #A #A1 "Other medical condition" // Annat medicinskt tillstånd
* #A #A1 ^definition = "A medical condition other than hypersensitivity, presence of infectious disease, presence of infectious agent, presence of implant or presence of transplant."
* #A #A2 "Treatment" // Behandling
* #A #A2 ^definition = "Interventions intended to prevent ill health or to maintain or improve the individual's state of health."
* #A #A3 "Presence of transplant" // Förekomst av transplantat
* #A #A3 ^definition = "That the patient has, or does not have, a transplant."
* #A #A4 "Presence of implant" // Förekomst av implantat
* #A #A4 ^definition = "That the patient has, or does not have, an implant."
* #B "Infection" // Smitta
* #B ^definition = "Medical alert information about infection."
* #B #B1 "Presence of infectious agent" // Förekomst av smittämne
* #B #B1 ^definition = "That the patient carries, or does not carry, an infectious agent."
* #B #B2 "Presence of infectious disease" // Förekomst av smittsam sjukdom
* #B #B2 ^definition = "That the patient has, or does not have, an infectious disease."
* #C "Hypersensitivity" // Överkänslighet
* #C ^definition = "Medical alert information about hypersensitivity."
* #C #C1 "Chemical" // Kemikalie
* #C #C1 ^definition = "Hypersensitivity to a chemical."
* #C #C2 "Active substance" // Aktiv substans
* #C #C2 ^definition = "Hypersensitivity to an active substance."
* #C #C3 "Excipient" // Hjälpämne läkemedel
* #C #C3 ^definition = "Hypersensitivity to an excipient."
* #C #C4 "Medicinal product" // Läkemedelsprodukt
* #C #C4 ^definition = "Hypersensitivity to a medicinal product."
* #D "Special care routine" // Särskild vårdrutin
* #D ^definition = "Medical alert information that can lead to a special care routine."
* #D #D1 "Information that can lead to special care routine" // Information som kan leda till särskild vårdrutin
* #D #D1 ^definition = "Information that can lead to a special care routine, for example that there is a threat against the patient."
* #D #D2 "Decision that can lead to special care routine" // Beslut som kan leda till särskild vårdrutin
* #D #D2 ^definition = "A decision that can lead to a special care routine."
* #E "Uncategorized medical alert information" // Ej strukturanpassad uppmärksamhetsinformation
* #E ^definition = "Medical alert information that does not meet the current requirements for information structure."
* #E #E1 "Historically recorded medical alert information" // Historiskt angiven uppmärksamhetsinformation
* #E #E1 ^definition = "Historically recorded medical alert information that does not meet the current requirements for information structure, and medical alert information that is not nationally agreed."

ValueSet: SEAlertInformationCategoryVS
Id: SEAlertInformationCategoryVS
Title: "Groups and Subgroups of Medical Alert Information"
Description: "All main groups and subgroups of medical alert information. The codes are defined in the code system Groups and Subgroups of Medical Alert Information Code System."
* ^experimental = false
* include codes from system SEAlertInformationCategoryCS

ValueSet: SEAlertInformationMainGroupVS
Id: SEAlertInformationMainGroupVS
Title: "Main Groups of Medical Alert Information"
Description: "The main groups of medical alert information. Used in Flag.category, slice mainGroup."
* ^experimental = false
* SEAlertInformationCategoryCS#A "Medical conditions and treatments"
* SEAlertInformationCategoryCS#B "Infection"
* SEAlertInformationCategoryCS#C "Hypersensitivity"
* SEAlertInformationCategoryCS#D "Special care routine"
* SEAlertInformationCategoryCS#E "Uncategorized medical alert information"

ValueSet: SEAlertInformationSubgroupVS
Id: SEAlertInformationSubgroupVS
Title: "Subgroups of Medical Alert Information"
Description: "The subgroups of medical alert information. Used in Flag.category, slice subGroup."
* ^experimental = false
* SEAlertInformationCategoryCS#A1 "Other medical condition"
* SEAlertInformationCategoryCS#A2 "Treatment"
* SEAlertInformationCategoryCS#A3 "Presence of transplant"
* SEAlertInformationCategoryCS#A4 "Presence of implant"
* SEAlertInformationCategoryCS#B1 "Presence of infectious agent"
* SEAlertInformationCategoryCS#B2 "Presence of infectious disease"
* SEAlertInformationCategoryCS#C1 "Chemical"
* SEAlertInformationCategoryCS#C2 "Active substance"
* SEAlertInformationCategoryCS#C3 "Excipient"
* SEAlertInformationCategoryCS#C4 "Medicinal product"
* SEAlertInformationCategoryCS#D1 "Information that can lead to special care routine"
* SEAlertInformationCategoryCS#D2 "Decision that can lead to special care routine"
* SEAlertInformationCategoryCS#E1 "Historically recorded medical alert information"

Mapping:  SEAlertInformationFlagToUMI
Source:   SEAlertInformationFlag
Target: "https://www.ehalsomyndigheten.se/verksamhet/ndi/interoperabilitet/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Mapping from the elements of this profile to the classes and attributes of the information specification for medical alert information (UMI), version 6.1.2. The mappings in this profile are common to all medical alert information; the profiles for the subgroups add the mappings that are specific to the subgroup."
* subject -> "Patient"
* category[mainGroup] -> "Typ av uppmärksamhetsinformation, huvudgrupp"
* category[subGroup] -> "Typ av uppmärksamhetsinformation, undergrupp"
* status -> "negation (or the corresponding attribute of the subgroup). entered-in-error is not used."

// Used by the derived profiles to set the main group and the subgroup of medical alert information.
RuleSet: AlertInformationCategory(main, sub)
* category[mainGroup] = SEAlertInformationCategoryCS#{main}
* category[subGroup] = SEAlertInformationCategoryCS#{sub}
