class Gorchestra < Formula
  desc "Self-contained AI coding agent orchestration runtime"
  homepage "https://github.com/jgennari/gorchestra"
  url "https://github.com/jgennari/gorchestra/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "a76649df56eaa1c3ca66879a46c591c6526a7f475bf2599be19c8cab64432623"
  license "MIT"
  head "https://github.com/jgennari/gorchestra.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build",
      *std_go_args(
        output:  bin/"gorchestra",
        ldflags: "-s -w -X main.version=#{version}",
      ),
      "./cmd/app"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gorchestra --version")
  end
end
