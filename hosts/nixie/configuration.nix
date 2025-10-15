# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, outputs,  ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

boot.supportedFilesystems = [ "ntfs" ];
/*fileSystems."/run/media/westlyroots/Windows" = 
{ 	device = "/dev/disk/by-uuid/DE8C1CA18C1C766D";
	fsType = "ntfs-3g";
	options = [ "rw" "uid=1000"];
};*/
boot.kernel.sysctl."kernel.sysrq" = 502;
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

    home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      westlyroots = import ./home.nix;
      };
    };
 fonts.fontDir.enable = true;
  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;

 # boot.kernelPackages = pkgs.linuxPackages_latest;
 boot.kernelPackages = pkgs.linuxPackages_cachyos;

  networking.hostName = "nixie"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
services.yggdrasil.enable = true;
services.gvfs.enable = true; # Mount, trash, and other functionalities
services.tumbler.enable = true; # Thumbnail support for images

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  # services.xserver.enable = true;

programs.thunar.enable = true;
programs.xfconf.enable = true;



  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  # services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  #hardware.wooting.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  programs.partition-manager.enable = true;
  # Enable sound with pipewire.
  /*services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = false;
    alsa.enable = false;
    alsa.support32Bit = true;
    pulse.enable = false;
    # If you want to use JACK applications, uncomment this
    jack.enable = false;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };*/

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.westlyroots = {
    isNormalUser = true;
    description = "Alicia Monrow";
    extraGroups = [ "networkmanager" "wheel" "input"];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

/*nixpkgs.config.permittedInsecurePackages = [
                "libsoup-2.74.3"
              ];*/

/*fileSystems."/export/test" = {
	device = "/dev/sdb1";
	#options = [  ];
	};

services.nfs.server = {
    enable = true;
    # fixed rpc.statd port; for firewall
    lockdPort = 4001;
    mountdPort = 4002;
    statdPort = 4000;
    extraNfsdConfig = '''';
  };*/
  networking.firewall = {
    enable = true;
      # for NFSv3; view with `rpcinfo -p`
    allowedTCPPorts = [ 111  2049 4000 4001 4002 20048 ];
    allowedUDPPorts = [ 111 2049 4000 4001  4002 20048 34197 ];
  };
/*services.nfs.server.exports = ''
	/export *(insecure,rw,sync,no_subtree_check,crossmnt,fsid=0)
	/export/test *(insecure,rw,async,no_subtree_check)

'';*/

  # Install firefox.

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
 # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    git
    #(xivlauncher-rb.override { useGameMode = true; })
    nil
    unrar
    bottles
    goverlay
    mangohud
    signal-desktop
    inputs.lucem.packages.x86_64-linux.lucem
    kitty
    tor-browser-bundle-bin
    git-crypt
    gnupg
    pinentry-curses
    kdePackages.ark
    keepassxc
    parsec-bin
    ungoogled-chromium
    wl-clipboard
    steamcmd


    transmission_4-qt
  ];

# Example for /etc/nixos/configuration.nix
services.syncthing = {
  enable = true;
  openDefaultPorts = true; # Open ports in the firewall for Syncthing
};
services.mpd = {
	user = "westlyroots";
	enable = true;
	musicDirectory = "/run/media/westlyroots/Storage/Music/";
	extraConfig = ''
		audio_output {
    			type "pipewire"
    			name "My PipeWire Output"
  		}

	'';
	#network.startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
};
systemd.services.mpd.environment = {
	XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.westlroots/uid}";
};

services.avahi = {
	nssmdns6 = true;
	nssmdns4 = true;
	enable = true;
	ipv4 = true;
	ipv6 = true;
	publish = {
		enable = true;
		addresses = true;
		domain = true;
		hinfo = true;
		userServices = true;
		workstation = true;
		};
	};
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
  programs.zsh.enable = true;
users.defaultUserShell = pkgs.zsh;
hardware.cpu.amd.updateMicrocode = true;

programs.gnupg.agent.enable = true;
programs.gnupg.agent.pinentryPackage = pkgs.pinentry-curses;

}
