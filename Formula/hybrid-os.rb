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
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.30.0/hybrid-os-0.30.0-aarch64-apple-darwin.tar.gz"
      sha256 "93af639c470defda2ccdb19cc4647abf83ccae257af91589f4237170b7eaac43"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.30.0/hybrid-os-0.30.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8106ba93cf61a6b663dc3e4c0e36ec893f3d5d138959bc84dedc89448a5a4446"
    end

    on_arm do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.30.0/hybrid-os-0.30.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f2cb04ac4b5fc0571f16c5e2e0069f24970b2d4fa3a2cf23b2046492cb9785e"
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
