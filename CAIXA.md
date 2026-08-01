# Caixa

**Cobra em reais no Telegram. Recebe USDC no Solana. Sem chave no agente.**

Produto para loja que já fecha conta no chat: `Cobra mesa 9: R$ 25` → cliente paga no Phantom → dono confere no mesmo fio.

- Dia a dia: [`operator/DAY.md`](operator/DAY.md)
- Showcase: [`SHOWCASE.md`](SHOWCASE.md)
- Setup: [`operator/README.md`](operator/README.md)

```
Dono:    "Cobra mesa 9: R$ 25"
         → caixa-charge     → QR HTTPS + solana:
Cliente: paga USDC no Phantom
Dono:    "A mesa 9 já pagou?"
         → caixa-watch      → PAGO / ainda não
Estorno: caixa-transfer-build → tx unsigned + durable nonce → humano assina
```

| Peça | Path |
|------|------|
| [`caixa-charge`](plugins/caixa-charge) | Cobrança Solana Pay (BRL/USDC, allowlist + caps) |
| [`caixa-watch`](plugins/caixa-watch) | Conferência on-chain (`INV=`) |
| [`caixa-transfer-build`](plugins/caixa-transfer-build) | Saque/estorno unsigned |
| [`caixa-core`](crates/caixa-core) | Substrate compartilhado |

## Custódia

- Watch: só leitura RPC
- Charge / transfer-build: URL/QR ou bytes unsigned — nunca assinam, nunca submetem
- Injection não move fundos — não há path de signing

## Config

[`operator/config.example.toml`](operator/config.example.toml) — `[[plugins.entries]]` (ZeroClaw 0.8+)

## Design

- Telegram não linka `solana:`; Phantom `ul/browse` falha → QR HTTPS
- Host lean pode vir sem WASM → build com `plugins-wasm`
- Outputs curtos (recibo de loja, não essay de IA)

MIT OR Apache-2.0
