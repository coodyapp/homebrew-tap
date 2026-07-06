# homebrew-tap

Homebrew tap for coodyapp apps.

## Install

```bash
brew tap coodyapp/tap
brew install --cask token-my-bar
```

Casks remove the macOS quarantine flag after install (postflight), so
ad-hoc-signed apps open without Gatekeeper blocking them — no
`--no-quarantine` or manual `xattr` needed.

## Update

```bash
brew update
brew upgrade --cask token-my-bar
```

## Casks

| Cask | Source |
| --- | --- |
| `token-my-bar` | [coodyapp/token-my-bar](https://github.com/coodyapp/token-my-bar) |
