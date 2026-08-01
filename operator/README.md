# Operator kit — stand up the shop till tonight

Goal: another person runs the same Telegram terminal in an **evening**, then uses [DAY.md](DAY.md) every day.

**Start here:** [EVENING.md](EVENING.md) (fast path + scripts).

## 0) Need

- ZeroClaw built with WASM plugins (stock lean builds often omit this)
- Telegram bot token + model key
- Your Solana merchant pubkey (USDC)
- Optional: durable nonce for refunds

## 1) ZeroClaw host (`plugins-wasm`)

```bash
git clone https://github.com/zeroclaw-labs/zeroclaw.git
cd zeroclaw && git checkout v0.8.3   # or a tag you trust
cargo build --release --features plugins-wasm,plugins-wasm-cranelift,channel-telegram,agent-runtime,gateway
./target/release/zeroclaw plugin list   # must work
```

## 2) Caixa plugins (pick one)

**Prebuilt (preferred for strangers):**  
Actions artifact → [`scripts/install-from-artifact.sh`](../scripts/install-from-artifact.sh)

**From source:**

```bash
git clone https://github.com/thesithunyein/caixa.git
cd caixa
bash scripts/install-plugins.sh
```

## 3) Config

Merge [`config.example.toml`](config.example.toml) into `~/.zeroclaw/config.toml`:

- `recipient` = **your** merchant pubkey (charge + watch)
- `brl_per_usdc` if FX API is flaky
- Wire Telegram + model via normal ZeroClaw quickstart (never commit tokens)
- Prefer `excluded_tools` including `shell` / `http_request` so the model cannot bypass plugins

ZeroClaw 0.8+: `[[plugins.entries]]`, not `[plugins.caixa-charge]`.

## 4) Soul

```bash
bash scripts/setup-agent.sh caixa
```

## 4b) Optional cron SOP

[`../plugins/caixa-watch/sop-payment-watch.yaml`](../plugins/caixa-watch/sop-payment-watch.yaml) — polls `caixa_watch` every minute.  
Manual `A mesa 9 já pagou?` works without cron.

## 5) Run

```bash
zeroclaw plugin list    # caixa-charge, caixa-watch, caixa-transfer-build
zeroclaw daemon -v
```

Telegram:

```
Cobra mesa 9: R$ 25
```

Expect: HTTPS Pay QR + `solana:` → customer pays → `PAGO`.

## Safety

- No private keys in config  
- [INJECTION.md](INJECTION.md) once before trusting the till  
- [LAYERING.md](LAYERING.md) — why WASM, not only a skill  
