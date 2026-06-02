class MzDeploy < Formula
  desc "Deployment tool for Materialize"
  homepage "https://github.com/sjwiesman/mz-deploy"
  version "0.0.1"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.0.1/mz-deploy-v0.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "2ac66f62f236d783ecf0e4db07a8efbb71289be72580d4717be12046d2c72181"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.0.1/mz-deploy-v0.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "879257a05680eddf7ea3ac411e9635337dacd351fbca5b491a9cc8ddc6169867"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.0.1/mz-deploy-v0.0.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37a036577d27b83b3f46c1b86969c7e120b343df2a2b165cf2ddc92ea90e2aa3"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.0.1/mz-deploy-v0.0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8495d21ecc3e45f7f85a0c2e57372c3d9b93cefe67b73725a6ddc92f197be1dc"
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
