# Simple script to build caddy
The script will build caddy into ./caddy. It's not super readable, but it works. 

Just run `bash build.sh`. You need go (obviously). Go1.8 is magnitudes better than 1.7, so use that.

## Plugins
If you read it, it should be straightforward to add more plugins.

By default, it just comes with what I need:
* caddy-git
* caddy-expires

## TLS 1.3
I would really like TLS 1.3 via tls-tris, but I doubt I'll have time to make it work before tris is merged with mainline go and caddy updated to use it anyway.
