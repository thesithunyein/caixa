# Caixa

**Terminal de cobrança da loja no Telegram — reais no chat, USDC no Solana.**

Problema real: a loja já opera no Telegram. Cobrar crypto sem Caixa = colar endereço, errar valor, ou entregar hot wallet a um bot.

Caixa resolve isso no fluxo do dia:

```
Dono:   "Cobra mesa 9: R$ 25"
        → QR + solana: (USDC, memo da mesa)
Cliente: abre o QR no Phantom e assina
Dono:   "A mesa 9 já pagou?"
        → PAGO / ainda não
```

O agente **nunca segura chave**. Cliente assina na carteira dele.

| Doc | Para quem |
|-----|-----------|
| [operator/DAY.md](operator/DAY.md) | Dono da loja — o que digitar todo dia |
| [operator/README.md](operator/README.md) | Subir o terminal em uma noite |
| [SHOWCASE.md](SHOWCASE.md) | Loop + reproduce (juízes / Discord) |
| [operator/RECORDING.md](operator/RECORDING.md) | Script do demo |

## Peças

```
crates/caixa-core/              substrate (Pay, RPC, SPL, quote)
plugins/caixa-charge/           cobrança Solana Pay
plugins/caixa-watch/            confirma pagamento on-chain
plugins/caixa-transfer-build/   estorno/saque unsigned + durable nonce
operator/                       SOUL, config, dia a dia
```

## Testes (host)

```bash
(cd crates/caixa-core && cargo test)
(cd plugins/caixa-charge && cargo test)
(cd plugins/caixa-watch && cargo test)
(cd plugins/caixa-transfer-build && cargo test)
```

MIT OR Apache-2.0
