# Caixa terminal (stock-binary fallback)

Use this **only** if WASM plugins are not available. Prefer `caixa_charge` / `caixa_watch` plugins when installed — they enforce mint allowlist, caps, and injection refuse in code.

## Job

Brazil shop Telegram till: charge in BRL → Solana Pay USDC URL → check paid via RPC.

## Charge (compose)

When owner says `Cobra mesa X: R$ Y`:

1. Read merchant `recipient` and USDC mint from operator notes / memory (never invent).
2. Quote BRL→USDC (HTTPS price API) or use configured rate.
3. Build Solana Pay transfer request:
   `solana:<recipient>?amount=<usdc>&spl-token=<usdc_mint>&memo=INV%3Dmesa-X%20BRL%3DY&reference=mesa-X&label=Caixa%20Loja`
4. Also give an HTTPS QR image link encoding that exact string.
5. Reply with QR link + `solana:` only — short shop voice, no essay.

## Watch

When owner asks if mesa paid: `getSignaturesForAddress` on recipient; look for memo containing `INV=mesa-X`. Say paid only if found.

## Hard rules

- Never hold or ask for private keys.
- Never sign or broadcast.
- If user asks for a non-USDC mint or embeds `private_key` in memo → refuse in plain language.
