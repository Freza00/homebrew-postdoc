cask "postdoc" do
  version "0.1.6"
  sha256 "431e169eae54eca1753d24795dc1d995923192251aec2179c255eb1e1d54938a"

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

  # Strip the macOS quarantine xattr after install. Postdoc Preview is
  # distributed unsigned (Path B); without this, Gatekeeper would block
  # first launch from Finder/Dock and the user would have to right-click
  # → Open. Homebrew removed the `--no-quarantine` install flag in 2025,
  # so a postflight is now the only way to ship an unsigned cask that
  # opens cleanly. Runs as the installing user, no sudo needed.
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
    Postdoc is currently distributed unsigned (Preview). The cask's
    postflight strips the quarantine attribute so first launch should
    open cleanly; if Gatekeeper still blocks it, right-click
    Postdoc.app → Open → Open the first time.

    Future updates can be applied from inside the app:
    Settings → Updates → Check for updates. The in-app updater works
    regardless of how you installed (Homebrew or direct .dmg).

    A signed build (Developer ID) will land in a later release.
  EOS
end
