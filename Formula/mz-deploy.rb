class MzDeploy < Formula
  desc "Deployment tool for Materialize"
  homepage "https://github.com/sjwiesman/mz-deploy"
  version "0.4.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.4.0/mz-deploy-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "0cb88f4ea39552a4a1fbe9f447499aa9e6f0b2a2f4a76714a0300db3a0996f41"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.4.0/mz-deploy-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "bc0bab9582ce45babeb83f963a0c8499cf9abaa23365da24d0c2bfbc25387ab5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.4.0/mz-deploy-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e10e0d385b9fd0b682dee5b57058851d846f99bd1f776268d48771a8b3176d9"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.4.0/mz-deploy-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "737bbbff1965b9faa1d5ec6fd6e04054fe3f59a62550a95c00e7fac72003fc96"
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
