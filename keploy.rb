# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
require "language/go"
class Keploy < Formula
  desc "Unit Testing Toolkit that creates test-cases and data mocks from API calls."
  homepage "https://keploy.io"
  url "https://github.com/keploy/keploy/archive/refs/tags/v0.5.5.tar.gz"
  sha256 "37a4a27d30ed831c8fd4f60609df4c6b3ce1633fd468696e8098a35a16140377"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath/"cmd/server"
    Language::Go.stage_deps resources, buildpath/"cmd/server" 
    Dir.chdir("cmd/server") do
       system "go", "build", "-o" , "keploy"   
       bin.install "keploy"
    end      
  end
end
