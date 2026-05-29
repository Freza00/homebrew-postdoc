cask "postdoc" do
  version "0.1.3"
  sha256 "e4c578da7d3b87d2ef6f76c36dfe7b90f00a79b1ed08cb55b5d9d0cb617d36d6"

  url "https://github.com/Freza00/homebrew-postdoc/releases/download/v#{version}/Postdoc_#{version}_universal.dmg",
      verified: "github.com/Freza00/homebrew-postdoc/"
  name "Postdoc"
  desc "Notes app where publishing is a verb"
  homepage "https://lasca.ai"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Postdoc.app"

  zap trash: [
    "~/Library/Application Support/com.postdoc.desktop",
    "~/Library/Caches/com.postdoc.desktop",
    "~/Library/Preferences/com.postdoc.desktop.plist",
    "~/Library/WebKit/com.postdoc.desktop",
    "~/Library/Saved Application State/com.postdoc.desktop.savedState",
    "~/Library/HTTPStorages/com.postdoc.desktop",
    "~/Library/HTTPStorages/com.postdoc.desktop.binarycookies",
  ]

  caveats <<~EOS
    Postdoc is currently distributed unsigned (Preview). On first launch you
    may see a Gatekeeper warning. Either install with:

      brew install --cask --no-quarantine Freza00/postdoc/postdoc

    or right-click Postdoc.app → Open → Open the first time.

    Once installed, future updates can be applied from inside the app:
    Settings → Updates → Check for updates. The in-app updater works
    regardless of how you installed (Homebrew or direct .dmg).

    A signed build (Developer ID) will land in a later release.
  EOS
end
