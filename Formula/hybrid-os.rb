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
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.34.0/hybrid-os-0.34.0-aarch64-apple-darwin.tar.gz"
      sha256 "238c50b146377dea360230087ba0ed1006d5ef7c473ad86ed9259f0a4e750f18"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.34.0/hybrid-os-0.34.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7d281c5f6b52bc1076039981b2a7c2a5f7cab4aac8e581e7be1661bbaf894be9"
    end

    on_arm do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.34.0/hybrid-os-0.34.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b9e24cdce2c2b3a6f0266ac3976b231d43f0e22c5d27d52c5c8c882ff27d8b81"
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
