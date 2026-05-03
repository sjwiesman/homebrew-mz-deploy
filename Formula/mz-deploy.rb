class MzDeploy < Formula
  desc "Deployment tool for Materialize"
  homepage "https://github.com/sjwiesman/mz-deploy"
  version "0.10.1"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.10.1/mz-deploy-v0.10.1-aarch64-apple-darwin.tar.gz"
      sha256 "e1a2dc80bbdfa872990a3c20dd7b8d8e8b0c5338f5c9c1ccccbcdbba35e5585a"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.10.1/mz-deploy-v0.10.1-x86_64-apple-darwin.tar.gz"
      sha256 "9419d37fabbe017bf56dfc76b23d03c0eef6e9e005479dd73a67bc6dbdca08d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.10.1/mz-deploy-v0.10.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6f3713166a8fa06a1796de9a1adf0735358a74c6eebcc0ea618478ef91d8e70a"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.10.1/mz-deploy-v0.10.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9ebe9a1ea3fc4d5649d1f5729e4f46c5885b1cc502e1f3d77d69e1fa5b23b31c"
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
