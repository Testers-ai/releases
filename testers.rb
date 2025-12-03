class Testers < Formula
  desc "The Testers.ai CLI tool"
  homepage "https://testers.ai"
  version "0.9.13.5-2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/testers-ai/releases/releases/download/v0.9.13.5-2/testers-mac-arm64-0.9.13.5-2.zip"
      sha256 "f83363e231dc8eaa34db80ef1425cdbfde4d7e4ef684049b4fb4455041af8a59"
    end

    if Hardware::CPU.intel?
      url "https://github.com/testers-ai/releases/releases/download/v0.9.13.5-2/testers-mac-x86_64-0.9.13.5-2.zip"
      sha256 "2c8f13bccec56e8d546664b0a4c61b84ea411fbfc068ed8b292de0c946736afb"
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
