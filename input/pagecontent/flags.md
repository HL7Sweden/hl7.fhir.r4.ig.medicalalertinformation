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

Medicinska uppmärksamhetssignaler används för att snabbt och tydligt uppmärksamma viktiga tillstånd, behandlingar eller risker hos en patient som kan påverka vård och omhändertagande. Nedan presenteras de olika typerna av uppmärksamhetssignaler som används inom svensk hälso- och sjukvård, tillsammans med tillhörande profiler och beskrivningar. Varje signal har en specifik betydelse och kan kopplas till särskilda vårdrutiner, smittskydd, överkänslighet eller annan viktig information som behöver beaktas i patientens vård.

De olika typerna av uppmärksamhetssignaler är definierade i Socialstyrelsens nationella specifikation för medicinsk uppmärksamhetsinformation.

# Medicinskt tillstånd och behandlingar

| Uppmärksamhetssignal | Profil | Beskrivning |
| -------- | ------- | ------- |
| 1 Annat medicinskt tillstånd | [SEAlertInformation-1-OtherMedicalConditionFlag](StructureDefinition-SEAlertInformation-1-OtherMedicalConditionFlag.html) | Medicinskt tillstånd som inte är överkänslighet, förekomst av smittsam sjukdom, förekomst av smittämne, förekomst av implantat eller förekomst av transplantat som patienten har eller inte har. Detta dokumenteras med hjälp av klassen observation i referensmodellen. Uppmärksamhetsinformation om annat medicinskt tillstånd anses aktuell om det finns en dokumenterad förekomst av tillståndet hos patienten, och ingen senare uppgift om att patienten inte längre har detta tillstånd. De medicinska tillstånd som behöver uppmärksammas finns i urvalet [Uppmärksamhetsinformation Annat medicinskt tillstånd](ValueSet-1.2.752.116.3.1.16.1.1.html) |
| 2 Behandling | [SEAlertInformation-2-TreatmentFlag](StructureDefinition-SEAlertInformation-2-TreatmentFlag.html) | Åtgärder som syftar till att förebygga ohälsa eller bevara eller förbättra den enskildes hälsotillstånd. Detta dokumenteras med hjälp av klassen aktivitet i referensmodellen. Uppmärksamhetsinformation om behandling anses aktuell om det finns en dokumenterad behandling med status pågående, och ingen senare uppgift om att behandlingen inte längre pågår. De behandlingar som behöver uppmärksammas finns i kodverk Uppmärksamhetsinformation - Behandling, och inkluderar både läkemedelsbehandlingar och andra behandlingar. Läkemedelsbehandlingar anges i kodverket i form av ett urval av ATC-koder (1.2.752.116.3.1.16.1.2.2). Om dokumentationen görs med Snomed CT anges kod 416608005, läkemedelsbehandling i klass behandling, medan information om vilket läkemedel som används i behandlingen anges i attribut ’typ’ i klass aktiv substans eller i attribut ’produkt-id’ i klass läkemedelsprodukt. |
| 3 Förekomst av transplantat | [SEAlertInformation-3-PresenceOfGraftsConditionFlag](StructureDefinition-SEAlertInformation-3-PresenceOfGraftsConditionFlag.html) | Indikerar förekomst av transplantat hos patienten, såsom organ eller vävnad som transplanterats. Uppmärksamhetsinformation om transplantat anses aktuell om det finns en dokumenterad förekomst av transplantatet hos patienten, och ingen senare uppgift om att transplantatet inte längre är närvarande. |
| 4 Förekomst av implantat | [SEAlertInformation-4-PresenceOfImplantFlag](StructureDefinition-SEAlertInformation-4-PresenceOfImplantFlag.html) | Indikerar förekomst av implantat hos patienten, såsom medicinska enheter eller proteser som har implanterats. Uppmärksamhetsinformation om implantat anses aktuell om det finns en dokumenterad förekomst av implantatet hos patienten, och ingen senare uppgift om att implantatet inte längre är närvarande. |

# Smitta

| Uppmärksamhetssignal | Profil | Beskrivning |
| -------- | ------- | ------- |
| 5 Förekomst av smittämne | [SEAlertInformation-5-PresenceOfInfectiousAgentFlag](StructureDefinition-SEAlertInformation-5-PresenceOfInfectiousAgentFlag.html) | Indikerar förekomst av smittämne hos patienten, såsom bakterier, virus eller andra mikroorganismer som kan orsaka infektion. Uppmärksamhetsinformation om smittämne anses aktuell om det finns en dokumenterad förekomst av smittämnet hos patienten, och ingen senare uppgift om att smittämnet inte längre är närvarande. |
| 6 Förekomst av smittsam sjukdom | [SEAlertInformation-6-PresenceOfContagiousDiseaseFlag](StructureDefinition-SEAlertInformation-6-PresenceOfContagiousDiseaseFlag.html) | Indikerar förekomst av smittsam sjukdom hos patienten, såsom sjukdomar som kan överföras mellan individer. Uppmärksamhetsinformation om smittsam sjukdom anses aktuell om det finns en dokumenterad förekomst av sjukdomen hos patienten, och ingen senare uppgift om att sjukdomen inte längre är närvarande. |

# Överkänslighet

| Uppmärksamhetssignal | Profil | Beskrivning |
|---|---|---|
| 7 Överkänslighetstillstånd | [SEAlertInformation-7-AllergyIntoleranceFlag](StructureDefinition-SEAlertInformation-7-AllergyIntoleranceFlag.html) |  Indikerar en överkänslighet mot en specifik kemikalie, aktiv substans, hjälpämne eller en specifik läkemedelsprodukt. Uppmärksamhetsinformation om överkänslighet anses aktuell om det finns en dokumenterad förekomst av överkänsligheten, och ingen senare uppgift om att patienten inte längre är överkänslig. |

<!-- ## Aktiv substans

| Uppmärksamhetssignal | Profil | Beskrivning |
|---|---|---|
| 8 Aktiv substans | [SEAlertInformationActivePharmaceuticalIngredientFlag](StructureDefinition-SEAlertInformationActivePharmaceuticalIngredientFlag.html) | Indikerar en överkänslighet mot en specifik aktiv substans i ett läkemedel. Dokumenteras med hjälp av klassen observation i referensmodellen. Uppmärksamhetsinformation om aktiv substans anses aktuell om det finns en dokumenterad förekomst av överkänsligheten, och ingen senare uppgift om att patienten inte längre är överkänslig mot den specifika aktiva substansen. |
| 9 Hjälpämne läkemedel | [SEAlertInformationExcipientFlag](StructureDefinition-SEAlertInformationExcipientFlag.html) | Indikerar en överkänslighet mot ett hjälpämne i ett läkemedel. Dokumenteras med hjälp av klassen observation i referensmodellen. Uppmärksamhetsinformation om hjälpämne läkemedel anses aktuell om det finns en dokumenterad förekomst av överkänsligheten, och ingen senare uppgift om att patienten inte längre är överkänslig mot det specifika hjälpämnet. |
| 10 Läkemedelsprodukt | [SEAlertInformationDrugProductFlag](StructureDefinition-SEAlertInformationDrugProductFlag.html) | Indikerar en överkänslighet mot en specifik läkemedelsprodukt. Dokumenteras med hjälp av klassen observation i referensmodellen. Uppmärksamhetsinformation om läkemedelsprodukt anses aktuell om det finns en dokumenterad förekomst av överkänsligheten, och ingen senare uppgift om att patienten inte längre är överkänslig mot den specifika läkemedelsprodukten. | -->

# Vårdrutinavvikelser

| Uppmärksamhetssignal | Profil | Beskrivning |
|---|---|---|
| 8 Information som kan leda till särskild vårdrutin | [SEAlertInformation-8-SpecialCareRoutineFlag](StructureDefinition-SEAlertInformation-8-SpecialCareRoutineFlag.html) | Indikerar information som kan leda till särskilda vårdrutiner för patienten, såsom specifika åtgärder eller behandlingar baserade på patientens tillstånd eller behov. |
| 9 Beslut som kan leda till särskild vårdrutin | [SEAlertInformation-9-DecisionSpecialCareRoutineFlag](StructureDefinition-SEAlertInformation-9-DecisionSpecialCareRoutineFlag.html) | Indikerar beslut som kan leda till särskilda vårdrutiner för patienten, såsom specifika åtgärder eller behandlingar baserade på patientens tillstånd eller behov. |

# Ej strukturanpassad uppmärksamhetsinformation (Historiskt angiven uppmärksamhetsinformation)

| Uppmärksamhetssignal | Profil | Beskrivning |
|---|---|---|
| 10 Ej strukturanpassad uppmärksamhetsinformation | [SEAlertInformation-10-UnstructuredFlag](StructureDefinition-SEAlertInformation-10-UnstructuredFlag.html) | Ej strukturanpassad uppmärksamhetsinformation avser historiskt angiven uppmärksamhetsinformation som ej uppfyller gällande krav på informationsstruktur |