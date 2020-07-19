# My Dotfiles...

## And How I Manage Them

If you've used Unix programs for any sort of time, you know that keeping track of
them with a VCS is very difficult and tedious. I've tried a few methods, from
manually symlinking them into my home directory to using
[Thoughtbot's rc][1]. I think I've found one that
works for me: [GNU Stow][2].

[1]: https://github.com/thoughtbot/rcm
[2]: https://www.gnu.org/software/stow

All you do is put your dotfiles as they would appear relative to your home
directory in folders separated by program. Then you would run `stow */` to
install them and `stow -D */` to uninstall them. The `*/` in those commands can
be substituted with any of the subdirectories you choose, `*/` is just a wildcard
to select all subdirectories.

***Hint:*** *Once `oh-my-zsh` is installed, you can use aliases from a stow
plugin! With my config aliases, type `gal s` and the aliases should pop up*

## And a Few Notes on Them

I used to keep all of my configs, even if I wasn't using the program. Now, I get
rid of all of my unused configs. If you want to take a look at them, here's a list
of my unused configs in their final forms:

- [AwesomeWM][796ab5c]
- [HerbstluftWM][796ab5c]
- [i3][796ab5c]
- [Random JS configs][796ab5c]
- [mpd][796ab5c]
- [mutt][796ab5c]
- [ncmpcpp][796ab5c]
- [polybar][796ab5c] (I now keep polybar configs with my WM configs)
- [ranger][796ab5c]
- [Random Ruby configs][796ab5c]
- [taskwarrior][796ab5c]
- [termite][796ab5c]
- [urlview][796ab5c]

[796ab5c]: https://github.com/parmort/dotfiles/commit/796ab5c5ecc33461dc995a3abf103c3ef6b98b14

## And Their License

These dotfiles are represented under the [DWTFYWWI License][3].

[3]: https://github.com/parmort/DWTFYWWI

Copyright (c) 2018-2019 N. Prochnau. No rights reserved.
