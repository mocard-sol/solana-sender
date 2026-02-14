# Solana CLI Setup & Random Transfers Guide (WSL/Windows)

This guide provides a comprehensive walkthrough for setting up the Solana Command Line Interface (CLI) on Windows via WSL and automating randomized token transfers.

---

## 1. Install Ubuntu (WSL)
To run Linux tools on Windows, you first need to enable the Windows Subsystem for Linux.

1.  Press `Win + S`, search for **PowerShell**, right-click it, and select **Run as administrator**.
2.  Execute the following command:
    ```powershell
    wsl --install
    ```
3.  **Restart your computer** when prompted.
4.  After the reboot, the Ubuntu terminal will open automatically. Create a **username** and **password** (ensure you remember this password for `sudo` commands).

---

## 2. Accessing Ubuntu
You can launch your Linux environment at any time by:
* Searching for **Ubuntu** in the Start menu.
* Typing `wsl` in any PowerShell or CMD window.

You will see a prompt similar to: `yourname@DESKTOP-XXXX:~$`.

---

## 3. Install Solana CLI
Execute these commands sequentially within your Ubuntu terminal:

**Update system packages:**
```bash
sudo apt update && sudo apt upgrade -y
```
Install Solana binaries:
```bash
sh -c "$(curl -sSfL [https://release.anza.xyz/stable/install](https://release.anza.xyz/stable/install))"
```

Configure Environment Variables:
```bash

export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
echo 'export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Verify Installation:
```bash
solana --version
```
If you see solana-cli 2.x.x (or higher), the installation was successful.


4. Wallet Recovery
Generate wallet files from your existing seed phrases:

Wallet 1:
```bash
solana-keygen recover 'prompt:?key=0/0' --outfile ~/wallet1.json
```
```bash
solana-keygen recover 'prompt:?key=0/0' --outfile ~/wallet2.json
```
Action: Paste your 12/24-word seed phrase when prompted.

Security Note: Never share your seed phrase or .json files with anyone.

Confirm your public addresses:
```bash
solana address -k ~/wallet1.json
solana address -k ~/wallet2.json
```
5. Funding and Balance Check
Transfer a small amount of SOL (e.g., 0.05 SOL) to these addresses to cover transaction fees. To check your balance, run:

```bash
solana balance -k ~/wallet1.json
solana balance -k ~/wallet2.json
```
6. Script Configuration
Create the script file:

```bash
nano ~/send_random.sh
```
Paste your script code into the editor.

Update the variables: Locate SELF_ADDRESS and SECOND_ADDRESS and replace the placeholders with your actual public keys.

Save and Exit: Press Ctrl + O, then Enter, then Ctrl + X.

Grant Execution Permissions:

```bash
chmod +x ~/send_random.sh
```
7. Execution and Termination
To initiate the automated transfers, run:

```bash
~/send_random.sh
```
The script automates:

A randomized number of transactions.

Variable transfer amounts and delays.

Randomized distribution between your two wallets.

To Stop: Press Ctrl + C. The process will terminate after the current delay cycle completes.
