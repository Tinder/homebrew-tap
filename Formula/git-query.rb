class GitQuery < Formula
  desc "Query, Copy and Sync files from a remote Git repo"
  homepage "https://github.com/Tinder/GitQuery"
  url "https://github.com/Tinder/GitQuery/archive/3.0.6.tar.gz"
  sha256 "992286c54530c941ccb1c85a7fdff8cb56af310f8915aa995d0069116bf1b382"
  
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
