cask "lens" do
  version "5.2.0-latest.20210908.1"

  if Hardware::CPU.intel?
    sha256 "6055e4c451bae97c0ec7f337bddf9afeec95098b153849c29eed6378dbdb9728"
    url "https://api.k8slens.dev/binaries/Lens-#{version}.dmg"
  else
    sha256 "d353a2d163af2799562fce0b94f3c7b8f210023a3b82c071a3a593901a25e4b5"
    url "https://api.k8slens.dev/binaries/Lens-#{version}-arm64.dmg"
  end

  name "Lens"
  desc "Kubernetes IDE"
  homepage "https://k8slens.dev/"

  livecheck do
    url "https://lens-binaries.s3.amazonaws.com/ide/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true

  app "Lens.app"

  zap trash: [
    "~/Library/Application Support/Lens",
    "~/Library/Caches/Lens",
    "~/Library/Preferences/com.electron.kontena-lens.plist",
    "~/Library/Saved Application State/com.electron.kontena-lens.savedState",
  ]
end
