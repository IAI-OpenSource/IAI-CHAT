# mesh_transport

Transport abstrait + mock LAN pour développer sans Bluetooth.

**Équipe :** noyau réseau (1–2 personnes).

## Contenu

- `MeshTransport` — interface unique
- `LanTransport` + `LanHub` — mock in-process pour UI / crypto / tests

## Suite

Brancher `BleNearbyTransport` (Nearby Connections / BLE) derrière la même interface.
