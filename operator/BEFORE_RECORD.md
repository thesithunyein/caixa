# Before record — beat ~300 submissions

## 0) Your merchant pubkey (do this first)

Demo recipient must be **your** Phantom address before you pay on video.

WSL:
```bash
nano ~/.zeroclaw/config.toml
# under caixa-charge and caixa-watch:
# recipient = "<YOUR_PUBKEY>"
pkill -f 'zeroclaw daemon'
# restart daemon (see operator/README.md)
```

Or send the pubkey in chat and we’ll wire it.

## 1) Warm-up (no camera) — must feel like the shop, not ChatGPT

```
Cobra mesa 9: R$ 25
```

Must see:
- `api.qrserver.com` QR + `solana:`
- short shop reply (mesa / R$ / “mostre o QR”) — **not** a long AI essay
- Tap QR → image, not blank Phantom

Also try once: `A mesa 9 já pagou?` → waiting/paid line in Portuguese style.

## 2) Record ([RECORDING.md](RECORDING.md))

Charge → QR open → Phantom pay → “já pagou?” → injection refuse.

## 3) Ship same hour ([EARN_DISCORD.md](EARN_DISCORD.md))

Earn submission link = `https://github.com/thesithunyein/caixa`  
Discord `#solana-bounty` showcase post  
Optional X reply with new video
