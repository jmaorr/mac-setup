#!/bin/bash
set -euo pipefail

# Mac Setup Bootstrap Script
# Usage: curl -fsSL <raw-url>/install.sh | bash

REPO="jmaorr/mac-setup"
INSTALL_DIR="$HOME/mac-setup"

echo "=============================="
echo "  Mac Setup Bootstrap"
echo "=============================="
echo ""

# 1. Xcode Command Line Tools
if ! xcode-select -p &>/dev/null; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install
  echo "Waiting for Xcode CLT installation to complete..."
  echo "Press any key once the installation finishes."
  read -n 1 -s
fi

# 2. Install Homebrew (needed for gh)
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 3. Install gh CLI for private repo access
if ! command -v gh &>/dev/null; then
  echo "Installing GitHub CLI..."
  brew install gh
fi

# 4. Authenticate with GitHub if needed
if ! gh auth status &>/dev/null 2>&1; then
  echo "Please authenticate with GitHub to access the private repo..."
  gh auth login
fi

# 5. Clone the repo
if [[ -d "$INSTALL_DIR" ]]; then
  echo "Repo already cloned at $INSTALL_DIR, pulling latest..."
  cd "$INSTALL_DIR" && git pull
else
  echo "Cloning mac-setup repo..."
  gh repo clone "$REPO" "$INSTALL_DIR"
fi

# 6. Run setup
cd "$INSTALL_DIR"
bash setup.sh
