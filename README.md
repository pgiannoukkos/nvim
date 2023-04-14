# My Neovim Config

## Try out this config

```sh
git clone https://github.com/pgiannoukkos/nvim.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed.

**NOTE:** (You will notice treesitter and mason pulling in a bunch of parsers and LSPs the next time you open Neovim)

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste. Also that python and node haven't been setup

So let's fix that.

First we'll fix copy/paste.

- On mac `pbcopy` should be builtin

- On Ubuntu

    ```sh
    sudo apt install xsel
    ```

- On Arch Linux

    ```sh
    sudo pacman -S xsel
    ```

Next we need to install python support (node is optional)

- Neovim python support

    ```sh
    pip install pynvim
    ```

- Neovim node support

    ```sh
    npm i -g neovim
    ```

## Fonts

- [A nerd font](https://github.com/ryanoasis/nerd-fonts)
    ```sh
    yay -S ttf-firacode-nerd
    ```
- [codicon](https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf)
    ```sh
    yay -S vscode-codicons-git
    ```
- [An emoji font](https://github.com/googlefonts/noto-emoji/blob/main/fonts/NotoColorEmoji.ttf)

After moving fonts to `~/.local/share/fonts/`

Run: `$ fc-cache -f -v`

## Install latest rust-analyzer binary

```sh
$ mkdir -p ~/.local/bin
$ curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
$ chmod +x ~/.local/bin/rust-analyzer
```

