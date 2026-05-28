class MzDeploy < Formula
  desc "Deployment tool for Materialize"
  homepage "https://github.com/sjwiesman/mz-deploy"
  version "0.11.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.11.0/mz-deploy-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "c79d75665072476e860b5f5b16d764ea7caaf82ee532a28b398f7a2ffe48f9fc"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.11.0/mz-deploy-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "faa2a0e4e50e8cd5115d8a94263a4f43af170681403bcef20944a3dea8413a16"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.11.0/mz-deploy-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "96a1a05894275b65b2ce628f37f42709cf9382b5f3820edd63e29821c9fe0b5a"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.11.0/mz-deploy-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b05d5edded261c303235e03af07bcf979deaddad728924d823698d01293fbc9a"
    end
  end

  def install
    bin.install "mz-deploy"
    bash_completion.install "completions/mz-deploy.bash" => "mz-deploy"
    zsh_completion.install "completions/_mz-deploy"
    fish_completion.install "completions/mz-deploy.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mz-deploy --version")
  end
end
