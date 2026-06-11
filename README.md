# homebrew-jdf

Homebrew tap for [JDF Viewer](https://github.com/uurtech/jdf).

## Install

```bash
brew install uurtech/jdf/jdf-viewer
```

That's it. Homebrew clones this tap, downloads the latest `.dmg` from the JDF release page, and installs `JDF Viewer.app` into `/Applications`.

To upgrade later:

```bash
brew upgrade --cask jdf-viewer
```

## Notes

- Apple Silicon (`arm64`) build only for now. Intel and Linux/Windows artifacts ship from the GitHub Actions release workflow once tags land.
- The app isn't notarized; the cask runs `xattr -cr` on install to clear the macOS quarantine attribute, which usually clears the Gatekeeper warning. If macOS still blocks the launch: System Settings → Privacy & Security → "Open Anyway".

## Uninstall

```bash
brew uninstall --cask jdf-viewer
```

`zap` removes its caches/preferences too:

```bash
brew uninstall --cask --zap jdf-viewer
```
