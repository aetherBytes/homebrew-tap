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
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aetherBytes/rokha-sdk/releases/download/cli-v#{version}/ro-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "802c5469f196f5b37b13786a26ea3acf06590f74e7ae8f36d4c27a63eee042a0"
    end
    on_intel do
      url "https://github.com/aetherBytes/rokha-sdk/releases/download/cli-v#{version}/ro-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "1e0adc1e7a885bd352c5a9a838b5905fe919453048b010e218ace04f465abae0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aetherBytes/rokha-sdk/releases/download/cli-v#{version}/ro-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4db79dc5799e249d74af414b70d3d4a3f58722b7015a569ab963cece7923d8aa"
    end
    on_intel do
      url "https://github.com/aetherBytes/rokha-sdk/releases/download/cli-v#{version}/ro-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e104916b7f62b65750cdbb04e891be5fe2e2eee719f7ad29536d5a0127a3f80c"
    end
  end

  def install
    bin.install "ro"
  end

  test do
    assert_match(/ro #{version}/, shell_output("#{bin}/ro version"))
  end
end
