# nix

## OCI

Build and run this wiki

```
nix build .#container
docker load < result
docker run -p 80:80 wiki:latest caddy file-server -r /site

OR

docker run -p 80:80 wiki:latest
```
