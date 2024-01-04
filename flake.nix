{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ... } @inputs: inputs.utils.lib.eachSystem [
    "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"
  ] (system: let 
  pkgs = import nixpkgs {
    inherit system;
  };
  in {
    packages.default = pkgs.stdenv.mkDerivation {
      name = "wiki";

      src = ./.;

      # Set this to true so the make command does not run by default
      # and fail because makefile is not in repo
      buildPhase = "true";

      buildInputs = [
        pkgs.mkdocs
        pkgs.python311Packages.mkdocs-material            # materials theme
        pkgs.python311Packages.mkdocs-material-extensions # extensions plugin
        pkgs.gnutar                                       # for generating zip file on line 35 which is currently commented out
      ];
        
      # run build command
      # create output directory (this is what gets copied into the ./result path)
      # copy contents to output
      # zip contents
      installPhase = ''
        mkdocs build
        mkdir -p $out/www
        cp -r site/* $out/www
        # tar cfzv $out/site.tgz site/
      '';

      packages = with pkgs; [
        mkdocs
        python311Packages.mkdocs-material            # materials theme
        python311Packages.mkdocs-material-extensions # extensions plugin
        gnutar                                       # for generating zip file on line 35 which is currently commented out
      ];
      
    };
    
    devShells.default = pkgs.mkShell rec {
      name = "wiki";

      # Set this to true so the make command does not run by default
      # and fail because makefile is not in repo
      buildPhase = "true";

      shellHook = ''
        mkdocs build
      '';      

      packages = with pkgs; [
        mkdocs
        python311Packages.mkdocs-material            # materials theme
        python311Packages.mkdocs-material-extensions # extensions plugin
        gnutar                                       # for generating zip file on line 35 which is currently commented out
      ];
    };
  });
}
