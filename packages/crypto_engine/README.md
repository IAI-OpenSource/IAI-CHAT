# crypto_engine

Contrats E2EE pour IAI-CHAT (clés, chiffrement, signatures, empreinte).

**Équipe :** noyau crypto (1–2 personnes) — **review à deux obligatoire**.

## Règles

- Libs auditées uniquement (`cryptography`, libsodium, …)
- Pas d’algorithme maison
- Garder l’interface `CryptoEngine` stable pour l’UI

## État

`UnimplementedCryptoEngine` est un placeholder compilable.
Remplacer par une vraie implémentation dès la semaine 2.
