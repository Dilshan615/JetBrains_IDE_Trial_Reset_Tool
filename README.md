# JetBrains IDE Trial Reset Tool (Windows)

A lightweight interactive Windows Batch script to reset evaluation cache and configuration files for individual or all JetBrains IDEs.

Developed by **manja**.

---

## 🚀 Supported IDEs

- WebStorm
- IntelliJ IDEA
- CLion
- Rider
- GoLand
- PhpStorm
- PyCharm
- ReSharper

---

## ⚙️ How It Works

1. **Target Selection:** Provides a simple numeric CLI menu to choose a specific IDE or clean all installed JetBrains products at once.
2. **Cache & Evaluation Removal:**
   - Cleans the local `eval` folder inside `%APPDATA%\JetBrains\<IDE>*`.
   - Strips evaluation keys (`evlsprt`) from `other.xml`.
3. **Registry Cleanup:** Flushes JavaSoft preferences keys (`HKEY_CURRENT_USER\Software\JavaSoft`) associated with local license tracking.

---

## 📋 Prerequisites

- **OS:** Windows 10 / Windows 11
- Make sure to **close all running JetBrains IDEs** before executing the script (otherwise files will be locked by the system).

---

## 🛠️ Usage

1. Clone or download the repository.
2. Right-click on `reset_jetbrains.bat` and select **Run as administrator** (recommended for proper registry cleaning).
3. Choose the option corresponding to your IDE:
   - Enter `1` - `8` to reset a single IDE.
   - Enter `9` to reset all detected IDEs.
   - Enter `0` to exit.
4. Press `Enter` to complete the process.

---

## ⚠️ Disclaimer

This tool is intended strictly for educational, testing, and troubleshooting purposes. If you use JetBrains products commercially or regularly, please consider purchasing a genuine license or applying for a free [JetBrains Student License](https://www.jetbrains.com/community/education/#students).