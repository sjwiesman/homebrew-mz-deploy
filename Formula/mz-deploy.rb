class MzDeploy < Formula
  desc "Deployment tool for Materialize"
  homepage "https://github.com/sjwiesman/mz-deploy"
  version "0.5.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.5.0/mz-deploy-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "29d6b82f0c494fe817292d6f1716c905ea60c14914fd5eb1489fb8a225485533"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.5.0/mz-deploy-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "4aa8d6c99fec6875f478451efde4376b8a0a619c280d5865caa35c415bceafce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.5.0/mz-deploy-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "412d56eeb538e1b984fdff35becd7665a8fb004bb80de24a6123794156c27775"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.5.0/mz-deploy-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9cede6f9dcbf0c8ed8ca12fcebdaf9e97ad001c79afe765a03972b490a51fbd"
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
