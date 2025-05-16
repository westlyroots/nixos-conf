{pkgs, inputs, ...}:{

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
      windowrule = [
        "immediate, content:game"
    #   "content game, "
      ];
      bind =
        [
          "$mod, F, exec, firefox"
          "$mod, T, exec, $terminal"
          "$mod, M, exit"
          "$mod, Q, killactive"
          "$mod, P, pseudo"
          "$mod, J, togglesplit"
          "$mod, F, fullscreen"
          "$mod, L, exec, pkill rofi || rofi -show drun"
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
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        rounding_power = 2;
        shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        color = "rgba(1a1a1aee)";
        };
        };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
        };
      };
};
  programs.waybar = {
    enable = true;
  };
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    # theme =
    extraConfig = {
    terminal = "kitty";
    show-icons = true;
    me-accept-entry = "MousePrimary";
    kb-cancel = "Escape,MouseMiddle";
    };
  };
  # Optional, hint Electron apps to use Wayland:
  # home.sessionVariables.NIXOS_OZONE_WL = "1";

}
