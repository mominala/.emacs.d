#!/usr/bin/env sh

nix-shell -p cmake libvterm-neovim --run "cd ~/.emacs.d/straight/build/vterm && mkdir -p build && cd build && cmake -DUSE_SYSTEM_LIBVTERM=yes .. && make"
