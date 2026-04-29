class MzDeploy < Formula
  desc "Deployment tool for Materialize"
  homepage "https://github.com/sjwiesman/mz-deploy"
  version "0.7.1"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.7.1/mz-deploy-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "622e68ccd96303dad9f1a4e6f76c788859eff018457e287bb4603bfb5a1dcb2e"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.7.1/mz-deploy-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "fa99267fbef82fef903513a96710cefba3db79d36d2b1f171081e02a9b550b34"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.7.1/mz-deploy-v0.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4617ff208cd81653904988dfa5c694fce31d91b1270c4bb1c822d321987a510c"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.7.1/mz-deploy-v0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b2362e8121c662a1b22bdbc93ae67e1b01daf5f77230f5aa5c848976e7d64923"
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
