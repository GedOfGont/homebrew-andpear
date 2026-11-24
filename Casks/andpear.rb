cask "andpear" do
  version "0.1.1"
  sha256 "f0191b82dd366c19e83cb577b405c7bfa0270854c092ea5866f597689178c9c5"

  url "https://github.com/GedOfGont/andpear/releases/download/v#{version}/AndPear-#{version}.zip"
  name "AndPear"
  desc "Shows your Android notifications on the Mac"
  homepage "https://github.com/GedOfGont/andpear"

  depends_on macos: :ventura

  app "AndPear.app"

  # The app is not notarized yet; drop the quarantine flag so Gatekeeper does not block it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AndPear.app"]
  end

  zap trash: [
    "~/Library/Application Support/NotifyBridge",
    "~/Library/Preferences/com.notifybridge.desktop.plist",
  ]
end
