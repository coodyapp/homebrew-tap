# homebrew-tap

Homebrew tap for coodyapp apps.

## Install

```bash
brew tap coodyapp/tap
brew install coodyapp/tap/hybrid-os      # formula: hy, hyt, hybridd
brew install --cask token-my-bar         # cask: TokenMyBar.app
```

Casks remove the macOS quarantine flag after install (`postflight_steps`), so
ad-hoc-signed apps open without Gatekeeper blocking them — no
`--no-quarantine` or manual `xattr` needed.

## Update

```bash
brew update
brew upgrade hybrid-os
brew upgrade --cask token-my-bar
```

## Formulae

| Formula | Platforms | Source |
| --- | --- | --- |
| `hybrid-os` | macOS, Apple Silicon | [coodyapp/hybrid-os](https://github.com/coodyapp/hybrid-os) (prebuilt release binaries) |

## Casks

| Cask | Source |
| --- | --- |
| `token-my-bar` | [coodyapp/token-my-bar](https://github.com/coodyapp/token-my-bar) |
