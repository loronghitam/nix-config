{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    prefix = "C-a";
    terminal = "screen-256color";
    keyMode = "vi";
    escapeTime = 10;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      resurrect
      gruvbox
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
        '';
      }
    ];
    extraConfig = ''
      unbind %
      bind | split-window -h

      unbind '"'
      bind - split-window -v

      bind j resize-pane -D 5
      bind k resize-pane -U 5
      bind l resize-pane -R 5
      bind h resize-pane -L 5

      bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
      bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

    '';
  };
}
