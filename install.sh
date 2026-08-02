#!/bin/bash

CYAN='\033[0;36m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${PURPLE}🚀 Installing immersionpod setup script...${NC}\n"

BIN_DIR="$HOME/.local/bin"
mkdir -p "$BIN_DIR"

RAW_URL="https://raw.githubusercontent.com/Praveensenpai/immersionpod/main/bin/impd-setup"

LOCAL_DIR=""
if [ -n "${BASH_SOURCE[0]}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
    LOCAL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd)"
fi

if [ -n "$LOCAL_DIR" ] && [ -f "$LOCAL_DIR/PKGBUILD" ] && [ -f "$LOCAL_DIR/bin/impd-setup" ]; then
    cp "$LOCAL_DIR/bin/impd-setup" "$BIN_DIR/impd-setup"
else
    echo -e "${BLUE}📦 Downloading impd-setup binary from GitHub...${NC}"
    curl -sSL -H 'Cache-Control: no-cache' "$RAW_URL" -o "$BIN_DIR/impd-setup"
fi

if [ ! -f "$BIN_DIR/impd-setup" ] || [ ! -s "$BIN_DIR/impd-setup" ]; then
    echo -e "${RED}❌ Error: Failed to download impd-setup binary!${NC}"
    exit 1
fi

chmod +x "$BIN_DIR/impd-setup"
echo -e "${GREEN}✔ Installed impd-setup to ${BIN_DIR}/impd-setup${NC}"

SHELL_CONFIGS=("$HOME/.bashrc" "$HOME/.zshrc")
ALIAS_LINE="alias impd-setup='$HOME/.local/bin/impd-setup'"

for config in "${SHELL_CONFIGS[@]}"; do
    if [ -f "$config" ]; then
        if ! grep -q "alias impd-setup=" "$config" 2>/dev/null; then
            echo "" >> "$config"
            echo "$ALIAS_LINE" >> "$config"
            echo -e "${BLUE}📝 Added impd-setup alias to $config${NC}"
        fi
    fi
done

echo -e "\n${GREEN}${BOLD}▶ Running ImmersionPod setup...${NC}"
"$BIN_DIR/impd-setup"
