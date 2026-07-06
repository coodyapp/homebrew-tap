# Homebrew cask for TokenMyBar.
#
# Usage:
#   brew tap coodyapp/tap
#   brew install --cask token-my-bar
#
# The sha256 below must match the DMG attached to the GitHub release for
# `version` (published by coodyapp/token-my-bar's .github/workflows/release.yml).
# Update both together.
cask "token-my-bar" do
  version "1.0.7"
  sha256 "832738c11c33af1021ed21c9114f6f53da03ae58349443ca1781a45a1423045e"

  url "https://github.com/coodyapp/token-my-bar/releases/download/v#{version}/TokenMyBar-#{version}.dmg"
  name "TokenMyBar"
  desc "Menu bar app showing live AI token usage for Claude Code, Codex, and OpenCode"
  homepage "https://github.com/coodyapp/token-my-bar"

  depends_on macos: :sonoma

  app "TokenMyBar.app"

  zap trash: "~/Library/Application Support/TokenMyBar"

  caveats <<~EOS
    Releases are not yet notarized (no Apple Developer ID), so Gatekeeper
    blocks the first launch. Either reinstall without the quarantine flag:

      brew reinstall --cask token-my-bar --no-quarantine

    or clear the flag on the installed app:

      xattr -rd com.apple.quarantine /Applications/TokenMyBar.app

    or launch once, then allow it under
    System Settings → Privacy & Security → Open Anyway.
  EOS
end
