class MzDeploy < Formula
  desc "Deployment tool for Materialize"
  homepage "https://github.com/sjwiesman/mz-deploy"
  version "0.10.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.10.0/mz-deploy-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "2de2b78fcc0f537258f84ef8d07c8dbd9731781effb2558f33f79e8541065ed9"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.10.0/mz-deploy-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "5ed98bc38d83842c7a823f068e7226a31260c2080bef059c46d2e63b1e7d9b74"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.10.0/mz-deploy-v0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f647ed95a84e9e827bf57737266f533b18d6e3d816063fef8e44126799b67fd"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.10.0/mz-deploy-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "785d374508e5f6ae5748389746553d8ee062e7e9560d0dd227ba0a2696a95a26"
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
