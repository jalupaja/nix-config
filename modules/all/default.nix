# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [
			# include default packages
			./pkgs.nix
			./nix-ld.nix
		];

  nix = {
      package = pkgs.nixFlakes;
      settings.experimental-features = [ "nix-command" "flakes" ];
  };

	# Kernel
	boot.kernelPackages = pkgs.linuxPackages_latest;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

	# clean /tmp on Boot
	boot.tmp.cleanOnBoot = true;

  networking.hostName = "debian"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Enable networking
networking.networkmanager.enable = true;

# Set your time zone.
time.timeZone = "Europe/Berlin";

# Select internationalisation properties.
i18n.defaultLocale = "en_US.UTF-8";

i18n.extraLocaleSettings = {
  LC_ADDRESS = "de_DE.UTF-8";
  LC_IDENTIFICATION = "de_DE.UTF-8";
  LC_MEASUREMENT = "de_DE.UTF-8";
  LC_MONETARY = "de_DE.UTF-8";
  LC_NAME = "de_DE.UTF-8";
  LC_NUMERIC = "de_DE.UTF-8";
  LC_PAPER = "de_DE.UTF-8";
  LC_TELEPHONE = "de_DE.UTF-8";
  LC_TIME = "de_DE.UTF-8";
};

# Enable the X11 windowing system.
#	services.xserver.enable = true;

# Enable the KDE Plasma Desktop Environment.
#	services.xserver.displayManager.sddm.enable = true;
#	services.xserver.desktopManager.plasma5.enable = true;

# Configure keymap in X11
#	services.xserver = {
#		layout = "eu";
#		xkbVariant = "";
#		xkbOptions = "caps:escape_shifted_capslock";
#	};

console.useXkbConfig = true;

services.fwupd.enable = true;

# Enable CUPS to print documents.
services.printing.enable = true;

# Enable sound with pipewire.
hardware.pulseaudio.enable = false;
security.rtkit.enable = true;
# TODO
security.pam.services.swaylock = {};

services.lemurs = {
	enable = false;
	# x11.enable = true;
	wayland.enable = true;
};

services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
# If you want to use JACK applications, uncomment this
#jack.enable = true;

# use the example session manager (no others are packaged yet so this is enabled by default,
# no need to redefine it in your config for now)
#media-session.enable = true;
    };

# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.jalupa = {
  isNormalUser = true;
  description = "jalupa";
  extraGroups = [ "jalupa" "networkmanager" "wheel" "video" "dialout" ];
};

services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
  '';

# TODO move into home-manager (didn't work for me)
programs.hyprland.enable = true;

# Allow unfree packages
nixpkgs.config.allowUnfree = true;

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:
services.udisks2.enable = true; # automount service
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
system.stateVersion = "23.11"; # Did you read the comment?

nix.settings.auto-optimise-store = true;
nix.gc = {
  automatic = true;
  persistent = true;
  dates = "20:00";
  options = "--delete-older-than 14d";
};
}
