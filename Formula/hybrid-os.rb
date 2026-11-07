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
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.29.0/hybrid-os-0.29.0-aarch64-apple-darwin.tar.gz"
      sha256 "5357a724a6e1908f2259e86d924cb0561d16f146b4387183ab52718bb12d75e1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.29.0/hybrid-os-0.29.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "383cdd7a5c1de57d4f92c7d036981c0c428d374d79b8064eb6c534499df443e5"
    end

    on_arm do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.29.0/hybrid-os-0.29.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49c50b80b17eb0f0b728c606b9bc0b87cd1ed648e502e1b4504ba81b4e9dc9e3"
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
