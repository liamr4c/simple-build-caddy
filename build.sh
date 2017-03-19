WHERE=$(pwd)
GO=$(pwd)/go.sh
export GOPATH=$(pwd)/go #TODO: unnessessary?

$GO get github.com/mholt/caddy/caddy
$GO get github.com/abiosoft/caddy-git
$GO get github.com/epicagency/caddy-expires

cd go/src/github.com/mholt/caddy/caddy/
git checkout HEAD -- ..
rm caddy
sed '/\/\/ This is where other plugins get plugged in (imported)/a \ 	_ "github.com/abiosoft/caddy-git"'  -i caddymain/run.go
sed '/\/\/ This is where other plugins get plugged in (imported)/a \ 	_ "github.com/epicagency/caddy-expires"'  -i caddymain/run.go

# --- Patch caddy for tls-tris ---
sed 's/config\.ProtocolMaxVersion \= tls\.VersionTLS12/config.ProtocolMaxVersion = tls.VersionTLS13/g' -i ../caddytls/config.go
sed '/\"tls1\.2\"\: tls\.VersionTLS12\,/a \	\"tls1.3\"\: tls\.VersionTLS13\,' -i ../caddytls/config.go
git diff

# Please dont have @ in your directory names
sed "s@go@$GO@g" -i build.bash

#git diff build.bash #debugging

bash build.bash
./caddy -plugins

cp caddy $WHERE
