#!/bin/bash

#!/bin/bash

# ===========================================
# Downzone - Dual License
# Copyright (c) 2025 Mohammad Reza Pegah
# ===========================================

# =========================================
# Downzone Installer
# =========================================

if [[ $EUID -ne 0 ]]; then
   echo "This installer must be run as root. Use sudo ./install.sh"
   exit 1
fi

DEST="/usr/local/bin/downzone"

cp ./bin/downzone "$DEST"
chmod +x "$DEST"

echo "=============================================="
echo "Installation completed!"
echo "You can now run the command 'downzone' from anywhere."
echo "To uninstall, run: sudo rm $DEST"
echo "=============================================="
