class MzDeploy < Formula
  desc "Deployment tool for Materialize"
  homepage "https://github.com/sjwiesman/mz-deploy"
  version "0.6.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.6.0/mz-deploy-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "376c2f74f2610bb6b687ed838ea6ea1c37a2af29a540ff81fb43746beefa079c"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.6.0/mz-deploy-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "63c331e024034342a83291b01941eb27d530d2399aec5e50cbd4df3780d36d61"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.6.0/mz-deploy-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "87cde8a3fded86feca6b9295bb4367f98629b918668d4025e4d94b942875de1a"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.6.0/mz-deploy-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30383a12b7144f06d96175f1f2e7e892628ccb13798231c32a5c42ad11171513"
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
