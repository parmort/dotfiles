# My Dotfiles...

## And How I Manage Them

If you've used Unix programs for any sort of time, you know that keeping track
of them with a VCS is very difficult and tedious. I've tried a few methods, from
manually symlinking them into my home directory to using
[Thoughtbot's rc][1]. I think I've found one that
works for me: [GNU Stow][2].

[1]: https://github.com/thoughtbot/rcm
[2]: https://www.gnu.org/software/stow

All you do is put your dotfiles as they would appear relative to your home
directory in folders separated by program. Then you would run `stow */` to
install them and `stow -D */` to uninstall them. The `*/` in those commands can
be substituted with any of the subdirectories you choose, `*/` is just a
wildcard to select all subdirectories.

***Hint:*** *Use `gal s` to see all stow aliases once the zsh configs have been
installed.*

## And a Few Notes on Them

I wrote a small script to help manage my plugins. Run `./plugs alias` to alias
it to the repo's local config, making `git plugs ...` work in this repo.

I used to keep all of my configs, even if I wasn't using the program. Now, I get
rid of all of my unused configs. If you want to take a look at them, here's a
list of my unused configs in their final forms:

- [AwesomeWM][7344e69]
- [HerbstluftWM][7344e69]
- [i3][7344e69]
- [Random JS configs][7344e69]
- [mpd][7344e69]
- [mutt][7344e69]
- [ncmpcpp][7344e69]
- [ranger][7344e69]
- [Random Ruby configs][7344e69]
- [taskwarrior][7344e69]
- [termite][7344e69]
- [urlview][7344e69]

[7344e69]: https://github.com/parmort/dotfiles/tree/7344e69247384a98138cd072f3c224f8c3bf5fd3~1

## And Their License

These dotfiles are represented under the [DWTFYWWI License][3].

[3]: https://github.com/parmort/DWTFYWWI

Copyright (c) 2018&ndash;2020 N. Prochnau. No rights reserved.
