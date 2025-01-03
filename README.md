## About

Dotfiles for GNU/Linux (mostly Arch with a bit of Debian/Ubuntu). Currently managed with
[GNU Stow](https://www.gnu.org/software/stow/).

## Usage

```shell
git clone https://github.com/neitsab/dotfiles ~/.dotfiles
stow --verbose --dir=~/.dotfiles --target=$HOME [subdir1 subdir2 ...] --simulate
stow --verbose --dir=~/.dotfiles --target=$HOME --no-folding micro mpv --simulate
```

Once you are happy with the result, you can remove `--simulate` to apply the changes.

> [!Important]
> Notice the `--no-folding` option in the second invocation: I separate out some configs
> where this option is needed (currently only micro and mpv), to only link the files
> themselves instead of their containing folder, and thus avoid getting extraneous
> files/directories I don't want tracked in my repo. See
> [the manual](https://www.gnu.org/software/stow/manual/html_node/Invoking-Stow.html) for
> more information.

If you want to uninstall some configs, simply run
`stow --verbose --dir=~/.dotfiles --target=$HOME --delete <config list> [--simulate]`
*et voilà*.

> [!note]
> The `ssh` directory is a private submodule (because I'm uncomfortable putting my SSH
config on the public Internet 😁). It should just result in an empty `ssh` directory for
> anybody else (if it doesn't please let me know 😵).
