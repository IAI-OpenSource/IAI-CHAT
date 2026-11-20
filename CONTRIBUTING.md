# Contribuer à IAI-CHAT

## Organisation

### Noyau — review obligatoire

| Module | Dossier | Responsabilité |
|--------|---------|----------------|
| Protocole | `packages/core_protocol` | Format de paquet, sérialisation, TTL, versioning |
| Crypto | `packages/crypto_engine` | Clés, chiffrement, signatures, empreintes |
| Transport | `packages/mesh_transport` | Interface `MeshTransport`, LAN mock, BLE/Nearby |

Personne d’autre ne merge dans ces dossiers sans review d’un owner du noyau.

### Périphérie (le reste)

- **UI** (`apps/iai_chat`) — écrans, canaux, indicateurs d’état
- **QA / terrain** — scénarios multi-téléphones, checklist démo
- **Docs / démo** — README, architecture, script de présentation janvier

## Workflow Git

1. Fork ou branche depuis `main` : `feature/<equipe>-<sujet>`
2. Un PR = une intention claire
3. CI / tests locaux avant review
4. Le noyau ne casse pas les interfaces publiques sans annonce dans le PR

## Interfaces figées (semaine 1)

Le noyau publie et stabilise :

- `Packet` / sérialisation (`core_protocol`)
- `CryptoEngine` (`crypto_engine`)
- `MeshTransport` (`mesh_transport`)

L’UI et la QA s’appuient **uniquement** sur ces contrats.

## Règles crypto

- Bibliothèques auditées uniquement
- Pas de « crypto maison »
- Toute PR crypto = review à **deux** personnes du noyau
