# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
require "language/go"
require "language/node"
class Keploy < Formula
  desc "Unit Testing Toolkit that creates test-cases and data mocks from API calls."
  homepage "https://keploy.io"
  url "https://github.com/keploy/keploy/archive/refs/tags/v0.5.5.tar.gz"
  sha256 "37a4a27d30ed831c8fd4f60609df4c6b3ce1633fd468696e8098a35a16140377"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "gatsby-cli" => :build
  depends_on "node@14" => :build
 

  def install
    system "git","clone","https://github.com/keploy/ui.git"
    Dir.chdir("ui") do
       system "npm", "install"
       system "gatsby", "build"
    end  
    system "cp", "-R" , "ui/public", "web"
    system "rm", "-rf", "ui"
    Dir.chdir("cmd/server") do
       system "go", "build", "-o" , "keploy"   
       bin.install "keploy"
    end      
  end
end
