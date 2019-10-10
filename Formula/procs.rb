class Procs < Formula
  desc "Modern replacement for ps written by Rust"
  homepage "https://github.com/dalance/procs"
  url "https://github.com/dalance/procs/archive/v0.8.11.tar.gz"
  sha256 "ff84d26e4acfcf2a904745436dfd939d9f66903f86bfdc1bcffed366a0461f80"

  bottle do
    cellar :any_skip_relocation
    sha256 "c1fa3ef0f5c054abda9c80e089d1fc2adc5b46457e090a47eced8af576892275" => :mojave
    sha256 "46026a2be995011d1f690faa85117416b6f57b25e6ec4d2c9ed9457d02ed052a" => :high_sierra
    sha256 "765dbc9c8861089a3077d89195742df4253c62237081a43b56a27bff0cce853c" => :sierra
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
  end

  test do
    output = shell_output("#{bin}/procs")
    count = output.lines.count
    assert count > 2
    assert output.start_with?(" PID:")
  end
end
