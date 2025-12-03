class Testers < Formula
  desc "The Testers.ai CLI tool"
  homepage "https://testers.ai"
  version "__VERSION__"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/testers-ai/releases/releases/download/v__VERSION__/testers-mac-arm64-__VERSION__.zip"
      sha256 "__SHA256_ARM__"
    end

    if Hardware::CPU.intel?
      url "https://github.com/testers-ai/releases/releases/download/v__VERSION__/testers-mac-x86_64-__VERSION__.zip"
      sha256 "__SHA256_INTEL__"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"testers/testers"
  end

  test do
    system "#{bin}/testers", "version"
  end
end
