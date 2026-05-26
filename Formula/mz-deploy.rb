class MzDeploy < Formula
  desc "Deployment tool for Materialize"
  homepage "https://github.com/sjwiesman/mz-deploy"
  version "0.10.2"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.10.2/mz-deploy-v0.10.2-aarch64-apple-darwin.tar.gz"
      sha256 "c68eef890a3335abd8743b667e81322bc35b13ed7db76f4326d311c50012bec9"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.10.2/mz-deploy-v0.10.2-x86_64-apple-darwin.tar.gz"
      sha256 "c0dae90629e30282ba14e350e212775e8ff16dce8e1e9099fbb36144005838c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.10.2/mz-deploy-v0.10.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4391269cbcb5649baa27dffbca6c590c0ca29911edf2fb64b5866238461cb824"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.10.2/mz-deploy-v0.10.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bdaeaf86dd01e7973e29f0c27143e9600f8c12611f8e246a6c07b50f40b6cfb0"
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
