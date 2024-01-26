{ config, pkgs, lib, inputs, ... }:

{
  home.username = "rheakles";
  home.homeDirectory = "/home/rheakles";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    firefox
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        dracula-theme.theme-dracula
        bbenoist.nix
        ms-vscode.cpptools
        esbenp.prettier-vscode
        bradlc.vscode-tailwindcss
        ms-python.python
      ];
    })
    vlc
    osu-lazer
    pcsxr
    blender
    ferdium
    scrcpy
    chromium
    eclipses.eclipse-java
    gimp
    inkscape
    libreoffice
    krita
    kicad
    uget
    moc
    wireshark
    putty
    gns3-gui
    gns3-server
    fritzing  
    ciscoPacketTracer8
  ];

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
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/rheakles/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "${pkgs.vscodium}/bin/codium";
  };
  
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };  

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
    
}
