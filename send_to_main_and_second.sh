#!/bin/bash

# ────────────────────────────────────────────────────────────────
# Settings (change here)
# ────────────────────────────────────────────────────────────────

KEYPAIR=~/main-wallet.json

SELF_ADDRESS="INSERT_YOUR_MAIN_ADDRESS"
SECOND_ADDRESS="INSERT_SECOND_ADDRESS_HERE"          # ← must change!

MIN_AMOUNT=0.000001
MAX_AMOUNT=0.00005

# Range of transaction count per run
MIN_TX=150
MAX_TX=300

# Delay range between transactions (seconds)
MIN_DELAY=12
MAX_DELAY=55

# ────────────────────────────────────────────────────────────────
# Code
# ────────────────────────────────────────────────────────────────

echo "Random self/alternate transfer script"
echo "Sender:             $(solana address -k "$KEYPAIR")"
echo "Recipients:         $SELF_ADDRESS (self) and $SECOND_ADDRESS (second wallet)"
echo "Amounts:            $MIN_AMOUNT – $MAX_AMOUNT SOL"
echo "Transaction count:  random from $MIN_TX to $MAX_TX"
echo "Delays:             $MIN_DELAY – $MAX_DELAY seconds"
echo "----------------------------------------"

if [ ! -f "$KEYPAIR" ]; then
  echo "Error: keypair file $KEYPAIR not found!"
  exit 1
fi

echo "Current sender balance:"
solana balance -k "$KEYPAIR"

# Random number of transactions for this run
TX_COUNT=$((MIN_TX + RANDOM % (MAX_TX - MIN_TX + 1)))

echo "This run will perform: $TX_COUNT transactions"

for ((i=1; i<=TX_COUNT; i++)); do
  # Random amount
  AMOUNT=$(awk -v min=$MIN_AMOUNT -v max=$MAX_AMOUNT 'BEGIN{srand(); printf "%.9f", min + rand()*(max-min)}')

  # Random delay
  DELAY=$((MIN_DELAY + RANDOM % (MAX_DELAY - MIN_DELAY + 1)))

  # Random recipient choice (50/50)
  if (( RANDOM % 2 == 0 )); then
    RECIPIENT="$SELF_ADDRESS"
    RECIPIENT_NAME="self"
  else
    RECIPIENT="$SECOND_ADDRESS"
    RECIPIENT_NAME="second wallet"
  fi

  echo ""
  echo "[$i / $TX_COUNT]   $AMOUNT SOL   →   $RECIPIENT_NAME ($RECIPIENT)"
  echo "Delay before next: $DELAY sec"

  solana transfer "$RECIPIENT" "$AMOUNT" \
    --keypair "$KEYPAIR" \
    --with-compute-unit-price 0 \
    --url https://api.mainnet-beta.solana.com

  sleep $DELAY
done

echo ""
echo "Session completed ($TX_COUNT transactions)"
echo "Check activity:"
echo "• https://solscan.io/account/$SELF_ADDRESS"
echo "• https://solscan.io/account/$SECOND_ADDRESS"
