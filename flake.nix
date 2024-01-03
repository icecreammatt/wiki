{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/23.11";

    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ... } @inputs: inputs.utils.lib.eachSystem [
    "x86_64-linux" "aarch64-linux"
  ] (system: let 
  pkgs = import nixpkgs {
    inherit system;
  };
  in {
    packages.default = pkgs.stdenv.mkDerivation {
      name = "wiki";

      src = ./.;

      buildPhase = "true";

      buildInputs = [
        pkgs.mkdocs
        pkgs.python311Packages.mkdocs-material
        pkgs.python311Packages.mkdocs-material-extensions
        pkgs.gnutar
      ];
        
      installPhase = ''
        mkdocs build
        mkdir -p $out/www
        cp -r site/* $out/www
        # tar cfzv $out/site.tgz site/
      '';

      packages = with pkgs; [
        mkdocs
        python311Packages.mkdocs-material
        python311Packages.mkdocs-material-extensions
        gnutar
      ];
      
    };
    
    devShells.default = pkgs.mkShell rec {
      name = "wiki";

      buildPhase = "true";

      shellHook = ''
        mkdocs build
      '';      

      packages = with pkgs; [
        mkdocs
        python311Packages.mkdocs-material
        python311Packages.mkdocs-material-extensions
        gnutar
      ];
    };
  });
}
