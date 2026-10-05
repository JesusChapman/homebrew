cask "valentine" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4,005"
  sha256 arm:   "3dab5ac4b99caaadccf5efb9fdf2e34656cb65eff141892e1ce195b2ddd0461e",
         intel: "fba4766dee8ca31a7a798d5f4f94a6ca0372b14df7bd418bd898bb0579787138"

  url "https://github.com/JesusChapman/valentine/releases/download/v#{version.csv.first}/valentine_#{version.csv.first}_#{version.csv.second}_#{arch}.dmg"
  name "Valentine"
  desc "Elegant native music player with support for synchronized lyrics"
  homepage "https://github.com/JesusChapman/valentine"

  livecheck do
    url :url
    regex(/valentine[._-](\d+(?:\.\d+)+)[._-](\d+)[._-]/i)
    strategy :github_latest do |json, regex|
      json["assets"]&.map do |asset|
        match = asset["name"]&.match(regex)
        next if match.blank?

        "#{match[1]},#{match[2]}"
      end
    end
  end

  depends_on macos: :tahoe

  app "Valentine.app"

  zap trash: [
    "~/Library/Application Support/dev.jesuschapman.Valentine",
    "~/Library/Preferences/dev.jesuschapman.Valentine.plist",
    "~/Library/Saved Application State/dev.jesuschapman.Valentine.savedState",
  ]
end
