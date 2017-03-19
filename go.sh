#!/bin/bash

WHERE=$(dirname $0)
BASEDIR="$WHERE/tls-tris/_dev"

GOENV="$(go env GOHOSTOS)_$(go env GOHOSTARCH)"
export GOROOT="$BASEDIR/GOROOT/$GOENV"

export GOPATH="$WHERE/go"

exec $BASEDIR/go/$GOENV/bin/go "$@"
