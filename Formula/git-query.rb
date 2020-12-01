class GitQuery < Formula
  desc "Query, Copy and Sync files from a remote Git repo"
  homepage "https://github.com/Tinder/GitQuery"
  url "https://github.com/Tinder/GitQuery/archive/3.0.0.tar.gz"
  sha256 "efe4add3457f1c7b9cfe2868a81ccd9b61aacf076ba676c5d2ca650ee1e67a81"
  
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
