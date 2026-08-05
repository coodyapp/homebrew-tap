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
  version "1.6.0"
  sha256 "600484586d4861f2db17b4bd7fcae7544ebcfab940d78e642a67856b40b43451"

  url "https://github.com/coodyapp/token-my-bar/releases/download/v#{version}/TokenMyBar-#{version}.dmg"
  name "TokenMyBar"
  desc "Menu bar app showing live AI usage across Claude, Codex, OpenCode, Antigravity"
  homepage "https://github.com/coodyapp/token-my-bar"

  depends_on macos: :sonoma

  app "TokenMyBar.app"

  # Releases are ad-hoc signed (no Apple Developer ID yet), so Gatekeeper
  # would block the first launch of a quarantined install. Gatekeeper only
  # assesses quarantined apps; stripping the flag here lets the app open
  # normally without users needing --no-quarantine or a manual xattr.
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/TokenMyBar.app"],
                   sudo:         false,
                   must_succeed: false
  end

  # The app writes its snapshot cache to token-my-bar/, not TokenMyBar/ — the
  # old spelling matched nothing, so zap left the cache behind.
  zap trash: "~/Library/Application Support/token-my-bar"

  caveats <<~EOS
    Releases are ad-hoc signed (no Apple Developer ID yet). This install
    removed the quarantine flag automatically, so TokenMyBar opens normally.

    If macOS still blocks the first launch, run:

      xattr -rd com.apple.quarantine /Applications/TokenMyBar.app

    or allow it under System Settings → Privacy & Security → Open Anyway.
  EOS
end
