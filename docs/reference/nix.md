# nix

## Reference
- [https://mynixos.com/](https://mynixos.com/)
- [https://search.nixos.org/options?channel=unstable&query=](https://search.nixos.org/options?channel=unstable&query=)
- [https://mipmip.github.io/home-manager-option-search/](https://mipmip.github.io/home-manager-option-search/)
- [https://lazamar.co.uk/nix-versions/](https://lazamar.co.uk/nix-versions/)
- [https://www.nixhub.io/](https://www.nixhub.io/)
- [https://jorel.dev/NixOS4Noobs/intro.html](https://jorel.dev/NixOS4Noobs/intro.html)

## OCI

Build and run this wiki

```
nix build .#container
docker load < result
docker run -p 80:80 wiki:latest caddy file-server -r /site

OR

docker run -p 80:80 wiki:latest
```

## Custom Sha for overlay

nix-prefetch fetchFromGitHub --owner icecreammatt --repo serpl --rev nix-flakes
The fetcher will be called as follows:
> fetchFromGitHub {
>   owner = "icecreammatt";
>   repo = "serpl";
>   rev = "nix-flakes";
>   sha256 = "sha256:0000000000000000000000000000000000000000000000000000";
> }

sha256-/pr/Tr26Sy7PYLGvEiGHtvzEwfag+sacbWTkDEieoZQ=

# Package progress tracker

[https://nixpkgs-tracker.ocfox.me/?pr=438640](https://nixpkgs-tracker.ocfox.me/?pr=438640)
