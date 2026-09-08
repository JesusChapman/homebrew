cask "valentine" do
  version "1.3,004"
  sha256 "6e3c04c02fce8207b3dab07b1ae7ae60456c965e15eb876135c02ed81e4287f6"

  url "https://github.com/JesusChapman/valentine/releases/download/v#{version.csv.first}/valentine_#{version.csv.first}_#{version.csv.second}_universal.dmg"
  name "Valentine"
  desc "Elegant native music player with support for synchronized lyrics"
  homepage "https://github.com/JesusChapman/valentine"

  depends_on macos: :tahoe

  app "Valentine.app"

  zap trash: [
    "~/Library/Application Support/dev.jesuschapman.Valentine",
    "~/Library/Preferences/dev.jesuschapman.Valentine.plist",
    "~/Library/Saved Application State/dev.jesuschapman.Valentine.savedState",
  ]
end
