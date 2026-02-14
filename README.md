Simple Step-by-Step Guide: Install Ubuntu on Windows → Create Solana Wallets → Run Transaction Script

1. Install Ubuntu (WSL) on Windows 10
   - Press Win + S → type "PowerShell" → right-click → Run as administrator
   - Paste and run:
     wsl --install
   - Restart your computer when asked
   - After restart, Ubuntu terminal opens → create username and password (remember password)

2. Open Ubuntu anytime
   - Win + S → type "Ubuntu" → Enter
   - Or in PowerShell/cmd just type: wsl

   You will see: yourname@DESKTOP-XXXX:~$

3. Install Solana CLI in Ubuntu
   Run these commands one by one:

   sudo apt update && sudo apt upgrade -y

   sh -c "$(curl -sSfL https://release.anza.xyz/stable/install)"

   export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
   echo 'export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"' >> ~/.bashrc
   source ~/.bashrc

   solana --version   # should show solana-cli 2.x.x or 3.x.x

4. Create wallet files from your seed phrases

   # Wallet 1
   solana-keygen recover 'prompt:?key=0/0' --outfile ~/wallet1.json

   # Wallet 2
   solana-keygen recover 'prompt:?key=0/0' --outfile ~/wallet2.json

   After each command:
   - Paste your 12/24-word seed phrase (words separated by spaces)
   - If you have passphrase → enter it, otherwise press Enter

   Check addresses:
   solana address -k ~/wallet1.json
   solana address -k ~/wallet2.json

   Write down both addresses!

5. Fund wallets
   Send 0.01–0.1 SOL to each address from exchange / Phantom / other wallet

   Check balance:
   solana balance -k ~/wallet1.json
   solana balance -k ~/wallet2.json

6. Create the transaction script

   Run:
   nano ~/send_random.sh

   → Paste the script code from GitHub (copy all code from repository)
   → Replace these lines with your real addresses:
      SELF_ADDRESS="your_wallet1_address_here"
      SECOND_ADDRESS="your_wallet2_address_here"

   → Optionally change:
      MIN_AMOUNT, MAX_AMOUNT, MIN_TX, MAX_TX, MIN_DELAY, MAX_DELAY

   Save & exit:
   Ctrl + O → Enter → Ctrl + X

   Make executable:
   chmod +x ~/send_to_main_and_second.sh

7. Run the script

   ~/send_random.sh

   Every run:
   - Random number of transactions (MIN_TX to MAX_TX)
   - Random amounts
   - Random delays
   - Random recipient (≈50% self, 50% second wallet)

8. Stop script
   Press Ctrl + C (1–3 times) in terminal

Done!
If error → copy full error text and ask for help.
Good luck!
