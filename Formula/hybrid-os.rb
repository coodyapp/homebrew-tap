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
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.32.0/hybrid-os-0.32.0-aarch64-apple-darwin.tar.gz"
      sha256 "e866048b85c0e6701beb9f892156e5b8b79639d8c8847768eb428ad14dc91ffb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.32.0/hybrid-os-0.32.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db73ce95d6410c76e51310f7fa9889841ef7e6d84013561b47e2235df1b92686"
    end

    on_arm do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.32.0/hybrid-os-0.32.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aadc0b5ab7d6d4c5170e26e3045f5b5621c70b0cbf1f0fde31b6106d4ee03c9d"
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
