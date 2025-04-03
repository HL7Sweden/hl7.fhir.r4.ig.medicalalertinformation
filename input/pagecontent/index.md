# HL7 FHIR version R4 alert information implementation guide for Sweden

This FHIR implementation guide is published by HL7 Sweden and expresses the profiles used for alert information based on the 
Swedich National Board of Social Affairs and Health (Socialstyrelsen) specification 
<https://www.socialstyrelsen.se/kunskapsstod-och-regler/omraden/e-halsa/tillampning/uppmarksamhetsinformation/>.

<!---
Denna implementationsguide publiceras av HL7 Sverige och uttrycker de profiler som används för uppmärksamhetsinformation baserad på Socialstyrelsens informationsspecifikation för
uppmärksamhetsinformation <https://www.socialstyrelsen.se/kunskapsstod-och-regler/omraden/e-halsa/tillampning/uppmarksamhetsinformation/>.
-->

# Användningsbeskrivning

Här kan vi beskriva hur profilen SEAlerInformationFlag ska användas i kombination med övriga profiler som refereras till. Det vi behöver beskriva är bl.a.
 - Tändning och släckning
 - Hantering av Ej strukturanpassad uppmärksamhetsinformation
 - ...

Jag har än så länge bara skapat profiler för de observationer som hanterar smitta. Informationen i Socialstyrelsens informationsmodell går att hantera på olika sätt i FHIR. Exempelvis kan information om smitta hanteras med resursen Condition men kan också beskrivas som en Observation. Jag är inne på att initialt testa om användningen av resurserna Observation, Procedure och AllergyIntolerance kan täcka de behov vi har.

# The working group
The development of this implementation guide is carried out by a work group under the management of HL7 Sweden <http://hl7.se>. The group is composed of representatives from regions, state authorities, system vendors and other experts within the FHIR standard, informatics, architecture and terminology.

<!---
Framtagandet av dessa basprofiler och utökningar genomförs av en arbetsgrupp under HL7 Sverige <http://hl7.se>. Gruppen består av representanter från regioner, myndigheter, systemleverantörer samt andra experter inom FHIR, informatik, arkitektur, terminologi etc.
-->

# Contact information
To reach the working group for the alert information Implementation Guide contact  
[Claudia Ehrentraut](mailto:claudia.ehrentraut@regionstockholm.se) - Project manager for the alert information working group.

<!---
För att komma i kontakt med gruppen som arbetar med uppmärksamhetsinformation:
[Claudia Ehrentraut](mailto:claudia.ehrentraut@regionstockholm.se) - Projektledare för arbetsgruppen för uppmärksamhetsinformation.
-->