# Rokha CLI Homebrew formula.
#
# This file is the source of truth. To publish, mirror it to
# https://github.com/aetherBytes/homebrew-tap/Formula/rokha.rb on each release.
#
# On release, replace the version + sha256 placeholders with values
# from the corresponding GH release `.sha256` sidecar files. The
# release workflow can do this via a follow-up tap-bump job (see
# `svc/rokha-cli/HomebrewFormula/README.md`).
#
# After mirroring:
#   brew tap aetherBytes/tap
#   brew install rokha
# or one-shot:
#   brew install aetherBytes/tap/rokha

class Rokha < Formula
  desc "Rokha CLI — picks and shovels for the agentic economy"
  homepage "https://rokha.ai"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aetherBytes/rokha-sdk/releases/download/cli-v#{version}/ro-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b809efe5188e0024aade3e1effdce4fe9b68d31a21d99aa5fe3b0b5fb46b520d"
    end
    on_intel do
      url "https://github.com/aetherBytes/rokha-sdk/releases/download/cli-v#{version}/ro-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "1d8452abe4189fa83a62747bb736de5cf82fe7c3286f6cfe9d30878c933d9b13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aetherBytes/rokha-sdk/releases/download/cli-v#{version}/ro-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a9955c90b5b5c86403551f04d9f1c3b1473f369e1ff4f15298b223974948273"
    end
    on_intel do
      url "https://github.com/aetherBytes/rokha-sdk/releases/download/cli-v#{version}/ro-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "00bb8d5480828f9b28c0ee94dcb7866c99e211a1a04efbb1b964d41553e464a3"
    end
  end

  def install
    bin.install "ro"
  end

  test do
    assert_match(/ro #{version}/, shell_output("#{bin}/ro version"))
  end
end
