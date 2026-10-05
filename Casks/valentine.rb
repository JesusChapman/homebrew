cask "valentine" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4,006"
  sha256 arm:   "37edbfb1359f91312ae66a750c76f5fa26c2306c1c11f40e11c9b5dc94ef251f",
         intel: "bfb9b70b6c80b9f31da5e078f4347ab7f306a60bc5a7ecbd9a82b42716335ec5"

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

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Valentine.app"], must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/dev.jesuschapman.Valentine",
    "~/Library/Preferences/dev.jesuschapman.Valentine.plist",
    "~/Library/Saved Application State/dev.jesuschapman.Valentine.savedState",
  ]
end
