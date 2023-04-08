pkgname=rider
shortcut="$pkgname.desktop"
installdir="$HOME/.local/share/$pkgname"
binPath="$HOME/.local/bin"
appPath="$HOME/.local/share/applications"
shortcutPath="$appPath/$shortcut"

rm -rf $installdir
rm -f $shortcutPath
rm -f "$binPath/$pkgname"