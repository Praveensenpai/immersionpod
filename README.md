# 🎧 immersionpod

Automated MPD and ImmersionPod setup utility for audio language immersion.

---

## ✨ Features

- 📦 **Automated Dependencies**: Installs `mpd`, `mpc`, and `ffmpeg` via `pacman`.
- 🎧 **`impd` Downloader**: Installs the official `impd` tool to `/usr/local/bin/impd`.
- ⚙️ **Automatic Config**: Generates PipeWire-compatible `~/.config/mpd/mpd.conf` and sets `video_dir=~/Videos/Anime`.

---

## 📦 Installation

> ℹ️ **Note**: AUR submission (`yay -S immersionpod-git`) is currently pending due to temporary AUR maintenance. Please use the one-liner installer below in the meantime.

### Manual / One-Liner

```bash
curl -sSL https://raw.githubusercontent.com/Praveensenpai/immersionpod/main/install.sh | bash
```

---

## ⚡ Usage

```bash
impd-setup
```

---

## 📜 License

MIT
