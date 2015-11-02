NIX_PATH=nixpkgs=https://nixos.org/channels/nixpkgs-unstable/nixexprs.tar.xz

all :
	nix-shell -I $(NIX_PATH) \
  -p "haskellPackages.ghcWithPackages (pkgs: with pkgs; [hspec])"
