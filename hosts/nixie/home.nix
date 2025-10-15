{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "westlyroots";
  home.homeDirectory = "/home/westlyroots";
nixpkgs.config = {
  allowUnfree = true;
};
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.
  imports = [
    ../../modules/home.nixie.nix
  ];
 # nixpkgs.config.permittedInsecurePackages = [
  #              "libsoup-2.74.3"
   #           ];
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
     alacritty
     kitty
     gamescope
     vlc
     spotify
     vesktop
     proton-pass
     obs-studio
     xivlauncher
     nicotine-plus
    # thefuck
     zsh-powerlevel10k
     lutris
     telegram-desktop
     git-credential-keepassxc
     protonup-qt
     cmus
     bolt-launcher
     gimp3
     htop
     btop-rocm
     imv
     rmpc
     protonplus
     prismlauncher
    # thunar
     lf
     #cinny-desktop
     
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  /*pograms.rmpc = {
  	enable = true;
	config = ''
	(
    address: "127.0.0.1:6600",
    password: None,
    theme: None,
    cache_dir: None,
    on_song_change: None,
    volume_step: 5,
    max_fps: 30,
    scrolloff: 0,
    wrap_navigation: false,
    enable_mouse: true,
    status_update_interval_ms: 1000,
    select_current_song_on_change: false,
    album_art: (
        method: Auto,
        max_size_px: (width: 1200, height: 1200),
        disabled_protocols: ["http://", "https://"],
        vertical_align: Center,
        horizontal_align: Center,
    ),
    keybinds: (
        global: {
            ":":       CommandMode,
            ",":       VolumeDown,
            "s":       Stop,
            ".":       VolumeUp,
            "<Tab>":   NextTab,
            "<S-Tab>": PreviousTab,
            "1":       SwitchToTab("Queue"),
            "2":       SwitchToTab("Directories"),
            "3":       SwitchToTab("Artists"),
            "4":       SwitchToTab("Album Artists"),
            "5":       SwitchToTab("Albums"),
            "6":       SwitchToTab("Playlists"),
            "7":       SwitchToTab("Search"),
            "q":       Quit,
            ">":       NextTrack,
            "p":       TogglePause,
            "<":       PreviousTrack,
            "f":       SeekForward,
            "z":       ToggleRepeat,
            "x":       ToggleRandom,
            "c":       ToggleConsume,
            "v":       ToggleSingle,
            "b":       SeekBack,
            "~":       ShowHelp,
            "I":       ShowCurrentSongInfo,
            "O":       ShowOutputs,
            "P":       ShowDecoders,
        },
        navigation: {
            "k":         Up,
            "j":         Down,
            "h":         Left,
            "l":         Right,
            "<Up>":      Up,
            "<Down>":    Down,
            "<Left>":    Left,
            "<Right>":   Right,
            "<C-k>":     PaneUp,
            "<C-j>":     PaneDown,
            "<C-h>":     PaneLeft,
            "<C-l>":     PaneRight,
            "<C-u>":     UpHalf,
            "N":         PreviousResult,
            "a":         Add,
            "A":         AddAll,
            "r":         Rename,
            "n":         NextResult,
            "g":         Top,
            "<Space>":   Select,
            "<C-Space>": InvertSelection,
            "G":         Bottom,
            "<CR>":      Confirm,
            "i":         FocusInput,
            "J":         MoveDown,
            "<C-d>":     DownHalf,
            "/":         EnterSearch,
            "<C-c>":     Close,
            "<Esc>":     Close,
            "K":         MoveUp,
            "D":         Delete,
        },
        queue: {
            "D":       DeleteAll,
            "<CR>":    Play,
            "<C-s>":   Save,
            "a":       AddToPlaylist,
            "d":       Delete,
            "i":       ShowInfo,
            "C":       JumpToCurrent,
        },
    ),
    search: (
        case_sensitive: false,
        mode: Contains,
        tags: [
            (value: "any",         label: "Any Tag"),
            (value: "artist",      label: "Artist"),
            (value: "album",       label: "Album"),
            (value: "albumartist", label: "Album Artist"),
            (value: "title",       label: "Title"),
            (value: "filename",    label: "Filename"),
            (value: "genre",       label: "Genre"),
        ],
    ),
    artists: (
        album_display_mode: SplitByDate,
        album_sort_by: Date,
    ),
    tabs: [
        (
            name: "Queue",
            pane: Split(
                direction: Horizontal,
                panes: [(size: "40%", pane: Pane(AlbumArt)), (size: "60%", pane: Pane(Queue))],
            ),
        ),
        (
            name: "Directories",
            pane: Pane(Directories),
        ),
        (
            name: "Artists",
            pane: Pane(Artists),
        ),
        (
            name: "Album Artists",
            pane: Pane(AlbumArtists),
    
    ),
        (
            name: "Albums",
            pane: Pane(Albums),
        ),
        (
            name: "Playlists",
            pane: Pane(Playlists),
        ),
        (
            name: "Search",
            pane: Pane(Search),
        ),
    ],
)'';
};*/

  programs.git = {
  enable = true;
  userEmail = "westlyroots@proton.me";
  userName = "westlyroots";
  signing.key = "00F358534DB03F5AC75F87E92EFCDF33E3EC99A8";
  extraConfig = {
  credential.helper = "keepassxc --git-groups";
  };
};


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;


    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/westlyroots/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
     EDITOR = "nvim";
     TEST = "uwu";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
  enable = true;
  #enableCompletions = true;
  #autosuggestions.enable = true;
  syntaxHighlighting.enable = true;
  plugins = [
      {
        name = "powerlevel10k-config";
        src = ../../dotfiles;
        file = ".p10k.zsh";
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
    ];
  shellAliases = {
  add ="git add .";
  commit = "git commit -S -m";
  update = "sudo nixos-rebuild switch --flake github:westlyroots/nixos-conf";
  };
  history.size = 10000;
  };
home.shell.enableZshIntegration = true;
  /*services.gpg-agent = {
  enable = true;
  enableSshSupport = true;
  enableZshIntegration = true;
  };*/

programs.neovim = {
  enable = true;
  extraConfig = ''
    set number relativenumber
  '';
};

  # Optional, hint Electron apps to use Wayland:
  # home.sessionVariables.NIXOS_OZONE_WL = "1";

}
