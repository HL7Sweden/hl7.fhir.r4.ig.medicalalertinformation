# HL7 FHIR R4 Medical alert information implementation guide for Sweden

FHIR implementation guide for medical alert information (uppmärksamhetsinformation, UMI), published by HL7 Sweden and based on the Swedish eHealth Agency's (E-hälsomyndigheten) information specification for medical alert information.

- CI build (develop): https://build.fhir.org/ig/HL7Sweden/hl7.fhir.r4.ig.medicalalertinformation/branches/develop/

The profiles, extensions, value sets and examples are written in [FHIR Shorthand](https://fshschool.org/) in `input/fsh`, and the pages in `input/pagecontent`.

## Building locally

The repository contains no build scripts: the IG Publisher refuses scripts in an IG's repository, since anyone who can change the repository could otherwise run code on the computer of everyone who builds the IG.

Requirements: Java 17 or later, Node.js, [Jekyll](https://jekyllrb.com/) and an internet connection (FHIR packages and the terminology server).

1. Install SUSHI:

   ```bash
   npm install -g fsh-sushi
   ```

2. Download the IG Publisher to `input-cache` (ignored by git):

   ```bash
   mkdir -p input-cache && curl -L -o input-cache/publisher.jar https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar
   ```

3. Build the IG (the IG Publisher runs SUSHI first):

   ```bash
   java -jar input-cache/publisher.jar -ig .
   ```

The result is in `output/index.html`, and the QA report in `output/qa.html`.

If you prefer the helper scripts (`_genonce`, `_updatePublisher` and so on), get them from their source, [HL7/ig-publisher-scripts](https://github.com/HL7/ig-publisher-scripts), and keep them out of this repository.
