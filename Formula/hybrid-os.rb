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
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.35.0/hybrid-os-0.35.0-aarch64-apple-darwin.tar.gz"
      sha256 "5e1370e8d1c1b01c5bbaad7a3de2f59339892d3ceba91040bc44af1f29e32745"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.35.0/hybrid-os-0.35.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "222423b47a4b05a86982434fbd95855e0c78a13dbc0f48fce4f09806b376c711"
    end

    on_arm do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.35.0/hybrid-os-0.35.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b30e32f578a386ad0ccbaa9f9023697a5700e5bcb9231d9393c30f833ea6a376"
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
