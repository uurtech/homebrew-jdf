cask "jdf" do
  version "0.1.20"
  sha256 "3c360a0e2dd7fd000c7a291dbcf8a9b972175824d772d7478a53c8dfc07c3c7b"

  url "https://github.com/uurtech/jdf/releases/download/v#{version}/JDF.Reader_#{version}_aarch64.dmg"
  name "JDF Reader"
  desc "Viewer and editor for the JDF (JSON Document Format)"
  homepage "https://github.com/uurtech/jdf"

  depends_on arch: :arm64
  depends_on macos: :catalina

  app "JDF Reader.app"

  # The dmg is unsigned. Strip the macOS quarantine attribute so Gatekeeper
  # does not show "JDF Reader is damaged and can't be opened" on first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/JDF Reader.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/dev.jdf.viewer",
    "~/Library/Caches/dev.jdf.viewer",
    "~/Library/Preferences/dev.jdf.viewer.plist",
    "~/Library/WebKit/dev.jdf.viewer",
  ]
end
