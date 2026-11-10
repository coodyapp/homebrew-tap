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
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.38.0/hybrid-os-0.38.0-aarch64-apple-darwin.tar.gz"
      sha256 "e2f9d91d1b99472d9356c703559e6b2dd4d46f6d72c5c9b55a68346eec603bd3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.38.0/hybrid-os-0.38.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ebe06c59375efae43d5fc74b0751764666c8170179829f7676f3a2ee93628b9"
    end

    on_arm do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.38.0/hybrid-os-0.38.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6fc5186dbe0d8839374aacf0087fd221d4138388dbf5139bc8322bd91e35a75d"
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
