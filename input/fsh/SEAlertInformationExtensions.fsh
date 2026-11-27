Alias: $AllergyVerification = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification

Extension: SeverityLevel
Id: SeverityLevel
Title: "SE AlertInformation Severity Level"
Description: "The severity level (allvarlighetsgrad) of a hypersensitivity."
Context: Flag
* value[x] only CodeableConcept
* value[x] from SEAlertInformationSeverityLevelVS (required)
* value[x] ^binding.description = "Life-threatening (livshotande), harmful (skadlig) or discomforting (besvärande). On a two-level scale, as in AllergyIntolerance.criticality, life-threatening and harmful correspond to high, and discomforting to low."

Extension: VerificationStatus
Id: VerificationStatus
Title: "SE AlertInformation Verification Status"
Description: "The degree of certainty (visshetsgrad) of a hypersensitivity, expressed with the codes of AllergyIntolerance.verificationStatus."
Context: Flag
* value[x] only CodeableConcept
* value[x] from SEAlertInformationVerificationStatusVS (preferred)
* value[x] ^binding.description = "The degree of certainty misstänkt (suspected) is given as presumed. If the degree of certainty is not given, it is to be interpreted as confirmed."

Extension: DecisionDescription
Id: DecisionDescription
Title: "SE AlertInformation Description of Decision"
Description: "Description of a decision that can lead to a special care routine (Beslut som kan leda till särskild vårdrutin.beskrivning)."
Context: Flag
* value[x] only Annotation

CodeSystem: SEAlertInformationSeverityLevelCS
Id: SEAlertInformationSeverityLevelCS
Title: "Severity Level Code System"
Description: "Severity level for hypersensitivity. The codes are defined in this code system; the extension SeverityLevel binds to the value set Severity Level."
* ^experimental = false
* ^caseSensitive = true
* #442452003 "Life-threatening" // Livshotande
* #442452003 ^definition = "Life-threatening severity level for hypersensitivity."
* #59021000052107 "Harmful" // Skadlig
* #59021000052107 ^definition = "Harmful severity level for hypersensitivity."
* #59031000052109 "Discomforting" // Besvärande
* #59031000052109 ^definition = "Discomforting severity level for hypersensitivity."

ValueSet: SEAlertInformationSeverityLevelVS
Id: SEAlertInformationSeverityLevelVS
Title: "Severity Level"
Description: "Severity level for hypersensitivity. The codes are defined in the code system Severity Level Code System."
* ^experimental = false
* include codes from system SEAlertInformationSeverityLevelCS

ValueSet: SEAlertInformationVerificationStatusVS
Id: SEAlertInformationVerificationStatusVS
Title: "Verification Status"
Description: "The degree of certainty (visshetsgrad) for hypersensitivity: confirmed (bekräftad) or presumed (misstänkt)."
* ^experimental = false
* $AllergyVerification#confirmed "Confirmed"
* $AllergyVerification#confirmed ^designation[0].language = #sv
* $AllergyVerification#confirmed ^designation[0].value = "Bekräftad"
* $AllergyVerification#presumed "Presumed"
* $AllergyVerification#presumed ^designation[0].language = #sv
* $AllergyVerification#presumed ^designation[0].value = "Misstänkt"
