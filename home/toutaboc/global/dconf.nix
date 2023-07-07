# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, pkgs, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file://../wallpapers/wallpaper.png";
      picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-d.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/input-sources" = {
      per-window = true;
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "br+thinkpad" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "Numix-Cursor";
      enable-hot-corners = false;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      gtk-theme = "palenight";
      icon-theme = "Papirus-Dark";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      speed = 1.0;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      speed = 1.0;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = [];
      begin-move = [];
      begin-resize = [];
      maximize = [];
      minimize = [];
      switch-input-source = [];
      switch-input-source-backward = [];
      switch-to-workspace-1 = [ "<Shift><Super>1" ];
      toggle-maximized = [];
      unmaximize = [];
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = false;
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [];
      toggle-tiled-right = [];
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 912 984 ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
      screensaver = [ "<Shift><Control><Super>l" ];
      search = [ "<Super>space" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Alt>t";
      command = "kitty";
      name = "Open Terminal";
    };

    "org/gnome/shell" = {
      app-picker-layout = "[{'org.gnome.Geary.desktop': <{'position': <0>}>, 'org.gnome.Contacts.desktop': <{'position': <1>}>, 'org.gnome.Weather.desktop': <{'position': <2>}>, 'org.gnome.clocks.desktop': <{'position': <3>}>, 'org.gnome.Maps.desktop': <{'position': <4>}>, 'org.gnome.Extensions.desktop': <{'position': <5>}>, 'org.gnome.Photos.desktop': <{'position': <6>}>, 'org.gnome.Totem.desktop': <{'position': <7>}>, 'org.gnome.Calculator.desktop': <{'position': <8>}>, 'simple-scan.desktop': <{'position': <9>}>, 'org.gnome.Settings.desktop': <{'position': <10>}>, 'gnome-system-monitor.desktop': <{'position': <11>}>, 'Utilities': <{'position': <12>}>, 'yelp.desktop': <{'position': <13>}>, 'org.gnome.Cheese.desktop': <{'position': <14>}>, '1password.desktop': <{'position': <15>}>, 'org.gnome.Calendar.desktop': <{'position': <16>}>, 'firefox.desktop': <{'position': <17>}>, 'fish.desktop': <{'position': <18>}>, 'org.kde.kdeconnect-settings.desktop': <{'position': <19>}>, 'cups.desktop': <{'position': <20>}>, 'org.gnome.Music.desktop': <{'position': <21>}>, 'nvim.desktop': <{'position': <22>}>, 'nixos-manual.desktop': <{'position': <23>}>}, {'ranger.desktop': <{'position': <0>}>, 'org.gnome.TextEditor.desktop': <{'position': <1>}>, 'org.gnome.Tour.desktop': <{'position': <2>}>, 'org.gnome.Epiphany.desktop': <{'position': <3>}>, 'xterm.desktop': <{'position': <4>}>}]";
      disable-user-extensions = false;
      disabled-extensions = [];
      enabled-extensions = [ "gsconnect@andyholmes.github.io" "forge@jmmaranan.com" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" "user-theme@gnome-shell-extensions.gcampax.github.com" ];
      favorite-apps = [ "org.gnome.Nautilus.desktop" "slack.desktop" "spotify.desktop" "code.desktop" "discord.desktop" "keybase.desktop" "chromium-browser.desktop" "kitty.desktop" ];
      welcome-dialog-last-shown-version = "44.2";
    };

    "org/gnome/shell/extensions/Logo-menu" = {
      menu-button-icon-image = 23;
      menu-button-icon-size = 23;
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      hacks-level = 0;
    };

    "org/gnome/shell/extensions/forge" = {
      auto-split-enabled = true;
      css-last-update = mkUint32 37;
      float-always-on-top-enabled = true;
      focus-border-toggle = true;
      preview-hint-enabled = true;
      quick-settings-enabled = true;
      stacked-tiling-mode-enabled = true;
      tabbed-tiling-mode-enabled = true;
      tiling-mode-enabled = true;
      window-gap-hidden-on-single = true;
      window-gap-size = mkUint32 4;
      window-gap-size-increment = mkUint32 4;
    };

    "org/gnome/shell/extensions/forge/keybindings" = {
      con-split-horizontal = [ "<Super>z" ];
      con-split-layout-toggle = [ "<Super>g" ];
      con-split-vertical = [ "<Super>v" ];
      con-stacked-layout-toggle = [ "<Shift><Super>s" ];
      con-tabbed-layout-toggle = [ "<Shift><Super>t" ];
      con-tabbed-showtab-decoration-toggle = [ "<Control><Alt>y" ];
      focus-border-toggle = [ "<Super>x" ];
      mod-mask-mouse-tile = "None";
      prefs-tiling-toggle = [ "<Super>w" ];
      window-focus-down = [ "<Super>j" ];
      window-focus-left = [ "<Super>h" ];
      window-focus-right = [ "<Super>l" ];
      window-focus-up = [ "<Super>k" ];
      window-gap-size-decrease = [ "<Control><Super>minus" ];
      window-gap-size-increase = [ "<Control><Super>plus" ];
      window-move-down = [ "<Shift><Super>j" ];
      window-move-left = [ "<Shift><Super>h" ];
      window-move-right = [ "<Shift><Super>l" ];
      window-move-up = [ "<Shift><Super>k" ];
      window-resize-bottom-decrease = [ "<Shift><Control><Super>i" ];
      window-resize-bottom-increase = [ "<Control><Super>u" ];
      window-resize-left-decrease = [ "<Shift><Control><Super>o" ];
      window-resize-left-increase = [ "<Control><Super>y" ];
      window-resize-right-decrease = [ "<Shift><Control><Super>y" ];
      window-resize-right-increase = [ "<Control><Super>o" ];
      window-resize-top-decrease = [ "<Shift><Control><Super>u" ];
      window-resize-top-increase = [ "<Control><Super>i" ];
      window-snap-center = [ "<Control><Alt>c" ];
      window-snap-one-third-left = [ "<Control><Alt>d" ];
      window-snap-one-third-right = [ "<Control><Alt>g" ];
      window-snap-two-third-left = [ "<Control><Alt>e" ];
      window-snap-two-third-right = [ "<Control><Alt>t" ];
      window-swap-down = [ "<Control><Super>j" ];
      window-swap-last-active = [ "<Super>Return" ];
      window-swap-left = [ "<Control><Super>h" ];
      window-swap-right = [ "<Control><Super>l" ];
      window-swap-up = [ "<Control><Super>k" ];
      window-toggle-always-float = [ "<Shift><Super>c" ];
      window-toggle-float = [ "<Super>c" ];
      workspace-active-tile-toggle = [ "<Shift><Super>w" ];
    };

    "org/gnome/shell/extensions/net/gfxmonk/impatience" = {
      speed-factor = 0.70;
    };

    "org/gnome/shell/extensions/rounded-window-corners" = {
      border-width = 2;
      custom-rounded-corner-settings = "@a{sv} {}";
      debug-mode = false;
      enable-preferences-entry = true;
      global-rounded-corner-settings = "{'padding': <{'left': <uint32 1>, 'right': <uint32 1>, 'top': <uint32 1>, 'bottom': <uint32 1>}>, 'keep_rounded_corners': <{'maximized': <false>, 'fullscreen': <false>}>, 'border_radius': <uint32 12>, 'smoothing': <uint32 0>, 'enabled': <true>}";
      settings-version = mkUint32 5;
      tweak-kitty-terminal = true;
    };

    "org/gnome/shell/extensions/search-light" = {
      blur-brightness = 0.6;
      blur-sigma = 30.0;
      entry-font-size = 1;
      monitor-count = 1;
      popup-at-cursor-monitor = true;
      scale-height = 0.1;
      scale-width = 0.1;
      shortcut-search = [ "<Control>space" ];
      show-panel-icon = false;
    };

    "org/gnome/shell/extensions/space-bar/appearance" = {
      active-workspace-padding-v = 2;
      empty-workspace-padding-v = 2;
      inactive-workspace-padding-v = 2;
      workspaces-bar-padding = 12;
    };

    "org/gnome/shell/extensions/space-bar/behavior" = {
      show-empty-workspaces = true;
      smart-workspace-names = true;
    };

    "org/gnome/shell/extensions/top-bar-organizer" = {
      center-box-order = [ "dateMenu" "Media Player" ];
      left-box-order = [ "Space Bar" "appMenu" "Notifications" "menuButton" "activities" ];
      right-box-order = [ "dwellClick" "keyboard" "screenRecording" "vitalsMenu" "quickSettings" "a11y" "screenSharing" ];
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Orchis-dark";
    };

    "org/gnome/shell/extensions/vitals" = {
      hide-icons = false;
      hide-zeros = true;
      show-battery = true;
      use-higher-precision = true;
    };

    "org/gnome/shell/world-clocks" = {
      locations = "@av []";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.0 0.0 ]) ];
      selected-color = mkTuple [ true 0.870588 ];
    };

  };

  home.packages = with pkgs; [
    gnomeExtensions.forge
    gnomeExtensions.user-themes
    gnomeExtensions.space-bar
  ];

}
