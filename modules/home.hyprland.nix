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
      "$terminal" = "alacritty";
      exec-once = [
        "uwsm app -- waybar"
        "uwsm app -- clipse -listen"
	"systemctl --user start hyprpolkitagent"
      ];
      windowrule = [
        "match:content game, immediate on"
	"match:class (clipse), float true"
        "match:class (clipse, size 622 652"
        "match:class ^steam_app_\d+$, content game"
        #"workspace 3, class:keepassxc"
	"match:class (ffxiv_dx11.exe), content game"
	"match:class (tf_linux64), content game"
	#"content game, class:(steam_app_*)"
	"match:content game, fullscreen true"
      ];
      bind =
        [
          "$mod, B, exec, firefox"
          "$mod, T, exec, $terminal"
          "$mod, M, exit"
          "$mod, Q, killactive"
	  "SUPER_SHIFT, Q, forcekillactive"
          "$mod, P, pseudo"
          "$mod, J, togglesplit"
          "$mod, F, fullscreen"
	  "$mod, O, togglefloating"
          "$mod, L, exec, pkill rofi || rofi -show drun"
          "$mod, V, exec, $terminal --class clipse -e 'clipse'"
	  "SUPER_SHIFT, Print, exec, hyprshot -m region"
	  ", Print, exec, hyprshot -m active --mode output"
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
	bindel = [
	  ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
	  "$mod, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 5%+"
	  "$mod, XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 5%-"
	  ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"
	  ];
	bindl = [
	", XF86AudioPlay, exec, playerctl play-pause"
	", XF86AudioPrev, exec, playerctl previous"
	", XF86AudioNext, exec, playerctl next"
	];
	bindm = [
        # mouse movements
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];
      #monitorv2 = {
	
      monitor = [
        "DP-3, highrr, auto, 1, vrr, 2, bitdepth, 10, cm, wide"];
      general = {
        #allow_tearing = true;
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        layout = "dwindle";
      };
      misc = {
      enable_anr_dialog = false;
      };
      render = {
      #direct_scanout = 2;
      cm_auto_hdr = 1;
      };
      animation = [
      "workspaces, 1, 5, default"
      ];
      #env = "HYPRCURSOR_THEME,rose-pine-hyprcursor";
      
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
	input = {
	  sensitivity = 0.0;
	  accel_profile = "flat";
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
    package = pkgs.rofi;
    # theme =
    extraConfig = {
    terminal = "kitty";
    show-icons = true;
    };
  };
  home.pointerCursor = {
  gtk.enable = true;
  x11.enable = true;
  package = pkgs.bibata-cursors;
  name = "Bibata-Modern-Classic";
  size = 16;
};
services.dunst = {
  enable = true;
  };
  # Optional, hint Electron apps to use Wayland:
  # home.sessionVariables.NIXOS_OZONE_WL = "1";

}
