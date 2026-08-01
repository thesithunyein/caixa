# Judge map — Caixa vs bounty rubric

Submission link: https://github.com/thesithunyein/caixa  
Format: Discord `#solana-bounty` showcase + Earn edit (not a registry PR).

| Criterion (weight) | Where it lives |
|--------------------|----------------|
| **Use case 30%** — daily shop job, Brazil BRL→USDC | [SHOWCASE.md](SHOWCASE.md), [operator/DAY.md](operator/DAY.md), running Telegram agent |
| **Safety 25%** — T1/T0, fail closed, injection | [operator/INJECTION.md](operator/INJECTION.md), charge/watch WASM scanners, no keys |
| **Craft 20%** — pure core, tests, layering | `crates/caixa-core`, plugin tests, [operator/LAYERING.md](operator/LAYERING.md), durable nonce on transfer-build |
| **Reproducibility 15%** — evening setup | [operator/README.md](operator/README.md), [operator/config.example.toml](operator/config.example.toml) |
| **Showcase 10%** — ≤3 min video | [operator/RECORDING.md](operator/RECORDING.md) |

## We will not accept — checklist

| Disqualifier | Caixa |
|--------------|-------|
| Concept / slides only | Running Telegram agent + code |
| Plugin with no use case | Shop terminal is the product |
| Thin RPC wrapper as WASM | Caps + allowlist + injection + Pay UX + nonce |
| Raw key, no caps | No signing path; caps in config/code |
| Trading / sniper bot | Merchant charge terminal only |

## Ideal listing clip ↔ our beats

| Listing “winning showcase” | Caixa |
|----------------------------|-------|
| Charge in chat | `Cobra mesa 9: R$ …` |
| QR | HTTPS Pay QR |
| Customer wallet pays | Phantom / Solflare |
| Paid alert | `PAGO` via watch (+ optional cron SOP) |
| Injection caught | [INJECTION.md](operator/INJECTION.md) |
| T1 no keys | Declared + enforced |
