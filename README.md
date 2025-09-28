# Handleapp


Dette repoet inneholder planleggingen og kildekoden for en kryssplattform
handleapp som skal fungere på iOS, Samsung Family Hub (Tizen) og på sikt
Hisense RQ760N4IFE.

## Flutter-prosjekt
Kildekoden til appen ligger i katalogen [`app/`](app/). Prosjektet er satt opp
for Flutter med Tizen-støtte gjennom `flutter-tizen` og inneholder en grunnleggende
layout med tre faner (handleliste, oppskrifter og planlegging) og en
flytende handlingsknapp for å legge til nye elementer.

### Komme i gang
1. Installer [Flutter](https://docs.flutter.dev/get-started/install) og
   [flutter-tizen](https://github.com/flutter-tizen/flutter-tizen#installation).
2. Fra `app/`-mappen, kjør `flutter-tizen pub get` for å hente avhengigheter.
3. For å bygge eller kjøre på støttede plattformer:
   - iOS/Android/Web: `flutter run`
   - Samsung Family Hub (Tizen): `flutter-tizen run`

## Dokumentasjon
- [Arkitekturplan](docs/architecture-plan.md)