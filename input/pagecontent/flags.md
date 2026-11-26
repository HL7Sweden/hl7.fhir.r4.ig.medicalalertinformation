<style>
    table {
    table-layout: fixed;
    width: 100%;
    }
    th:nth-child(1), td:nth-child(1) {
    width: 18%;
    }
    th:nth-child(2), td:nth-child(2) {
    width: 32%;
    }
    th:nth-child(3), td:nth-child(3) {
    width: 50%;
    }
</style>

Medical alert information is used to quickly and clearly highlight important conditions, treatments, or risks in a patient that may affect care and management. Below, the different groups and subgroups of medical alert information, as defined in the eHealth Agency's (E-hälsomyndigheten) national specification for medical alert information, are presented together with the profile used for each subgroup.

The descriptions are translations of the class descriptions in the information specification for medical alert information, version 6.1.2, made by the HL7 Sweden working group for medical alert information. The terms follow [Terminology and translations](translations.html).

Each profile has a mapping to UMI, shown under *Mappings* on the profile page and linked from its description. For each element in the profile, the mapping gives the class and attribute in the information specification for medical alert information that the element corresponds to, and how the value is set. The *Mappings* tab also shows mappings to the HL7 RIM and to the FiveWs pattern. Those are inherited automatically from the FHIR resource Flag and are not specific to this guide.

<!-- Medicinska uppmärksamhetssignaler används för att snabbt och tydligt uppmärksamma viktiga tillstånd, behandlingar eller risker hos en patient som kan påverka vård och omhändertagande. Nedan presenteras de olika typerna av uppmärksamhetssignaler som används inom svensk hälso- och sjukvård, tillsammans med tillhörande profiler och beskrivningar. Varje signal har en specifik betydelse och kan kopplas till särskilda vårdrutiner, smittskydd, överkänslighet eller annan viktig information som behöver beaktas i patientens vård.

De olika typerna av uppmärksamhetssignaler är definierade i Socialstyrelsens nationella specifikation för medicinsk uppmärksamhetsinformation. -->



### Medical conditions and treatments

| Subgroup of medical alert information | Profile | Description |
| -------- | ------- | ------- |
| 1 Other medical condition | [SEAlertInformation-1-OtherMedicalConditionFlag](StructureDefinition-SEAlertInformation-1-OtherMedicalConditionFlag.html) | A medical condition, other than hypersensitivity, presence of infectious disease, presence of infectious agent, presence of implant or presence of transplant, that the patient has or does not have. This is documented using the observation class in the reference model. Medical alert information about another medical condition is considered current if there is a documented occurrence of the condition in the patient, and no later record stating that the patient no longer has the condition. The medical conditions that need to be highlighted are listed in the [value set for other medical condition](ValueSet-1.2.752.116.3.1.16.1.1.html). |
| 2 Treatment | [SEAlertInformation-2-TreatmentFlag](StructureDefinition-SEAlertInformation-2-TreatmentFlag.html) | Interventions intended to prevent ill health or to maintain or improve the individual's state of health. This is documented using the activity class in the reference model. Medical alert information about treatment is considered current if there is a documented treatment with the status ongoing, and no later record stating that the treatment is no longer ongoing. The treatments that need to be highlighted are listed in the [value set for treatment](ValueSet-1.2.752.116.3.1.16.1.2.html) and include both drug treatments and other treatments. Drug treatments are given as a selection of ATC codes (1.2.752.116.3.1.16.1.2.2). If SNOMED CT is used, the code 416608005 *drug therapy* is given in the class treatment, while the drug used in the treatment is given in the attribute type in the class active substance, or in the attribute product-id in the class medicinal product. |
| 3 Presence of transplant | [SEAlertInformation-3-PresenceOfTransplantFlag](StructureDefinition-SEAlertInformation-3-PresenceOfTransplantFlag.html) | That the patient has, or does not have, a transplant, i.e. surgically transferred living tissue. This is documented using the observation class in the reference model. Information about a transplant is to be highlighted if there is a documented transplantation or presence of transplant in the patient, and no later documented negation of the presence of the transplant. The transplants that need to be highlighted are listed in the [value set for presence of transplant](ValueSet-1.2.752.116.3.1.16.1.4.html). |
| 4 Presence of implant | [SEAlertInformation-4-PresenceOfImplantFlag](StructureDefinition-SEAlertInformation-4-PresenceOfImplantFlag.html) | That the patient has, or does not have, an implant, i.e. something that has been surgically inserted into the body for diagnostic, therapeutic or experimental purposes. This is documented using the observation class in the reference model. Medical alert information about presence of implant is considered current if there is a documented presence of the implant in the patient, and no later record stating that the patient no longer has the implant. The implants that need to be highlighted are listed in the [value set for presence of implant](ValueSet-1.2.752.116.3.1.16.1.3.html). |

<!-- # Medicinskt tillstånd och behandlingar

| Uppmärksamhetssignal | Profil | Beskrivning |
| -------- | ------- | ------- |
| 1 Annat medicinskt tillstånd | [SEAlertInformation-1-OtherMedicalConditionFlag](StructureDefinition-SEAlertInformation-1-OtherMedicalConditionFlag.html) | Medicinskt tillstånd som inte är överkänslighet, förekomst av smittsam sjukdom, förekomst av smittämne, förekomst av implantat eller förekomst av transplantat som patienten har eller inte har. Detta dokumenteras med hjälp av klassen observation i referensmodellen. Uppmärksamhetsinformation om annat medicinskt tillstånd anses aktuell om det finns en dokumenterad förekomst av tillståndet hos patienten, och ingen senare uppgift om att patienten inte längre har detta tillstånd. De medicinska tillstånd som behöver uppmärksammas finns i urvalet [Uppmärksamhetsinformation Annat medicinskt tillstånd](ValueSet-1.2.752.116.3.1.16.1.1.html) |
| 2 Behandling | [SEAlertInformation-2-TreatmentFlag](StructureDefinition-SEAlertInformation-2-TreatmentFlag.html) | Åtgärder som syftar till att förebygga ohälsa eller bevara eller förbättra den enskildes hälsotillstånd. Detta dokumenteras med hjälp av klassen aktivitet i referensmodellen. Uppmärksamhetsinformation om behandling anses aktuell om det finns en dokumenterad behandling med status pågående, och ingen senare uppgift om att behandlingen inte längre pågår. De behandlingar som behöver uppmärksammas finns i kodverk Uppmärksamhetsinformation - Behandling, och inkluderar både läkemedelsbehandlingar och andra behandlingar. Läkemedelsbehandlingar anges i kodverket i form av ett urval av ATC-koder (1.2.752.116.3.1.16.1.2.2). Om dokumentationen görs med Snomed CT anges kod 416608005, läkemedelsbehandling i klass behandling, medan information om vilket läkemedel som används i behandlingen anges i attribut ’typ’ i klass aktiv substans eller i attribut ’produkt-id’ i klass läkemedelsprodukt. |
| 3 Förekomst av transplantat | [SEAlertInformation-3-PresenceOfTransplantFlag](StructureDefinition-SEAlertInformation-3-PresenceOfTransplantFlag.html) | Indikerar förekomst av transplantat hos patienten, såsom organ eller vävnad som transplanterats. Uppmärksamhetsinformation om transplantat anses aktuell om det finns en dokumenterad förekomst av transplantatet hos patienten, och ingen senare uppgift om att transplantatet inte längre är närvarande. |
| 4 Förekomst av implantat | [SEAlertInformation-4-PresenceOfImplantFlag](StructureDefinition-SEAlertInformation-4-PresenceOfImplantFlag.html) | Indikerar förekomst av implantat hos patienten, såsom medicinska enheter eller proteser som har implanterats. Uppmärksamhetsinformation om implantat anses aktuell om det finns en dokumenterad förekomst av implantatet hos patienten, och ingen senare uppgift om att implantatet inte längre är närvarande. | -->

### Infection

| Subgroup of medical alert information | Profile | Description |
| -------- | ------- | ------- |
| 5 Presence of infectious agent | [SEAlertInformation-5-PresenceOfInfectiousAgentFlag](StructureDefinition-SEAlertInformation-5-PresenceOfInfectiousAgentFlag.html) | That the patient carries, or does not carry, an infectious agent, i.e. disease-causing organisms that cause infectious diseases, such as viruses, bacteria, fungi and certain parasites. This is documented using the observation class in the reference model. Medical alert information about a specific infectious agent is considered current if there is a documented presence of the infectious agent in the patient, and no later record stating that the patient no longer carries it. The infectious agents that need to be highlighted are listed in the [value set for presence of infectious agent](ValueSet-1.2.752.116.3.1.16.1.5.html). |
| 6 Presence of infectious disease | [SEAlertInformation-6-PresenceOfInfectiousDiseaseFlag](StructureDefinition-SEAlertInformation-6-PresenceOfInfectiousDiseaseFlag.html) | That the patient has, or does not have, an infectious disease. This is documented using the observation class in the reference model. Medical alert information about an infectious disease is considered current if there is a documented presence of the infectious disease in the patient, and no later record stating that the patient no longer has it. The infectious diseases that need to be highlighted are listed in the [value set for presence of infectious disease](ValueSet-1.2.752.116.3.1.16.1.6.html). |

<!-- # Smitta

| Uppmärksamhetssignal | Profil | Beskrivning |
| -------- | ------- | ------- |
| 5 Förekomst av smittämne | [SEAlertInformation-5-PresenceOfInfectiousAgentFlag](StructureDefinition-SEAlertInformation-5-PresenceOfInfectiousAgentFlag.html) | Indikerar förekomst av smittämne hos patienten, såsom bakterier, virus eller andra mikroorganismer som kan orsaka infektion. Uppmärksamhetsinformation om smittämne anses aktuell om det finns en dokumenterad förekomst av smittämnet hos patienten, och ingen senare uppgift om att smittämnet inte längre är närvarande. |
| 6 Förekomst av smittsam sjukdom | [SEAlertInformation-6-PresenceOfInfectiousDiseaseFlag](StructureDefinition-SEAlertInformation-6-PresenceOfInfectiousDiseaseFlag.html) | Indikerar förekomst av smittsam sjukdom hos patienten, såsom sjukdomar som kan överföras mellan individer. Uppmärksamhetsinformation om smittsam sjukdom anses aktuell om det finns en dokumenterad förekomst av sjukdomen hos patienten, och ingen senare uppgift om att sjukdomen inte längre är närvarande. | -->

### Hypersensitivity

| Subgroup of medical alert information | Profile | Description |
|---|---|---|
| 7 Hypersensitivity | [SEAlertInformation-7-HypersensitivityFlag](StructureDefinition-SEAlertInformation-7-HypersensitivityFlag.html) | A state of increased sensitivity on contact with factors in the environment that are normally tolerated by most people. That the patient has, or does not have, a hypersensitivity is documented using the observation class in the reference model. Medical alert information about hypersensitivity is considered current if there is a documented presence of the hypersensitivity in the patient, and no later record stating that the patient no longer has it. The substances that are, or are suspected to be, linked to a hypersensitivity are given in the classes chemical, active substance, excipient and medicinal product. |

<!-- # Överkänslighet

| Uppmärksamhetssignal | Profil | Beskrivning |
|---|---|---|
| 7 Överkänslighetstillstånd | [SEAlertInformation-7-HypersensitivityFlag](StructureDefinition-SEAlertInformation-7-HypersensitivityFlag.html) |  Indikerar en överkänslighet mot en specifik kemikalie, aktiv substans, hjälpämne eller en specifik läkemedelsprodukt. Uppmärksamhetsinformation om överkänslighet anses aktuell om det finns en dokumenterad förekomst av överkänsligheten, och ingen senare uppgift om att patienten inte längre är överkänslig. | -->

### Special care routine

| Subgroup of medical alert information | Profile | Description |
|---|---|---|
| 8 Information that may lead to a special care routine | [SEAlertInformation-8-InformationSpecialCareRoutineFlag](StructureDefinition-SEAlertInformation-8-InformationSpecialCareRoutineFlag.html) | For example, that there is a threat against the patient. This is documented using the observation class in the reference model. The information is considered current if it is documented, and there is no later documentation stating that it no longer applies. |
| 9 Decision that may lead to a special care routine | [SEAlertInformation-9-DecisionSpecialCareRoutineFlag](StructureDefinition-SEAlertInformation-9-DecisionSpecialCareRoutineFlag.html) | For example, a decision made during an end-of-life care conversation (brytpunktssamtal) about palliative care at the end of life. This is documented using the decision class in the reference model. The decision is made by the patient, by healthcare professionals or jointly. Medical alert information about a decision on a special care routine is considered current if there is a documented decision on a special care routine that has not been revoked by a later documented decision. Note that decisions about cardiopulmonary resuscitation and life-sustaining treatment imply a special care routine when the attribute approval (bifall) has the value false, whereas decisions about palliative care, issuing of a prescription restriction and referral to a specific care unit imply a special care routine when approval has the value true. |

<!-- # Vårdrutinavvikelser

| Uppmärksamhetssignal | Profil | Beskrivning |
|---|---|---|
| 8 Information som kan leda till särskild vårdrutin | [SEAlertInformation-8-InformationSpecialCareRoutineFlag](StructureDefinition-SEAlertInformation-8-InformationSpecialCareRoutineFlag.html) | Indikerar information som kan leda till särskilda vårdrutiner för patienten, såsom specifika åtgärder eller behandlingar baserade på patientens tillstånd eller behov. |
| 9 Beslut som kan leda till särskild vårdrutin | [SEAlertInformation-9-DecisionSpecialCareRoutineFlag](StructureDefinition-SEAlertInformation-9-DecisionSpecialCareRoutineFlag.html) | Indikerar beslut som kan leda till särskilda vårdrutiner för patienten, såsom specifika åtgärder eller behandlingar baserade på patientens tillstånd eller behov. | -->

### Uncategorized medical alert information

| Subgroup of medical alert information | Profile | Description |
|---|---|---|
| 10 Uncategorized medical alert information | [SEAlertInformation-10-UncategorizedFlag](StructureDefinition-SEAlertInformation-10-UncategorizedFlag.html) | Uncategorized medical alert information refers here to historically recorded medical alert information that does not meet the current requirements for information structure, as well as medical alert information that is not nationally agreed. This is documented using the document class in the reference model. |

<!-- # Ej strukturanpassad uppmärksamhetsinformation (Historiskt angiven uppmärksamhetsinformation)

| Uppmärksamhetssignal | Profil | Beskrivning |
|---|---|---|
| 10 Ej strukturanpassad uppmärksamhetsinformation | [SEAlertInformation-10-UncategorizedFlag](StructureDefinition-SEAlertInformation-10-UncategorizedFlag.html) | Ej strukturanpassad uppmärksamhetsinformation avser historiskt angiven uppmärksamhetsinformation som ej uppfyller gällande krav på informationsstruktur | -->