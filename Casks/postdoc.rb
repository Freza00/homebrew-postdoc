cask "postdoc" do
  version "0.1.2"
  sha256 "b0610ff993e1de9725c372544ba9f3550a99711d2ea3170aac6cac649e6c5afc"

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
