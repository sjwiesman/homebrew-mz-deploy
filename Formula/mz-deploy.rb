class MzDeploy < Formula
  desc "Deployment tool for Materialize"
  homepage "https://github.com/sjwiesman/mz-deploy"
  version "0.7.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.7.0/mz-deploy-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "45c054c6c1230a3e96ae232d6d197fc13c21958350852043527f4e9d140c22bc"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.7.0/mz-deploy-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "2d7363d2a2965360134254bc670c6196ec883c553c84c0a3e9f5905be674501f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.7.0/mz-deploy-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b8fc8423ac1541d72620fb48cd69c4d37dd3758382f2130219d479d71f9e8d93"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.7.0/mz-deploy-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54f7fc1ecdc1a37b115d0d069efd4588803fa564df53eb3240e9bab979c61add"
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
