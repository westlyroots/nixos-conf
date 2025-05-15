{...}:{

    programs.kitty.enable = true; # required for the default Hyprland config
    wayland.windowManager.hyprland = {
  enable = true;
  # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
  package = null;
  portalPackage = null;
  xwayland.enable = true;
  settings = {
   "$mod" = "SUPER";
   "$terminal" = "kitty";
    exec-once = [
    "waybar"
    ];
    bind =
      [
        "$mod, F, exec, firefox"
        "$mod, T, exec, $terminal"
        "$mod, M, exit"
        ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
       bindm = [
    # mouse movements
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
    "$mod ALT, mouse:272, resizewindow"
    ];
    monitor = [
    ", preferred, auto, 1"];
    general = {
    allow_tearing = true;
    };
      };
};
  programs.waybar = {
  enable = true;
  };
  # Optional, hint Electron apps to use Wayland:
  # home.sessionVariables.NIXOS_OZONE_WL = "1";

}
