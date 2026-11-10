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
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.37.1/hybrid-os-0.37.1-aarch64-apple-darwin.tar.gz"
      sha256 "65f566edbc6a91132333a2920e2d04726a91eafbe90c197897f7e90405d612fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.37.1/hybrid-os-0.37.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bc54a946eca1542d507d652162b0cadb39fa74ce73f07a1b7a5f293c41f21f54"
    end

    on_arm do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.37.1/hybrid-os-0.37.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8beb597af05f3772cb2cd171a3e431eb03bd93cffead4dde1ba70aa04f41190a"
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
