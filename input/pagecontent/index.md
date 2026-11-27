### HL7 FHIR R4 Medical alert information implementation guide for Sweden

This FHIR implementation guide is published by HL7 Sweden and expresses the profiles used for handling medical alert information based on the
Swedish eHealth Agency (E-hälsomyndigheten) specification
[Uppmärksamhetsinformation - E-hälsomyndigheten](https://www.ehalsomyndigheten.se/verksamhet/ndi/interoperabilitet/uppmarksamhetsinformation/).

This implementation guide follows version 6.1.2 of the specification.

### Usage Description

This implementation guide describes how medical alert information can be structured and exchanged using the resources of the HL7 FHIR standard. The guide is based on the eHealth Agency's (E-hälsomyndigheten) information specification for medical alert information and aims to enable uniform and secure information exchange between healthcare systems, regardless of vendor. Medical alert information includes data on patients’ special needs, risks, or other circumstances that are important to consider in healthcare and social care situations. The information is intended to raise awareness among healthcare professionals and other relevant stakeholders, with the purpose of contributing to safe, person-centered, and secure care.

The implementation guide defines specialized FHIR profiles, extensions, value sets, code systems, and examples that comply with the eHealth Agency's national guidelines and conceptual models. It is intended to support technical integrations and interoperability between information systems in healthcare and social care. The target audience for the guide includes information managers, system administrators, developers, and others working with the implementation of FHIR-based information exchange in health and social care.

#### Use cases

The guide is designed to support common Swedish healthcare exchange scenarios, such as cross-organisational access (e.g., NPÖ) and regional synchronisation across systems. See [Use cases](use-cases.html) for detailed flows and recommended interactions (search, lifecycle, and optional provenance/source context).

#### Terminology

To ensure consistent wording across the guide, Swedish terms specific to medical alert information were translated into English according to [Terminology and translations](translations.html).

#### Code and displayed text

`Flag.code` holds the terminology code for the condition, treatment or substance (SNOMED CT, ICD-10-SE, ATC, NSL or NPL), from the value set of the profile for the subgroup. The value the user has selected in the system, for example the term in column A of the national code list for medical alert information (such as *Pacemaker* or *Blodsmitta hos gravid*), can be given in `Flag.code.text`.

For clients:

- Display `code.text` as the heading of the medical alert information, if it is given.
- Otherwise display `code.coding.display`.
- Use `code.coding` for interoperability and decision support.

#### Profiles

All profiles are derived from the base profile [SE AlertInformation Flag](StructureDefinition-SEAlertInformationFlag.html). See [Mapping from UMI](flags.html) for an overview of the profiles and the mapping from the information specification for medical alert information (UMI) to the profiles.

### The working group

The development of this implementation guide is carried out by a work group under the management of HL7 Sweden <http://hl7.se>. The group is composed of representatives from regions, state authorities, system vendors and other experts within the FHIR standard, informatics, architecture and terminology.

### Contact information

To reach the working group for the medical alert information implementation guide contact  
[Claudia Ehrentraut](mailto:claudia.ehrentraut@regionstockholm.se) - Project manager for the medical alert information working group.

### IP Statements

{% include ip-statements.xhtml %}

### Cross Version Analysis

{% include cross-version-analysis.xhtml %}

### Dependency Table

{% include dependency-table.xhtml %}
