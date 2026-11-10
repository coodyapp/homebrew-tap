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
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.37.0/hybrid-os-0.37.0-aarch64-apple-darwin.tar.gz"
      sha256 "0cc5357d577b97ebe117f3fd508f292546c0ad5478ddfd815c2733db1a4b38f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.37.0/hybrid-os-0.37.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "938f32c307b19666c64e6e5b2d0f15a65c499452545e65ff8213ec66aa9a99be"
    end

    on_arm do
      url "https://github.com/coodyapp/hybrid-os/releases/download/v0.37.0/hybrid-os-0.37.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "672151383d50c601b8fdf6877d082009bb8907cd9a0ec18d8c893efbb4d6f010"
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
