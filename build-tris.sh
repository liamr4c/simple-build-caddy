WHERE=$(pwd)
BASEDIR="$WHERE/tls-tris/_dev"

# TODO: if it is already here, do a git pull
git clone https://github.com/cloudflare/tls-tris

make -C "$BASEDIR" go

GOENV="$(go env GOHOSTOS)_$(go env GOHOSTARCH)"
export GOROOT="$BASEDIR/go/$GOENV"
make -C "$BASEDIR" GOROOT GO="$BASEDIR/go/$GOENV/bin/go"

# this i dont understand
export GOROOT="$BASEDIR/GOROOT/$GOENV"

# test
exec $BASEDIR/go/$GOENV/bin/go version
