WHERE=$(pwd)
GO=$(pwd)/go.sh

$GO get github.com/mholt/caddy/caddy
while read p; do
	$GO get $p
	echo $p
done < plugins.txt

cd go/src/github.com/mholt/caddy/caddy/
git checkout HEAD -- ..
rm caddy

# --- Patch for plugins ---
while read p; do
	sed "/\/\/ This is where other plugins get plugged in (imported)/a \ 	_ \"$p\""  -i caddymain/run.go
done < "$WHERE/plugins.txt"

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
