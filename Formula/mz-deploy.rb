class MzDeploy < Formula
  desc "Deployment tool for Materialize"
  homepage "https://github.com/sjwiesman/mz-deploy"
  version "0.9.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.9.0/mz-deploy-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "b0aaeb6f183e194fe352cb0697f12e5021a1fb01a18315e10b7def27e5bbd243"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.9.0/mz-deploy-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "37d14e2331f4237f2aa5176056f2efd01f9d12730a479c989e386a3d1dbc0d23"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.9.0/mz-deploy-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2afaa53fc5f68ab1c080a79e8ce471f03fca95ca08d492b1c6fb4f95e72204b0"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.9.0/mz-deploy-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f26093ac8d57b5d4a01a120582cf74c91f74dc4674789e846f7eaf37159ddca2"
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
