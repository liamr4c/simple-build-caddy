WHERE=$(pwd)
export GOPATH=$(pwd)/go

go get github.com/mholt/caddy/caddy
go get github.com/abiosoft/caddy-git
go get github.com/epicagency/caddy-expires

cd go/src/github.com/mholt/caddy/caddy/
git checkout HEAD -- .
rm caddy
sed '/\/\/ This is where other plugins get plugged in (imported)/a \ 	_ "github.com/abiosoft/caddy-git"'  -i caddymain/run.go
sed '/\/\/ This is where other plugins get plugged in (imported)/a \ 	_ "github.com/epicagency/caddy-expires"'  -i caddymain/run.go

bash build.bash
./caddy -plugins

cp caddy $WHERE
