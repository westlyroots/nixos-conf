{...}:{
nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 30d";
};
nix.optimise = {
automatic = true;
persistent = true;
};}
