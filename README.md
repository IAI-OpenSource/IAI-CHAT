# IAI-CHAT

Messagerie locale chiffrée du club de programmation **IAI Open Source**.

Inspiration : [Bitchat](https://github.com/permissionlesstech) — sans Internet obligatoire, avec chiffrement de bout en bout, adaptée au campus.

## Objectif MVP (avant janvier)

- Chat privé **chiffré** entre téléphones proches
- Mode **LAN / mock** pour développer sans Bluetooth
- Transport réel (Nearby / BLE) branchable derrière la même interface
- Vérification d’identité simple (empreinte / QR) — si le temps le permet

## Structure du monorepo

```
IAI-CHAT/
├── apps/
│   └── iai_chat/          # App Flutter (UI) — équipe large
├── packages/
│   ├── core_protocol/     # Paquets, IDs, TTL — NOYAU (1–2 pers.)
│   ├── crypto_engine/     # E2EE, signatures — NOYAU (1–2 pers.)
│   └── mesh_transport/    # Transport abstrait + LAN/BLE — NOYAU (1–2 pers.)
└── docs/                  # Architecture, démo, process
```

**Règle d’or :** 4 à 6 personnes max touchent le noyau (`packages/*`).  
Les autres travaillent sur l’UI, les tests terrain, la doc et la démo.

## Stack

| Couche | Techno |
|--------|--------|
| App | Flutter (Android + iOS) |
| Packages partagés | Dart |
| Crypto | libs auditées (ex. `cryptography` / libsodium) — **jamais** d’algo maison |
| Transport MVP | `LanTransport` (mock / Wi‑Fi local) puis Nearby/BLE |

## Démarrage rapide

```bash
# Prérequis : Flutter SDK installé (flutter doctor)
cd apps/iai_chat
flutter pub get
flutter run
```

Packages purs Dart :

```bash
cd packages/core_protocol && dart pub get && dart test
```

## Équipes

Voir [CONTRIBUTING.md](CONTRIBUTING.md).

## Licence

MIT — voir [LICENSE](LICENSE).
