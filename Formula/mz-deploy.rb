class MzDeploy < Formula
  desc "Deployment tool for Materialize"
  homepage "https://github.com/sjwiesman/mz-deploy"
  version "0.3.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.3.0/mz-deploy-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "e59b349c61c867c0646e48d4788e77cb2cee4b83a96754c785f0cc3591c43a4e"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.3.0/mz-deploy-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "ead7f9af4c540c605ab2425ce86aaf62bdcb3d5acd156fae4ae66f44c7afbd96"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.3.0/mz-deploy-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c46b26a7ac9239ca242200fb020539649502b6358154c28c354bfededc919aae"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.3.0/mz-deploy-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca30cbfec5933a3682fb900109aa1eab700075f6d94019b0b31447334c850d9b"
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
