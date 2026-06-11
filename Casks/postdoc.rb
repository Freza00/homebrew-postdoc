cask "postdoc" do
  version "0.1.14"
  sha256 "706a848819be6a7fe4c2e0495cb07fa018e3e2eee3e73ceccfad4718f9931dd8"

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

  # Belt-and-suspenders: strip the macOS quarantine xattr after install.
  # The build is signed + notarized (Developer ID) as of 0.1.13, so
  # Gatekeeper opens it cleanly without this; the postflight just removes
  # any residual first-launch friction. Runs as the installing user, no
  # sudo needed.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Postdoc.app"]
  end

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
    Updates can be applied from inside the app:
    Settings → Updates → Check for updates. The in-app updater works
    regardless of how you installed (Homebrew or direct .dmg).
  EOS
end
