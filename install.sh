#!/bin/bash

# ===========================================
# Downzone - Dual License
# Copyright (c) 2025 Mohammad Reza Pegah
# ===========================================

set -e

# ---------- Colors ----------
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
RESET="\033[0m"

info()    { echo -e "${BLUE}INFO: $1${RESET}"; }
success() { echo -e "${GREEN}SUCCESS: $1${RESET}"; }
warning() { echo -e "${YELLOW}WARNING: $1${RESET}"; }
error()   { echo -e "${RED}ERROR: $1${RESET}"; exit 1; }

# ---------- Banner ----------
print_banner() {
cat << "EOF"

██████╗  ██████╗ ██╗    ██╗███╗   ██╗    ███████╗ ██████╗ ███╗   ██╗███████╗
██╔══██╗██╔═══██╗██║    ██║████╗  ██║    ╚══███╔╝██╔═══██╗████╗  ██║██╔════╝
██║  ██║██║   ██║██║ █╗ ██║██╔██╗ ██║      ███╔╝ ██║   ██║██╔██╗ ██║█████╗  
██║  ██║██║   ██║██║███╗██║██║╚██╗██║     ███╔╝  ██║   ██║██║╚██╗██║██╔══╝  
██████╔╝╚██████╔╝╚███╔███╔╝██║ ╚████║    ███████╗╚██████╔╝██║ ╚████║███████╗
╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═══╝    ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝

Version 1.1.0
Downzone - Dual License
Copyright (c) 2025 Mohammad Reza Pegah

EOF
}

clear
print_banner

# ---------- Detect OS ----------
OS="$(uname -s)"
info "Detected OS: $OS"

# ---------- Dependencies ----------
REQUIRED_CMDS=(curl ping)

check_command() {
    command -v "$1" >/dev/null 2>&1
}

install_mac_dependency() {
    local pkg="$1"

    if ! command -v brew >/dev/null 2>&1; then
        error "Homebrew is not installed. Please install Homebrew first: https://brew.sh"
    fi

    info "Installing missing dependency via Homebrew: $pkg"
    brew install "$pkg" || error "Failed to install $pkg"
}

install_linux_dependency() {
    local pkg="$1"

    if command -v apt >/dev/null 2>&1; then
        sudo apt update
        sudo apt install -y "$pkg" || error "Failed to install $pkg"
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y "$pkg" || error "Failed to install $pkg"
    elif command -v yum >/dev/null 2>&1; then
        sudo yum install -y "$pkg" || error "Failed to install $pkg"
    else
        error "No supported package manager found (apt/dnf/yum)"
    fi
}

# ---------- Dependency check ----------
info "Checking dependencies..."

for cmd in "${REQUIRED_CMDS[@]}"; do
    if check_command "$cmd"; then
        success "$cmd is installed"
    else
        warning "$cmd not found"

        case "$OS" in
            Darwin)
                install_mac_dependency "$cmd"
                ;;
            Linux)
                install_linux_dependency "$cmd"
                ;;
            *)
                error "Unsupported OS: $OS"
                ;;
        esac

        check_command "$cmd" || error "$cmd installation failed"
        success "$cmd installed successfully"
    fi
done

# ---------- Install Downzone ----------
BIN_SOURCE="./bin/downzone"
BIN_DEST="/usr/local/bin/downzone"

[ -f "$BIN_SOURCE" ] || error "Binary not found: $BIN_SOURCE"

info "Installing Downzone binary..."

sudo cp "$BIN_SOURCE" "$BIN_DEST"
sudo chmod +x "$BIN_DEST"

# ---------- Done ----------
echo
echo "=============================================="
success "Downzone installed successfully!"
echo "You can now run: downzone"
echo "To uninstall: sudo rm $BIN_DEST"
echo "=============================================="
