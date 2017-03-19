# Simple script to build caddy
The script will build caddy into ./caddy. It's not super readable, but it works. 

## Usage
1. run `build-tris.sh` to build a version of go with tris as 'crypto/tls'
2. run `build.sh` to patch caddy with plugins and tls 1.3 support and the build it
3. have `./caddy`


## Plugins
If you read `build.sh`, it should be straightforward to add more plugins.

By default, it just comes with what I need:
* caddy-git
* caddy-expires

## TLS 1.3
![Yes!!][https://g.liams.io/liam/simple-build-caddy/raw/master/test/yes.png "TLS 1.3 Works!!!! Now if only we could get 0RTT...."]

Caddy is built with TLS 1.3!!! I don't think it has 0-RTT support, however that would be quite hard anyway becuase caddy seems to rely on SNI very heavily. Additionally, liams.io is configured very weirdly and without major resructuring would likely not support lack of SNI and therefore 0RTT.
