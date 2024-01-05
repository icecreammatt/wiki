# Wiki

## Building

- `nix build`


## Building and run OCI

- `nix build .#container`
- `docker load < result`
- `docker run -p 80:80 wiki:latest`

## Developing

- `nix develop`
- `mkdocs build`
- `mkdocs serve`
