# nix

## Reference
- [https://mynixos.com/](https://mynixos.com/)
- [https://search.nixos.org/options?channel=unstable&query=](https://search.nixos.org/options?channel=unstable&query=)
- [https://mipmip.github.io/home-manager-option-search/](https://mipmip.github.io/home-manager-option-search/)
- [https://lazamar.co.uk/nix-versions/](https://lazamar.co.uk/nix-versions/)
- [https://www.nixhub.io/](https://www.nixhub.io/)

## OCI

Build and run this wiki

```
nix build .#container
docker load < result
docker run -p 80:80 wiki:latest caddy file-server -r /site

OR

docker run -p 80:80 wiki:latest
```
