<style>
    table.umi { table-layout: fixed; width: 100%; }
    table.umi th:nth-child(1), table.umi td:nth-child(1) { width: 34%; }
    table.umi th:nth-child(2), table.umi td:nth-child(2) { width: 24%; }
    table.umi th:nth-child(3), table.umi td:nth-child(3) { width: 42%; }
</style>

This page describes how the information specification for medical alert information (UMI), version 6.1.2, published by the Swedish eHealth Agency (E-hälsomyndigheten), is represented in the profiles of this guide: which profile is used for each group and subgroup of medical alert information, and how the classes and attributes of the specification map to the elements of the profile. The descriptions of the groups and subgroups are found on the profile pages. The terms follow [Terminology and translations](translations.html).

### Overview of the profiles

All profiles are derived from the base profile [SE AlertInformation Flag](StructureDefinition-SEAlertInformationFlag.html), which holds the requirements that are common to all medical alert information. Each of the profiles 1–10 corresponds to one subgroup of medical alert information and adds the requirements that are specific to that subgroup: the value set for `Flag.code`, the main group and subgroup in `Flag.category` and, for some subgroups, extensions. The patient is given with the Swedish base profile [SE Base Patient](https://hl7.se/fhir/ig/base/StructureDefinition-SEBasePatient.html). Select a profile in the diagram to open it.

<div style="margin: 1em 0 2em 0;">
{% include profile-overview.svg %}
</div>

### Mapping per subgroup

For each subgroup, the tables below give how the classes and attributes in the information specification for medical alert information (UMI) are represented in the profile. UMI classes and attributes are given with their Swedish names, as in the specification. The same mapping is shown under *Mappings* on each profile page. The *Mappings* tab also shows mappings to the HL7 RIM and to the FiveWs pattern; those are inherited automatically from the FHIR resource Flag and are not specific to this guide.

The mapping is based on the work with medical alert information in openEHR. Supplementary information, for example the underlying diagnosis or procedure, can be referenced from the medical alert information with the extension `detail` (flag-detail). For each subgroup, the FHIR resource that can be used for the supplementary information is given.

#### Common to all medical alert information

The following applies to all subgroups and is defined in the base profile [SE AlertInformation Flag](StructureDefinition-SEAlertInformationFlag.html).

<table class="grid umi">
<thead><tr><th>UMI</th><th>FHIR</th><th>Comment</th></tr></thead>
<tbody>
<tr><td>Patient</td><td><code>subject</code></td><td>Reference to the patient, according to SE Base Patient.</td></tr>
<tr><td>Typ av uppmärksamhetsinformation, huvudgrupp (main group)</td><td><code>category[mainGroup]</code></td><td>The main group of medical alert information. <code>Flag.category</code> can be given as the main group, the subgroup or both.</td></tr>
<tr><td>Typ av uppmärksamhetsinformation, undergrupp (subgroup)</td><td><code>category[subGroup]</code></td><td>The subgroup of medical alert information.</td></tr>
<tr><td>negation</td><td><code>status</code></td><td>Negation is handled via <code>Flag.status</code>. How the status is set is given for each subgroup. <code>entered-in-error</code> is not used.</td></tr>
<tr><td>–</td><td><code>code.text</code></td><td>The value the user has selected in the system, for example the term in column A of the code list, can be given in <code>code.text</code>.</td></tr>
<tr><td>–</td><td><code>extension[comment]</code></td><td>Comment on the medical alert information (note extension).</td></tr>
<tr><td>–</td><td><code>extension[priority]</code></td><td>Priority of the medical alert information (flag-priority extension).</td></tr>
<tr><td>–</td><td><code>extension[detail]</code></td><td>Reference to supplementary information (flag-detail extension).</td></tr>
</tbody>
</table>

### Medical conditions and treatments

#### 1 Other medical condition

Profile: [SE AlertInformation 1 Other Medical Condition Flag](StructureDefinition-SEAlertInformation-1-OtherMedicalConditionFlag.html)

<table class="grid umi">
<thead><tr><th>UMI</th><th>FHIR</th><th>Comment</th></tr></thead>
<tbody>
<tr><td>Annat medicinskt tillstånd.värde</td><td><code>code</code></td><td>A code from the value set <a href="ValueSet-1.2.752.116.3.1.16.1.1.html">Alert Information – Other Medical Condition</a> (1.2.752.116.3.1.16.1.1).</td></tr>
<tr><td>Annat medicinskt tillstånd.status [observerad förekomst], negation [sant/falskt]</td><td><code>status</code></td><td>observerad förekomst and negation = falskt → <code>active</code><br/>observerad förekomst and negation = sant → <code>inactive</code></td></tr>
<tr><td>Annat medicinskt tillstånd.tid (TS)</td><td><code>period.start</code>, <code>period.end</code></td><td></td></tr>
</tbody>
</table>

Supplementary information: Condition.

#### 2 Treatment

Profile: [SE AlertInformation 2 Treatment Flag](StructureDefinition-SEAlertInformation-2-TreatmentFlag.html)

<table class="grid umi">
<thead><tr><th>UMI</th><th>FHIR</th><th>Comment</th></tr></thead>
<tbody>
<tr><td>Behandling.kod</td><td><code>code</code></td><td>A code from the value set <a href="ValueSet-1.2.752.116.3.1.16.1.2.html">Alert Information – Treatment</a> (1.2.752.116.3.1.16.1.2), or the NPL-id of a medicinal product or the NSL-id of an active substance.</td></tr>
<tr><td>Behandling.status [pågående, utförd, avbruten]</td><td><code>status</code></td><td>pågående (ongoing) → <code>active</code><br/>utförd (completed) or avbruten (cancelled) → <code>inactive</code></td></tr>
<tr><td>Behandling.tid (IVL)</td><td><code>period.start</code>, <code>period.end</code></td><td></td></tr>
</tbody>
</table>

Supplementary information: Procedure.

#### 3 Presence of transplant

Profile: [SE AlertInformation 3 Presence of Transplant Flag](StructureDefinition-SEAlertInformation-3-PresenceOfTransplantFlag.html)

<table class="grid umi">
<thead><tr><th>UMI</th><th>FHIR</th><th>Comment</th></tr></thead>
<tbody>
<tr><td>Förekomst av transplantat.värde</td><td><code>code</code></td><td>A code from the value set <a href="ValueSet-1.2.752.116.3.1.16.1.4.html">Alert Information – Presence of Transplant</a> (1.2.752.116.3.1.16.1.4).</td></tr>
<tr><td>Förekomst av transplantat.status [observerad förekomst], negation [sant/falskt]</td><td><code>status</code></td><td>observerad förekomst and negation = falskt → <code>active</code><br/>observerad förekomst and negation = sant → <code>inactive</code></td></tr>
<tr><td>Förekomst av transplantat.tid (TS)</td><td><code>period.start</code>, <code>period.end</code></td><td></td></tr>
<tr><td>Transplantation</td><td>–</td><td>The class Transplantation and its attributes are not mapped, since what is relevant for the secondary documentation is that the presence of transplant is given. Documentation of a transplantation in the primary documentation implies presence of transplant.</td></tr>
<tr><td>Kroppsstruktur</td><td>–</td><td>Not handled in the secondary documentation.</td></tr>
</tbody>
</table>

Supplementary information: Condition.

#### 4 Presence of implant

Profile: [SE AlertInformation 4 Presence of Implant Flag](StructureDefinition-SEAlertInformation-4-PresenceOfImplantFlag.html)

<table class="grid umi">
<thead><tr><th>UMI</th><th>FHIR</th><th>Comment</th></tr></thead>
<tbody>
<tr><td>Förekomst av implantat.värde</td><td><code>code</code></td><td>A code from the value set <a href="ValueSet-1.2.752.116.3.1.16.1.3.html">Alert Information – Presence of Implant</a> (1.2.752.116.3.1.16.1.3). The information in the class Implantat is therefore not used.</td></tr>
<tr><td>Förekomst av implantat.status [observerad förekomst], negation [sant/falskt]</td><td><code>status</code></td><td>observerad förekomst and negation = falskt → <code>active</code><br/>observerad förekomst and negation = sant → <code>inactive</code></td></tr>
<tr><td>Förekomst av implantat.tid (TS)</td><td><code>period.start</code>, <code>period.end</code></td><td></td></tr>
<tr><td>Implantation, Avlägsnande av implantat</td><td>–</td><td>The classes Implantation and Avlägsnande av implantat and their attributes are not mapped, since what is relevant for the secondary documentation is that the presence of implant is given. An implantation in the primary documentation implies presence of implant, and a removal of the implant negates the presence of implant in the secondary documentation.</td></tr>
<tr><td>Kroppsstruktur, Implantat, tillverkare, produktnamn, modellnummer</td><td>–</td><td>Not handled in the secondary documentation.</td></tr>
</tbody>
</table>

Supplementary information: Condition; Procedure for the implantation; Observation, for example that the history, a clinical examination or an X-ray examination shows that an implant is present.

### Infection

#### 5 Presence of infectious agent

Profile: [SE AlertInformation 5 Presence of Infectious Agent Flag](StructureDefinition-SEAlertInformation-5-PresenceOfInfectiousAgentFlag.html)

<table class="grid umi">
<thead><tr><th>UMI</th><th>FHIR</th><th>Comment</th></tr></thead>
<tbody>
<tr><td>Förekomst av smittämne.värde</td><td><code>code</code></td><td>A code from the value set <a href="ValueSet-1.2.752.116.3.1.16.1.5.html">Alert Information – Presence of Infectious Agent</a> (1.2.752.116.3.1.16.1.5), for example MRSA. The corresponding combinations of ICD-10-SE codes are given in the concept map <a href="ConceptMap-SEAlertInformationInfectiousAgentSnomedToICD10SE.html">Presence of Infectious Agent SNOMED CT to ICD-10-SE</a>.</td></tr>
<tr><td>Förekomst av smittämne.status [observerad förekomst], negation [sant/falskt]</td><td><code>status</code></td><td>observerad förekomst and negation = falskt → <code>active</code><br/>observerad förekomst and negation = sant → <code>inactive</code></td></tr>
<tr><td>Förekomst av smittämne.tid (TS/IVL)</td><td><code>period.start</code>, <code>period.end</code></td><td></td></tr>
</tbody>
</table>

Supplementary information: Condition.

#### 6 Presence of infectious disease

Profile: [SE AlertInformation 6 Presence of Infectious Disease Flag](StructureDefinition-SEAlertInformation-6-PresenceOfInfectiousDiseaseFlag.html)

<table class="grid umi">
<thead><tr><th>UMI</th><th>FHIR</th><th>Comment</th></tr></thead>
<tbody>
<tr><td>Förekomst av smittsam sjukdom.värde</td><td><code>code</code></td><td>A code from the value set <a href="ValueSet-1.2.752.116.3.1.16.1.6.html">Alert Information – Presence of Infectious Disease</a> (1.2.752.116.3.1.16.1.6), for example blodsmitta hos gravid.</td></tr>
<tr><td>Förekomst av smittsam sjukdom.status [observerad förekomst], negation [sant/falskt]</td><td><code>status</code></td><td>observerad förekomst and negation = falskt → <code>active</code><br/>observerad förekomst and negation = sant → <code>inactive</code></td></tr>
<tr><td>Förekomst av smittsam sjukdom.tid (TS/IVL)</td><td><code>period.start</code>, <code>period.end</code></td><td></td></tr>
</tbody>
</table>

Supplementary information: Condition.

### Hypersensitivity

#### 7 Hypersensitivity

Profile: [SE AlertInformation 7 Hypersensitivity Flag](StructureDefinition-SEAlertInformation-7-HypersensitivityFlag.html)

<table class="grid umi">
<thead><tr><th>UMI</th><th>FHIR</th><th>Comment</th></tr></thead>
<tbody>
<tr><td>Kemikalie.typ, Aktiv substans.typ, Hjälpämne läkemedel.typ, Läkemedelsprodukt.produkt-id</td><td><code>code</code></td><td>A code from the value set <a href="ValueSet-SEAlertInformationHypersensitivityVS.html">Alert Information – Hypersensitivity</a>: chemicals (SNOMED CT), active substances (ATC or NSL), excipients (NSL) or medicinal products (NPL). The subgroup is given in <code>category[subGroup]</code>.</td></tr>
<tr><td>Överkänslighetstillstånd.värde</td><td>–</td><td>Not handled in the profile.</td></tr>
<tr><td>Överkänslighetstillstånd.status [observerad förekomst], negation [sant/falskt]</td><td><code>status</code></td><td>observerad förekomst and negation = falskt → <code>active</code><br/>observerad förekomst and negation = sant → <code>inactive</code></td></tr>
<tr><td>Överkänslighetstillstånd.tid (TS)</td><td><code>period.start</code>, <code>period.end</code></td><td></td></tr>
<tr><td>Överkänslighetstillstånd.allvarlighetsgrad [livshotande, skadlig, besvärande]</td><td><code>extension[severityLevel]</code></td><td>livshotande → life-threatening<br/>skadlig → harmful<br/>besvärande → discomforting<br/>On a two-level scale, as in <code>AllergyIntolerance.criticality</code>: life-threatening and harmful → high, discomforting → low.</td></tr>
<tr><td>Överkänslighetstillstånd.visshetsgrad [misstänkt]</td><td><code>extension[verificationStatus]</code></td><td>misstänkt (suspected) → <code>presumed</code><br/>If the degree of certainty is not given, it is interpreted as established → <code>confirmed</code></td></tr>
<tr><td>Verifieringsmetod</td><td>–</td><td>Not handled in the profile. How the information was verified is much less important in the secondary documentation than that it has been verified and how certain it is (degree of certainty). The primary documentation should still make it possible to document the verification method.</td></tr>
</tbody>
</table>

Supplementary information: AllergyIntolerance.

### Special care routine

#### 8 Information that can lead to special care routine

Profile: [SE AlertInformation 8 Information Special Care Routine Flag](StructureDefinition-SEAlertInformation-8-InformationSpecialCareRoutineFlag.html)

<table class="grid umi">
<thead><tr><th>UMI</th><th>FHIR</th><th>Comment</th></tr></thead>
<tbody>
<tr><td>Information som kan leda till särskild vårdrutin.värde</td><td><code>code</code></td><td>A code from the value set <a href="ValueSet-59881000052100.html">Information Special Care Routine Snomed CT</a> (59881000052100).</td></tr>
<tr><td>Information som kan leda till särskild vårdrutin.status [observerad förekomst], negation [sant/falskt]</td><td><code>status</code></td><td>observerad förekomst and negation = falskt → <code>active</code><br/>observerad förekomst and negation = sant → <code>inactive</code></td></tr>
<tr><td>Information som kan leda till särskild vårdrutin.tid (TS)</td><td><code>period.start</code>, <code>period.end</code></td><td></td></tr>
</tbody>
</table>

Supplementary information: for example Observation or Consent.

#### 9 Decision that can lead to special care routine

Profile: [SE AlertInformation 9 Decision Special Care Routine Flag](StructureDefinition-SEAlertInformation-9-DecisionSpecialCareRoutineFlag.html)

<table class="grid umi">
<thead><tr><th>UMI</th><th>FHIR</th><th>Comment</th></tr></thead>
<tbody>
<tr><td>Beslut som kan leda till särskild vårdrutin.kod</td><td><code>code</code></td><td>A code from the value set <a href="ValueSet-103491000052103.html">Decision Special Care Routine Snomed CT</a> (103491000052103).</td></tr>
<tr><td>Beslut som kan leda till särskild vårdrutin.beskrivning</td><td><code>extension[descriptionOfDecision]</code></td><td>Description of the decision.</td></tr>
<tr><td>Beslut som kan leda till särskild vårdrutin.bifall [sant/falskt]</td><td><code>status</code></td><td>bifall (approval) = sant → <code>active</code><br/>bifall = falskt → <code>inactive</code></td></tr>
<tr><td>Beslut som kan leda till särskild vårdrutin.tidpunkt (TS)</td><td><code>period.start</code>, <code>period.end</code></td><td></td></tr>
</tbody>
</table>

Supplementary information: for example Observation or Consent.

### Uncategorized medical alert information

#### 10 Uncategorized medical alert information

Profile: [SE AlertInformation 10 Uncategorized Flag](StructureDefinition-SEAlertInformation-10-UncategorizedFlag.html)

<table class="grid umi">
<thead><tr><th>UMI</th><th>FHIR</th><th>Comment</th></tr></thead>
<tbody>
<tr><td>Ej strukturanpassad uppmärksamhetsinformation</td><td><code>code.text</code></td><td>The information is given as text. <code>Flag.code</code> has no binding, and a code is given in <code>code.coding</code> only if one is available.</td></tr>
<tr><td>Ej strukturanpassad uppmärksamhetsinformation.dokumentationstidpunkt</td><td><code>period.start</code></td><td></td></tr>
</tbody>
</table>
