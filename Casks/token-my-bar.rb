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
  version "1.0.5"
  sha256 "a4152ddda6341c993378726054824d4ab0254793be876aa6e51fdfaa63250f32"

  url "https://github.com/coodyapp/token-my-bar/releases/download/v#{version}/TokenMyBar-#{version}.dmg"
  name "TokenMyBar"
  desc "Menu bar app showing live AI token usage for Claude Code, Codex, and OpenCode"
  homepage "https://github.com/coodyapp/token-my-bar"

  depends_on macos: :sonoma

  app "TokenMyBar.app"

  zap trash: "~/Library/Application Support/TokenMyBar"

  caveats <<~EOS
    Releases are currently unsigned. If Gatekeeper blocks the first launch,
    right-click TokenMyBar.app and choose Open, or allow it under
    System Settings → Privacy & Security.
  EOS
end
