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

    packages.container = pkgs.dockerTools.buildImage {
      name = "wiki";
      tag = "latest";
      created = "now";

      extraCommands = ''
        ${pkgs.mkdocs}/bin/mkdocs build
      '';

      copyToRoot = pkgs.buildEnv {
        name = "wiki";

        paths = [
          pkgs.caddy
          # todo figure out how to ge mkdocs-material plugin working
          (pkgs.python311.withPackages(ps: with ps; [
            mkdocs mkdocs-material mkdocs-material-extensions
          ]))
          ./. # copy current working directory into image TODO copy this into a sub path so resulting image root is cleaner
        ];
      };

      config = {
        Cmd = [ "${pkgs.caddy}/bin/caddy" "file-server" "-r" "/site" ];
        ExposedPorts = {
          "80/tcp" = { };
        };
      };

    };

    packages.default = pkgs.stdenv.mkDerivation {
    # wiki = pkgs.stdenv.mkDerivation {
      name = "wiki";

      src = ./.;

      # Set this to true so the make command does not run by default
      # and fail because makefile is not in repo
      buildPhase = "true";

      buildInputs = [
        pkgs.mkdocs
        pkgs.python311Packages.mkdocs-material            # materials theme
        pkgs.python311Packages.mkdocs-material-extensions # extensions plugin
        # pkgs.gnutar                                       # for generating zip file on line 35 which is currently commented out
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
