# Homebrew formula for Hybrid OS (daemon `hybridd`, CLI `hy`, TUI `hyt`).
#
# Usage:
#   brew install coodyapp/tap/hybrid-os
#
# Prebuilt binaries for macOS on Apple Silicon, attached to the GitHub release
# for `version` on coodyapp/hybrid-os. The sha256 must match that tarball;
# update both together.
class HybridOs < Formula
  desc "Local-first, federated Personal AI Control Plane"
  homepage "https://hyos.coody.app"
  url "https://github.com/coodyapp/hybrid-os/releases/download/v0.27.0/hybrid-os-0.27.0-aarch64-apple-darwin.tar.gz"
  sha256 "860e1aa67c567c4ebf4de09e6ed6bf67e2a007f36822d49d94ec7b2b971e9854"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

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
