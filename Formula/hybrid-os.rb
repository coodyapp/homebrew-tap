# Homebrew formula for Hybrid OS (daemon `hybridd`, CLI `hy`, TUI `hyt`).
#
# Usage:
#   brew install coodyapp/tap/hybrid-os
#
# Prebuilt binaries attached to the GitHub release for the version on
# coodyapp/hybrid-os: macOS on Apple Silicon, and Linux (glibc 2.28 or newer)
# on x86_64 and arm64. Each sha256 must match its tarball; update them together.
class HybridOs < Formula
  desc "Local-first, federated Personal AI Control Plane"
  homepage "https://hyos.coody.app"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.28.0/hybrid-os-0.28.0-aarch64-apple-darwin.tar.gz"
      sha256 "63ecd078e7774c409f85143c8ec9715c30104d2b3266bd2f5a5599aea6e38442"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.28.0/hybrid-os-0.28.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76704de4617851181e019c06885485ca7177bfa1648d907c1b29fa193b7e145b"
    end

    on_arm do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.28.0/hybrid-os-0.28.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0862e9fc305286e171e4a8af4ca789b06d0a6409f59cdc13e2286ca90038e4ed"
    end
  end

  def install
    bin.install "hy", "hyt", "hybridd"
  end

  def caveats
    <<~EOS
      Hybrid OS is experimental software in a very early stage of development.
      Features may be incomplete, unstable, or subject to breaking changes.

      Get started:
        hy doctor
        hy daemon start
        hyt
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hy --version")
    assert_match version.to_s, shell_output("#{bin}/hybridd --version")
  end
end
