# Mac Setup

Automated setup for a fresh Mac.

## Quick Start

On a brand new Mac, open Terminal and run:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jmaorr/mac-setup/main/install.sh)"
```

This will:
1. Install Xcode Command Line Tools
2. Install Homebrew
3. Authenticate with GitHub (for private repo access)
4. Clone this repo
5. Run all setup scripts

## What Gets Installed

### CLI Tools
- Node.js / npm
- GitHub CLI (`gh`)
- Claude CLI

### GUI Apps (via Homebrew Cask)
- 1Password
- Rectangle Pro
- Tailscale
- AdGuard
- Arc Browser
- Warp Terminal
- Hidden Bar (menu bar manager)
- Raycast
- Elgato Camera Hub
- Focusrite Control 2
- Meld Studio
- Paper

### Mac App Store
- Velja
- DaisyDisk
- Xcode
- Tracka

### npm Global Packages
- Wrangler (Cloudflare)
- uipro-cli

### macOS Preferences
- Finder: show extensions, path bar, hidden files, list view
- Keyboard: fast key repeat, no press-and-hold
- Dock: auto-hide, no recents

## Run Individual Scripts

```bash
bash scripts/01-homebrew.sh      # Just Homebrew
bash scripts/02-brew-bundle.sh   # Just brew packages
bash scripts/03-node-packages.sh # Just npm globals
# etc.
```

## Manual Steps After Setup

1. Sign into apps (1Password first, then use it for other logins)
2. `wrangler login` for Cloudflare
3. Install Raycast extensions (Display Placer)
4. Import Meld Studio config from `configs/meld-session.json`
5. Install Claude plugins (commands printed during setup)

## Adding New Apps

Edit `Brewfile` and add:
- `brew "package-name"` for CLI tools
- `cask "app-name"` for GUI apps
- `mas "App Name", id: 123456` for App Store apps

Then run `bash scripts/02-brew-bundle.sh`.
