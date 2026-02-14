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
[!TIP]
If you see solana-cli 2.x.x (or higher), the installation was successful.
