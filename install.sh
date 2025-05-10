pkgname=rider
pkgdesc='A cross-platform .NET IDE by JetBrains.'
pkgver='2025.1.1'
srcfile="JetBrains.Rider-$pkgver.tar.gz"
shortcut="$pkgname.desktop"
source="https://download.jetbrains.com/rider/$srcfile"

installdir="$HOME/.local/share/$pkgname"
binPath="$HOME/.local/bin"
appPath="$HOME/.local/share/applications"
shortcutPath="$appPath/$shortcut"

rm -rf $installdir
rm -f $shortcutPath
rm -f "$binPath/$pkgname"

if [ ! -f $srcfile ]; then
    wget $source
fi

echo "installing..."
echo $installdir
install -d -m700 $installdir
tar xzf $srcfile -C $installdir --strip-components 1

echo "$binPath/$pkgname"
install -d -m755 $binPath
ln -s "$installdir/bin/rider.sh" "$binPath/$pkgname"

echo $shortcutPath
install -d -m755 $appPath
install -m600 $shortcut $appPath
sed -i "s#Version=#Version=$pkgver#g" $shortcutPath
sed -i "s#Exec=#Exec=\"$installdir/bin/rider.sh\" %f#g" $shortcutPath
sed -i "s/Comment=/Comment=$pkgdesc/g" $shortcutPath
sed -i "s#Icon=#Icon=$installdir/bin/rider.svg#g" $shortcutPath
