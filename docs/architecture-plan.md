# Handleapp Architecture Plan

## Overview
Dette dokumentet skisserer en første arkitektur for en handleapp som skal
fungerer på iOS og Samsung Family Hub-kjøleskap, og senere integreres med
Hisense RQ760N4IFE side-by-side kjøleskap. Fokus er på en fleksibel og
fremtidssikker løsning som kan videreutvikles i iterasjoner.

## Mål
- **Kryssplattform**: En felles kodebase for iOS og Samsung Family Hub (Tizen)
  med støtte for fremtidige Hisense-enheter.
- **Offline-first**: Sømløs brukeropplevelse selv uten nett.
- **Utvidbar**: Arkitektur som gjør det enkelt å koble på nye tjenester og
enheter.
- **Sikker**: Sikre brukerdata og autentisering.

## Teknologistack
- **Frontend**: Flutter med Tizen-støtte. Flutter gir native-lignende
  opplevelser på iOS og har et voksende økosystem for Tizen. Vi kan benytte
  `flutter-tizen` for å bygge til Samsung Family Hub.
- **Backend/API**: Cloud-basert GraphQL/REST API (f.eks. Firebase, Supabase
  eller egen Node/Go backend) for synkronisering mellom enheter.
- **Database lokalt**: SQLite via `sqflite` (Flutter) for offline caching.
- **State management**: Riverpod eller Bloc for strukturert state-håndtering.
- **Autentisering**: OAuth 2.0/OpenID Connect med støtte for Apple ID og
  Samsung Account, samt e-post/telefon.

## Arkitektur
1. **Presentasjonslag**
   - Delte Flutter-widgets optimalisert for ulike skjermstørrelser.
   - Responsivt design med støtte for pekeskjerm (Family Hub) og touch (mobil).
2. **State-lag**
   - Riverpod-providers som kapsler API-kall og lokal state.
3. **Data-lag**
   - Repositories som synker med backend og lagrer i lokal database.
4. **Integrasjonslag**
   - Abstrakte services for hvitevarer. Start med en generisk adapter og
     implementer konkrete klasser for Samsung og senere Hisense.

## Funksjonalitetsplan (MVP)
1. **Brukerhåndtering**
   - Registrering, innlogging og profil.
2. **Handlelister**
   - Opprette, dele og redigere lister.
   - Felles sanntidsoppdatering via backend.
3. **Produktkatalog**
   - Søke etter varer, kategorier og forslag.
4. **Kjøleskapsintegrasjon (fase 2)**
   - Lesing av sensor-/lagerdata der tilgjengelig.
   - Push-varsler til appen ved lav beholdning.

## Enhetsspesifikke hensyn
- **iOS**: Følge Apple Human Interface Guidelines. Bruke Sign in with Apple.
- **Samsung Family Hub**: Tizen-app med fokus på stor skjerm. Navigasjon via
  pekeskjerm og fysiske knapper. Optimaliser for liggende modus.
- **Hisense RQ760N4IFE**: Kartlegg API-er/SDK når tilgjengelig. Planlegg for
  modulbasert integrasjon som kan kobles på uten å endre kjernefunksjonalitet.

## Distribusjon
- CI/CD med GitHub Actions som bygger Flutter-apper for iOS (via Codemagic el.
  lignende) og Tizen (docker-baserte bygg).
- Feature flag-system for gradvis utrulling av nye integrasjoner.

## Neste steg
1. Opprette Flutter-prosjekt med Tizen-støtte og basislayout.
2. Definere datamodeller for handleliste, bruker og enhetsintegrasjon.
3. Velge backend-løsning (MVP: Firebase Firestore) og sette opp første API.
4. Sette opp CI/CD pipeline for bygg og tester.

