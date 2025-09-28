# Handleapp

Dette repoet inneholder planleggingen og etter hvert kildekoden for en
kryssplattform handleapp som skal fungere på iOS og Samsung Family Hub, med
fremtidig støtte for Hisense RQ760N4IFE.

## Dokumentasjon
- [Arkitekturplan](docs/architecture-plan.md)

## Løse en merge-konflikt
1. Åpne filen som er merket i Git-konflikten (for eksempel `README.md`) og se etter
   markørene `<<<<<<<`, `=======` og `>>>>>>>`.
2. Sammenlign innholdet i de to seksjonene og rediger filen slik at den gjenspeiler
   den teksten du ønsker å beholde. Fjern konfliktmarkørene når du er fornøyd.
3. Lagre filen og kjør `git add <filnavn>` for å markere konflikten som løst.
4. Kjør `git status` for å verifisere at det ikke er flere utestående konflikter,
   og commit deretter endringene med `git commit`.
5. Fortsett merge-prosessen eller push endringene til fjernlageret etter behov.

