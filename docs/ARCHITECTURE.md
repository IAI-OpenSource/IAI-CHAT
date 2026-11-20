# Architecture IAI-CHAT

## Vue d’ensemble

```
┌─────────────────────────────────────────────┐
│              apps/iai_chat (UI)             │
└─────────────────────┬───────────────────────┘
                      │
        ┌─────────────┼─────────────┐
        ▼             ▼             ▼
 core_protocol   crypto_engine  mesh_transport
 (paquets)       (E2EE)         (LAN → BLE)
```

## Contrats (semaine 1)

### Packet (`core_protocol`)

Champs prévus :

| Champ | Rôle |
|-------|------|
| `version` | Version du protocole |
| `type` | hello / chat / ack / … |
| `senderId` | Identité courte de l’émetteur |
| `recipientId` | Destinataire ou broadcast |
| `seq` | Numéro de séquence |
| `ttl` | Durée de vie / hops restants |
| `payload` | Données (souvent déjà chiffrées) |
| `signature` | Signature Ed25519 (bytes) |

### CryptoEngine (`crypto_engine`)

- Génération de paire de clés
- Chiffrement / déchiffrement de payload
- Signature / vérification
- Empreinte courte pour vérif face-à-face

### MeshTransport (`mesh_transport`)

Interface unique :

1. `LanTransport` — développement & démo salle (priorité MVP)
2. `BleNearbyTransport` — branchement parallèle sans changer l’UI

## Principe MockTransport

L’UI et la crypto **ne doivent jamais** attendre le Bluetooth.
Dès le jour 1 : développer contre `LanTransport`, brancher le transport réel derrière la même API.
