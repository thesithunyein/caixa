# Dia a dia na loja

Caixa não é um chat de IA. É o terminal de cobrança no Telegram.

**Bot:** [@caixa_zeroclaw_bot](https://t.me/caixa_zeroclaw_bot)

## Fluxo real

| Momento | Dono digita | Cliente | Caixa |
|---------|-------------|---------|--------|
| Fechar conta | `Cobra mesa 9: R$ 25` | — | QR + `solana:` |
| Cliente paga | — | Abre QR → carteira → assina USDC | — |
| Confirmar | `A mesa 9 já pagou?` | — | `PAGO` / `Ainda não pago` |

## Regras da loja

- Destinatário = carteira da loja (config). Caixa não muda isso.
- Só USDC allowlisted. Tentativa de outra mint / “ignore rules” → recusa.
- Estorno/saque: `caixa_transfer_build` devolve tx **sem assinar** — humano assina.

## Por que isso existe

Loja brasileira já vive no Telegram. Cobrar USDC sem Caixa = colar endereço, errar valor, ou dar hot wallet a um bot. Caixa resolve a cobrança no chat da operação, com o cliente assinando na carteira dele.
