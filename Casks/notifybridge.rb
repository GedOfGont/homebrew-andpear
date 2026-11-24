cask "notifybridge" do
  version "0.1.0"
  sha256 "117c5224ba1441b7b220e18b7687c7a766709f0e91834d89883de2f2791a5386"

  url "https://github.com/GedOfGont/notifybridge/releases/download/v#{version}/NotifyBridge-#{version}.zip"
  name "NotifyBridge"
  desc "Shows your Android notifications on the Mac"
  homepage "https://github.com/GedOfGont/notifybridge"

  depends_on macos: :ventura

  app "NotifyBridge.app"

  # The app is not notarized yet; drop the quarantine flag so Gatekeeper does not block it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/NotifyBridge.app"]
  end

  zap trash: [
    "~/Library/Application Support/NotifyBridge",
    "~/Library/Preferences/com.notifybridge.desktop.plist",
  ]
end
