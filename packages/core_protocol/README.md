# core_protocol

Format de paquets, identités courtes (`PeerId`) et types de messages pour IAI-CHAT.

**Équipe :** noyau protocole (1–2 personnes).

## Contenu

- `Packet` — unité échangée sur le mesh (JSON pour démarrer)
- `PeerId` — identité courte
- `MessageType` — hello / chat / ack / presence

## Tests

```bash
dart pub get
dart test
```
