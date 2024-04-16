{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "alex-datapad";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

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

  # LXQt with i3
  xdg.portal.lxqt = {
    enable = true;
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    xserver = {
      xkb = {
        layout = "us";
	variant = "";
      };

      desktopManager.lxqt = {
        enable = true;
      };

      windowManager.i3 = {
        enable = true;
	extraPackages = with pkgs; [
	  catppuccin-cursors
	];
      };
    };

    picom = {
      enable = true;
    };
  };

  /*
  # Wayland desktop
  programs = {
    sway = {
      enable = true;
      extraPackages = with pkgs; [
        kitty
	waybar
        wofi
        hyprcursor
        hyprpaper
      ];
    };
    
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

  };

  # Hint Electon apps to use wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
  */

  users.users.alex = {
    isNormalUser = true;
    description = "Alex";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Downloading utilities
    git
    wget
    curl

    # tty applications
    neovim
    lynx
    nnn
    #vifm
    fish
    neofetch
    
    # GUI applications
    wezterm
    qutebrowser

    ## Coding
    vscode
    dotnet-sdk_8
  ];

 system.stateVersion = "23.11";

}
