class MzDeploy < Formula
  desc "Deployment tool for Materialize"
  homepage "https://github.com/sjwiesman/mz-deploy"
  version "0.8.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.8.0/mz-deploy-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "6969ac80a882be62c9a635e27f3e9f11581ea3a9d17ba4a1ed659d632dfbb00f"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.8.0/mz-deploy-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "0a7c1728bb971990ca6104d15ea42ba6c926ae0fa6aba46dab435074738200fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.8.0/mz-deploy-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81f8b9ebf5fbb54db580f89e7a2caf5e8c054e30cdef4eba71e0ebdb32b223f2"
    else
      url "https://github.com/sjwiesman/mz-deploy/releases/download/v0.8.0/mz-deploy-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eb7ae59cfe0f34a84279112e9e182ea7dfb4662fb181c5c8924d8443a4355365"
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
