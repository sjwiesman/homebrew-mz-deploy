class MzDeploy < Formula
  desc "Deployment tool for Materialize"
  homepage "https://github.com/sjwiesman/mz-deploy"
  version "0.2.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.2.0/mz-deploy-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "a1f9368af8dd3201054a90686075f5b43cdf5511f3e40648ca4ec4cd7f9a86f5"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.2.0/mz-deploy-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "8f244103d7b6f6120a676317577a6391e63d222a13aa029f0f0fd383ac2ceda6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.2.0/mz-deploy-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b6d3a4b936d5b8e07886a89dd535dd69bf217a00161de1e3291ace4f63318208"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.2.0/mz-deploy-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c37311858c5f236d456a3298d1f6417ef54510320d072423bca68444704f4ea"
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
