cask "vesktop" do
  version "1.5.3"
  sha256 on_arch_conditional arm: "71e39434748e684a826f390ceb846d52ed1886bab8b5385c5d94c377e3ac1172",
    intel: "71e39434748e684a826f390ceb846d52ed1886bab8b5385c5d94c377e3ac1172"

  url on_arch_conditional arm: "https://github.com/Vencord/Vesktop/releases/download/v#{version}/Vesktop-#{version}-universal.dmg",
    intel: "https://github.com/Vencord/Vesktop/releases/download/v#{version}/Vesktop-#{version}-universal.dmg"

  name "Vesktop"
  desc "Vesktop gives you the performance of web Discord and the comfort of Discord Desktop"
  homepage "https://github.com/Vencord/Vesktop"

  app "Vesktop.app"

  zap trash: [
    "~/Library/Application Support/vesktop",
    "~/Library/Preferences/dev.vencord.vesktop.plist",
    "~/Library/Saved Application State/dev.vencord.vesktop.savedState",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/dev.vencord.vesktop.sfl3'"
  ]

  livecheck do
    url "https://github.com/Vencord/Vesktop.git"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  caveats <<~EOS
    To take Vesktop out of quarantine and run it, execute the following command:
      xattr -d com.apple.quarantine /Applications/Vesktop.app
  EOS
end
