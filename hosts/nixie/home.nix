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
     thefuck
     zsh-powerlevel10k
     lutris
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

  programs.git = {
  enable = true;
  userEmail = "westlyroots@proton.me";
  userName = "westlyroots";
  signing.key = "00F358534DB03F5AC75F87E92EFCDF33E3EC99A8";
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
