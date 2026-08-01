# Evening setup (aim: same till tonight)

Bot reference: [@caixa_zeroclaw_bot](https://t.me/caixa_zeroclaw_bot) (your own bot token in config).

## A) Fast path — prebuilt WASM (~30–45 min after ZeroClaw host exists)

1. Build ZeroClaw once with `plugins-wasm,plugins-wasm-cranelift` (see [README.md](README.md) §1).
2. Download **caixa-plugins-wasm** from [Actions → plugins-wasm](https://github.com/thesithunyein/caixa/actions) (or a Release).
3. `bash scripts/install-from-artifact.sh ~/Downloads/caixa-plugins-wasm.zip`
4. Merge [config.example.toml](config.example.toml) — set **your** `recipient`.
5. `bash scripts/setup-agent.sh caixa`
6. `zeroclaw daemon -v` → Telegram: `Cobra mesa 9: R$ 25`

## B) From source (no download)

```bash
git clone https://github.com/thesithunyein/caixa.git && cd caixa
bash scripts/install-plugins.sh
bash scripts/setup-agent.sh caixa
# merge config.example.toml → ~/.zeroclaw/config.toml
zeroclaw daemon -v
```

## Prove it

| Step | Expect |
|------|--------|
| Charge | QR HTTPS + `solana:` |
| Pay | Wallet signs USDC to your pubkey |
| `A mesa 9 já pagou?` | `PAGO` |
| [INJECTION.md](INJECTION.md) | Refuse |

Full notes: [README.md](README.md)
