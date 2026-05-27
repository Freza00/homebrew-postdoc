cask "postdoc" do
  version "0.1.0"
  sha256 "e32caf6f283758c84961bc51196306d64daef81b562c0dfdee02c63f2c5e1c26"

  url "https://github.com/Freza00/homebrew-postdoc/releases/download/v#{version}/Postdoc_#{version}_universal.dmg"
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

    A signed build (Developer ID) will land in a later release.
  EOS
end
