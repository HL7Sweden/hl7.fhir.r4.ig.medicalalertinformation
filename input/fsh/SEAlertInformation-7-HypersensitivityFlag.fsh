Alias: $SCT = http://snomed.info/sct
Alias: $ICD = http://hl7.org/fhir/sid/icd-10
Alias: $ATC = http://www.whocc.no/atc
// NSL and NPL are identified by the OIDs given in the code list for medical alert information
Alias: $NSL = urn:oid:1.2.752.129.5.1.45
Alias: $NPL = urn:oid:1.2.752.129.2.1.5.1
Alias: $AllergyVerification = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification

Profile: SEAlertInformation-7-HypersensitivityFlag
Parent: SEAlertInformationFlag
Title: "SE AlertInformation 7 Hypersensitivity Flag"
Description: "A state of increased sensitivity on contact with factors in the environment that are normally tolerated by most people. That the patient has, or does not have, a hypersensitivity is documented using the observation class in the reference model. Medical medical alert information about hypersensitivity is considered current if there is a documented presence of the hypersensitivity in the patient, and no later record stating that the patient no longer has it. The substances that are, or are suspected to be, linked to a hypersensitivity are given in the classes chemical, active substance, excipient and medicinal product.

[Mapping to UMI](StructureDefinition-SEAlertInformation-7-HypersensitivityFlag-mappings.html)"
* code from SEAlertInformationHypersensitivityVS (required)
// Hypersensitivity has several subgroups, so the subgroup is bound to a value set instead of being fixed
* category[mainGroup] = SEAlertInformationCategoryCS#C
* category[subGroup] from SEAlertInformationHypersensitivitySubgroupVS (required)
* extension contains
    SeverityLevel named severityLevel 0..1 and
    VerificationStatus named verificationStatus 0..1
* extension[severityLevel] ^short = "Severity level (allvarlighetsgrad)"
* extension[verificationStatus] ^short = "Degree of certainty (visshetsgrad)"
* extension[verificationStatus] ^comment = "If the degree of certainty is not given, the hypersensitivity is to be interpreted as confirmed."

Instance: SEAlertInformation-7-HypersensitivityFlagExample
InstanceOf: SEAlertInformation-7-HypersensitivityFlag
Title: "Example 7: Hypersensitivity"
Description: "Minimal example of medical alert information about a chemical hypersensitivity."
* status = #active
* category[mainGroup] = SEAlertInformationCategoryCS#C
* category[subGroup] = SEAlertInformationCategoryCS#C1
* code = $SCT#373568007 "Chlorhexidine"
* code.text = "Klorhexidin"
* extension[severityLevel].valueCodeableConcept = SEAlertInformationSeverityLevelCS#442452003 "Life-threatening"
* extension[verificationStatus].valueCodeableConcept = $AllergyVerification#presumed "Presumed"
* subject = Reference(SEAlertInformationPatientExample)

ValueSet: SEAlertInformationHypersensitivityVS
Id: SEAlertInformationHypersensitivityVS
Title: "Alert Information – Hypersensitivity"
Description: "Codes for medical alert information about hypersensitivity: chemicals (SNOMED CT), active substances (ATC or NSL), excipients (NSL) and medicinal products (NPL)."
* ^experimental = false
* include codes from valueset SEAlertInformationChemicalAllergySnomedVS
* include codes from system $ATC
* include codes from system $NSL
* include codes from system $NPL

ValueSet: SEAlertInformationHypersensitivitySubgroupVS
Id: SEAlertInformationHypersensitivitySubgroupVS
Title: "Subgroups of Hypersensitivity"
Description: "The subgroups of the main group hypersensitivity in the categorization of medical alert information."
* ^experimental = false
* include codes from system SEAlertInformationCategoryCS where concept descendent-of #C

ValueSet: SEAlertInformationChemicalAllergySnomedVS
Id: 59871000052102
Title: "Chemicals Snomed CT"
Description: "SNOMED CT codes for chemicals, for medical alert information about hypersensitivity."
* ^experimental = false
* include $SCT#373568007 "klorhexidin"
* include $SCT#111088007 "latex"
* include $SCT#281000220103 "taurolidin"

Mapping:  SEAlertInformation-7-HypersensitivityFlagToUMI
Source:   SEAlertInformation-7-HypersensitivityFlag
Target: "https://www.ehalsomyndigheten.se/verksamhet/ndi/interoperabilitet/uppmarksamhetsinformation/"
Id:       UMI
Title:    "UMI"
Description: "Mapping from the elements of this profile to the classes and attributes of the information specification for medical alert information (UMI), version 6.1.2. The mappings common to all medical alert information (subject, category) are given in the profile SE AlertInformation Flag."
* code -> "Aktiv substans.typ, Hjälpämne läkemedel.typ, Kemikalie.typ, Läkemedelsprodukt.produkt-id" "Överkänslighetstillstånd.värde is not handled in the profile. Verifieringsmetod is not handled in the profile."
* status -> "Överkänslighetstillstånd(Observation).status, negation" "Flag.status is set as follows: observed presence (observerad förekomst) and negation = false → active; observed presence and negation = true → inactive. entered-in-error is not used."
* period -> "Överkänslighetstillstånd(Observation).tid"
* extension[severityLevel] -> "Överkänslighetstillstånd(Observation).allvarlighetsgrad" "livshotande → life-threatening, skadlig → harmful, besvärande → discomforting. On a two-level scale: life-threatening and harmful → high, discomforting → low."
* extension[verificationStatus] -> "Överkänslighetstillstånd(Observation).visshetsgrad" "misstänkt → presumed. If the degree of certainty is not given, it is interpreted as confirmed."
