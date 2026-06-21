cask "jdf" do
  version "0.1.18"
  sha256 "7e20ecfb7f2e6802e756fc95164b9b81ad1f4a3ebaf24b41f3b9ca38316f74be"

  url "https://github.com/uurtech/jdf/releases/download/v#{version}/JDF.Reader_#{version}_aarch64.dmg"
  name "JDF Reader"
  desc "Reader and editor for the JDF (JSON Document Format)"
  homepage "https://github.com/uurtech/jdf"

  depends_on arch: :arm64
  depends_on macos: :catalina

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
