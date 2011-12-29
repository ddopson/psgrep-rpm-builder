
set -e
DIR="$(dirname "$(readlink -f "$0")")"
cd "$DIR"

VERSION=`cat version`

echo
echo "Installing into $DIR/install-root ..."
cd "psgrep-$VERSION"
mkdir -p "$DIR/install-root"
PREFIX="$DIR/install-root" ./install.sh

cd $DIR
echo
echo "Building RPM ..."
mkdir -p "$DIR/RPMS"
rpmbuild -bb package.spec --buildroot "$DIR/install-root" --define "_topdir $DIR" --define "VERSION $VERSION"

