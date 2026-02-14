🚀 Simple & Clear Guide: Install Ubuntu on Windows → Create Solana Wallets → Run Transaction Script

1. Install Ubuntu (WSL) on Windows 10
   • Press Win + S → type "PowerShell" → right-click → Run as administrator
   • Paste this command and press Enter:
     wsl --install
   • Restart your computer when prompted
   • After restart, Ubuntu terminal opens → create username and password (remember the password!)

   Done! Ubuntu is installed. 🎉

2. How to open Ubuntu anytime
   • Press Win + S → type "Ubuntu" → Enter
   • Or open PowerShell / cmd and type: wsl

   You will see a prompt like:
   yourname@DESKTOP-XXXX:~$

3. Install Solana CLI inside Ubuntu
   Run these commands one by one:

   sudo apt update && sudo apt upgrade -y

   sh -c "$(curl -sSfL https://release.anza.xyz/stable/install)"

   export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
   echo 'export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"' >> ~/.bashrc
   source ~/.bashrc

   solana --version
   → You should see something like solana-cli 2.x.x or 3.x.x

   | If the version appears — everything is good.

4. Create wallet files from your seed phrases
   Run these commands:

   solana-keygen recover 'prompt:?key=0/0' --outfile ~/wallet1.json

   solana-keygen recover 'prompt:?key=0/0' --outfile ~/wallet2.json

   After each command:
   • Paste your 12/24-word seed phrase (words separated by spaces)
   • If you have an extra passphrase → enter it, otherwise just press Enter

   Check your addresses:
   solana address -k ~/wallet1.json
   solana address -k ~/wallet2.json

   Write down both addresses in a safe place!

   • Small tip: never share your seed phrase with anyone.

5. Fund your wallets
   • Send 0.01–0.1 SOL to each address (from exchange, Phantom, etc.)
   • Check balances:

     solana balance -k ~/wallet1.json
     solana balance -k ~/wallet2.json

6. Create the transaction script
   1. Open the editor:
      nano ~/send_random.sh

   2. Paste the full script code from GitHub (copy everything from the repository)

   3. Important changes:
      • Replace these lines with your real addresses:
        SELF_ADDRESS="your_wallet1_address_here"
        SECOND_ADDRESS="your_wallet2_address_here"

      • (Optional) adjust these values:
        MIN_AMOUNT, MAX_AMOUNT, MIN_TX, MAX_TX, MIN_DELAY, MAX_DELAY

   4. Save & exit:
      Ctrl + O → Enter → Ctrl + X

   5. Make the script executable:
      chmod +x ~/send_random.sh

7. Run the script
   Simply type:
   ~/send_random.sh

   Every run does:
   • Random number of transactions (from MIN_TX to MAX_TX)
   • Random amounts within your range
   • Random delays between transactions
   • Random recipient (~50% to self, ~50% to second wallet)

8. How to stop the script
   Press Ctrl + C (1–3 times) in the terminal — it will stop after the current delay

✅ All set!

If you see any error → copy the full error message from the terminal and send it to me.  
You’ve got this! Good luck and enjoy your on-chain activity! 🚀
