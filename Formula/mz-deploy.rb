class MzDeploy < Formula
  desc "Deployment tool for Materialize"
  homepage "https://github.com/sjwiesman/mz-deploy"
  version "0.1.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.1.0/mz-deploy-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "0509652d26a23f2fb72e4b57d4558c3d8e3a67571f78faa539a77a90ad987b5f"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.1.0/mz-deploy-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "8fc904da6b8ab3f511410c00f31d8535f83364b850030d98252e80665f40a5ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.1.0/mz-deploy-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd01c58bfa32dd04e859ff8d6b23788a4b2c90fa805d9ca526d937e6a30f64dc"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.1.0/mz-deploy-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "672edd565962ae74f9a7d887e5cce9cb0c0c9c8d411ed09bd31382998ef03a11"
    end
  end

  def install
    bin.install "mz-deploy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mz-deploy --version")
  end
end
