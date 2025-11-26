class Testers < Formula
  desc "The Testers.ai CLI tool"
  homepage "https://testers.ai"
  version "0.9.13.5" # Update this match your release

  # ARM (Apple Silicon)
  if OS.mac? && Hardware::CPU.arm?
    # Ensure this URL matches the ZIP filename your script produces
    url "https://github.com/testers-ai/releases/releases/download/v0.9.13.5/testers-mac-sequoia-arm-0.9.13.5.zip"
    sha256 "REPLACE_WITH_ARM_SHA256"
  end

  # Intel
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/testers-ai/releases/releases/download/v0.9.13.5/testers-mac-sequoia-intel-0.9.13.5.zip"
    sha256 "REPLACE_WITH_INTEL_SHA256"
  end

  def install
    # 1. Install the entire bundle into a private libexec folder
    # This keeps 'ffmpeg', 'node', and '_internal' hidden from the system
    libexec.install Dir["*"]

    # 2. Create the shim
    # This generates a script at $(brew --prefix)/bin/testers that 
    # executes the binary inside the private cellar.
    bin.write_exec_script libexec/"testers/testers"
  end

  test do
    # Simple smoke test to verify it works
    system "#{bin}/testers", "version"
  end
end
