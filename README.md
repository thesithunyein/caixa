# Caixa

**Brazil shop payment terminal on ZeroClaw + Solana.**

Charge in BRL over Telegram → USDC Solana Pay (Pay QR + `solana:` URL) → watch closes the invoice.  
The agent **never holds a key** (T1 / T0).

| | |
|--|--|
| Showcase | [SHOWCASE.md](SHOWCASE.md) |
| Evening setup | [operator/README.md](operator/README.md) |
| Record script | [operator/RECORDING.md](operator/RECORDING.md) |
| Before record | [operator/BEFORE_RECORD.md](operator/BEFORE_RECORD.md) |

```
Owner:  "Cobra mesa 9: R$ 25"
   → caixa-charge     → Pay QR + solana: USDC invoice
Customer pays in Phantom
   → caixa-watch      → Invoice paid alert
Refund / payout
   → caixa-transfer-build → unsigned tx + durable nonce
```

## Repo layout

```
crates/caixa-core/           shared substrate (no solana-sdk in component path)
plugins/caixa-charge/        T1 Solana Pay charge
plugins/caixa-watch/         T0 settlement watch + SOP
plugins/caixa-transfer-build/ T1 unsigned SPL + durable nonce
operator/                    config example, SOUL, reproduce steps
wit/v0/                      ZeroClaw tool-plugin WIT (vendored)
```

## Quick test (host, no wasm)

```bash
(cd crates/caixa-core && cargo test)
(cd plugins/caixa-charge && cargo test)
(cd plugins/caixa-watch && cargo test)
(cd plugins/caixa-transfer-build && cargo test)
```

## License

MIT OR Apache-2.0
