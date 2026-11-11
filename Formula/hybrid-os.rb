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
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.39.0/hybrid-os-0.39.0-aarch64-apple-darwin.tar.gz"
      sha256 "6389e80e3e6f4b1bc725ff00b129c02127d58f3830180a96411477f4f77678a4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.39.0/hybrid-os-0.39.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c85a3c0b4e43dd80187b13ddfa81a1a61f44d3e2efd271f616de18663e73f8b"
    end

    on_arm do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.39.0/hybrid-os-0.39.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "00fa0ec27f56e30eccfcb76a62ade559856dd4ed8a6e5c9bc6295a651527a1e6"
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
