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
    # Add overlay here to inject the mkdocs-material and extensions plugin
    nixpkgs.overlays = (self: super: {
      mkdocs = super.mkdocs.override {
        propogatedBuildInputs = [super.mkdocs.propogatedBuildInputs]
          ++ pkgs.python311Packages.mkdocs-material
          ++ pkgs.python311Packages.mkdocs-material-extensions;
      };
    });
  };
  in {
    hydraJobs."tester" = self.packages.container;

    packages.container = pkgs.dockerTools.buildImage {
      name = "wiki";
      tag = "latest";
      # created = builtins.substring 0 8 self.lastModifiedDate; # this is recommended instead of using "now" the docs but throws a parser error
      created = "now";

      # The withPackages bit in the extra command adds the other packages
      # to the scope of this nix package. Not sure why this is needed to be done
      # this way here. It appears to ignore the overlay defined above despite
      # working below for the default nix build command
      extraCommands = ''
        ${(pkgs.python311.withPackages(ps: with ps; [
          mkdocs mkdocs-material mkdocs-material-extensions
        ]))}/bin/mkdocs build
      '';

      copyToRoot = pkgs.buildEnv {
        name = "wiki";
        paths = [
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
      ];

      # run build command
      # create output directory (this is what gets copied into the ./result path)
      # copy contents to output
      # zip contents
      installPhase = ''
        ${pkgs.mkdocs}/bin/mkdocs build
        mkdir -p $out/www
        cp -r site/* $out/www
      '';
    };
    
    devShells.default = pkgs.mkShell rec {
      name = "wiki";

      # Set this to true so the make command does not run by default
      # and fail because makefile is not in repo
      buildPhase = "true";

      shellHook = ''
        ${pkgs.mkdocs}/bin/mkdocs build
      '';      

      # this is used instead of packages 
      nativeBuildInputs = [
        pkgs.python311Packages.mkdocs-material            # materials theme
        pkgs.python311Packages.mkdocs-material-extensions # extensions plugin
      ];
    };
  });
}
