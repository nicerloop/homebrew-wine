cask "wine-crossover" do
  version "23.0.1"
  sha256 "64a9792ed09e8708fb3429a9cd0e643c8ee9c261ddcbf630dbd76f57c29833c4"

  url "https://github.com/Gcenx/winecx/releases/download/crossover-wine-#{version}/wine-crossover-#{version}-osx64.tar.xz"
  name "Wine Crossover"
  desc "Compatibility layer to run Windows applications"
  homepage "https://github.com/Gcenx/winecx/"

  livecheck do
    url :stable
    strategy :github_releases
  end

  conflicts_with formula: "wine",
                 cask:    %w[
                   wine-stable
                   wine-devel
                   wine-staging
                 ]
  depends_on macos: ">= :catalina"

  app "Wine Crossover.app"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/start/bin/appdb"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/start/bin/winehelp"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/wine/bin/msiexec"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/wine/bin/notepad"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/wine/bin/regedit"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/wine/bin/regsvr32"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/wine/bin/wine"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/wine/bin/wine-preloader"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/wine/bin/wine64"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/wine/bin/wine64-preloader"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/wine/bin/wineboot"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/wine/bin/winecfg"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/wine/bin/wineconsole"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/wine/bin/winedbg"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/wine/bin/winefile"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/wine/bin/winemine"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/wine/bin/winepath"
  binary "#{appdir}/Wine Crossover.app/Contents/Resources/wine/bin/wineserver"

  caveats <<~EOS
    #{token} supports running 32-bit & 64-bit windows binaries.

    #{token} does not support creating a 32-bit wine prefix.
  EOS
  caveats <<~EOS
    To enable noflicker set the following registry key in your prefix:
    [HKCU\\Software\\Wine\\Mac Driver]
    "ForceOpenGLBackingStore"="y"
  EOS
end
