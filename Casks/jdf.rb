cask "jdf" do
  version "0.1.3"
  sha256 "a514c340143e5578ad0cdf02d2fe250dd3cff269c8b159033e6be917b52a9cad"

  url "https://github.com/uurtech/jdf/releases/download/v#{version}/JDF.Reader_#{version}_aarch64.dmg"
  name "JDF Reader"
  desc "Reader and editor for the JDF (JSON Document Format)"
  homepage "https://github.com/uurtech/jdf"

  depends_on arch: :arm64
  depends_on macos: ">= :catalina"

  app "JDF Reader.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-cr", "#{appdir}/JDF Reader.app"],
                   sudo:         false,
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/dev.jdf.viewer",
    "~/Library/Caches/dev.jdf.viewer",
    "~/Library/Preferences/dev.jdf.viewer.plist",
    "~/Library/WebKit/dev.jdf.viewer",
  ]
end
