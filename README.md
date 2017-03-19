# Simple script to build caddy
The script will build caddy into ./caddy. It's not super readable, but it works. 

## Usage
1. run `build-tris.sh` to build a version of go with tris as 'crypto/tls'
2. run `build.sh` to patch caddy with plugins and tls 1.3 support and the build it
3. have `./caddy`


## Plugins
By default, it is configured to build caddy with the following plugins:
* caddy-git
* caddy-expires

However, one can easily specify others by putting their `go get`able link in the `plugins.txt` file.
For example, if I wanted to add the ipfilter plugin, the plugins.txt file would look like:
```
github.com/abiosoft/caddy-git
github.com/epicagency/caddy-expires
github.com/pyed/ipfilter
```

## TLS 1.3

![Yes](https://g.liams.io/liam/simple-build-caddy/raw/master/test/yes.png)

Caddy is built with TLS 1.3!!! I don't think it has 0-RTT support, however that would be quite hard anyway because caddy seems to rely on SNI very heavily. Additionally, liams.io is configured very weirdly and without major restructuring would likely not support lack of SNI and therefore 0RTT.
