#!/bin/bash
set -euo pipefail

# Mac Setup Bootstrap Script
# Usage: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jmaorr/mac-setup/main/install.sh)"

REPO="https://github.com/jmaorr/mac-setup.git"
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

# 2. Install Homebrew
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 3. Clone the repo
if [[ -d "$INSTALL_DIR" ]]; then
  echo "Repo already cloned at $INSTALL_DIR, pulling latest..."
  cd "$INSTALL_DIR" && git pull
else
  echo "Cloning mac-setup repo..."
  git clone "$REPO" "$INSTALL_DIR"
fi

# 4. Run setup
cd "$INSTALL_DIR"
bash setup.sh
