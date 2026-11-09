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
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.36.0/hybrid-os-0.36.0-aarch64-apple-darwin.tar.gz"
      sha256 "987b5470e4f768e84e339565c45b4c875f015f89d4fc7dde52d122e605fcfeb5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.36.0/hybrid-os-0.36.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ae4c64f2ad6c58a5616a89b62436e89badd97a534457b1db6b6d6e8dbf0c3c7f"
    end

    on_arm do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.36.0/hybrid-os-0.36.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7b4c3595e076c947a0b67026cda6b029fc70419b84899d0e0672a407ecd3c4e2"
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
