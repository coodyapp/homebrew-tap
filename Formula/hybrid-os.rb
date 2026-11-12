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
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.41.0/hybrid-os-0.41.0-aarch64-apple-darwin.tar.gz"
      sha256 "0b2a3a76195319ce65206ed9676d091348f37c5b30cb9b1d7f3443f883850fa3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.41.0/hybrid-os-0.41.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f7011d94db8f84aa13db85f65816ed340b8d4013091372df339b19ee4dc7a2b"
    end

    on_arm do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.41.0/hybrid-os-0.41.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ab7fc9099027ba41329348efe0cbd9afbfcbaa0ea5fc32c903b44badc67bcc9"
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
