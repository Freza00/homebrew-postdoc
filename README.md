# Postdoc Homebrew Tap

Install [Postdoc](https://lasca.ai) on macOS via Homebrew.

## Install

```sh
brew install --cask Freza00/postdoc/postdoc
```

The Preview build is not yet signed with a Developer ID certificate. The
cask's `postflight` block strips the macOS quarantine attribute so the app
launches cleanly on first open without right-click → Open. A signed build
will land in a later release.

## Update

```sh
brew upgrade --cask postdoc
```

## Uninstall

```sh
brew uninstall --cask postdoc
brew untap Freza00/postdoc        # optional
```

`brew uninstall --cask postdoc` removes the app **and** runs the `zap` block,
which cleans up Postdoc's local databases, caches, and saved state.

Your **vault contents** (the actual notes, on disk wherever you chose to keep
them) are never touched.

---

This tap exists only to distribute the Postdoc macOS binary.
Postdoc itself is closed source.
