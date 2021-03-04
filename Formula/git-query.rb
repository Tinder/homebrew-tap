class GitQuery < Formula
  desc "Query, Copy and Sync files from a remote Git repo"
  homepage "https://github.com/Tinder/GitQuery"
  url "https://github.com/Tinder/GitQuery/archive/3.0.7.tar.gz"
  sha256 "2c49c313046a27c5c4e8c9076dce11e29ad856846915d4cb6aaf0ee8208aee5f"
  
  depends_on "openjdk@8"

  def install
    system "./gradlew", "installDist"
    libexec.install %w[cli core]
    (bin/"gitquery").write_env_script libexec/"cli/build/install/cli/bin/cli", Language::Java.java_home_env
  end

  test do
    system libexec/"cli/build/install/cli/bin/cli", "--help"
  end
end
