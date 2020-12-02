class GitQuery < Formula
  desc "Query, Copy and Sync files from a remote Git repo"
  homepage "https://github.com/Tinder/GitQuery"
  url "https://github.com/Tinder/GitQuery/archive/3.0.4.tar.gz"
  sha256 "673e863c713c68137fb3d7efaf00601b1c1307732657e01c2fa6ec8093d240ce"
  
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
