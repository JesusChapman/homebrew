cask "valentine" do
  version "1.1"
  sha256 "8360528471f020706c16bb759a6b8b7daa5a08ea62346d424e88243c24a9bea3"

  url "https://github.com/JesusChapman/valentine/releases/download/#{version}/Valentine_v#{version}_Apple_Silicon.dmg"
  name "Valentine"
  desc "Elegant native music player and synchronized lyrics editor"
  homepage "https://github.com/JesusChapman/valentine"

  app "Valentine.app"

  zap trash: [
    "~/Library/Application Support/dev.jesuschapman.Valentine",
    "~/Library/Preferences/dev.jesuschapman.Valentine.plist",
    "~/Library/Saved Application State/dev.jesuschapman.Valentine.savedState",
  ]
end
