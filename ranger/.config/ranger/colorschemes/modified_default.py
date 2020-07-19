"""modified_default

    LICENSE:
        GPL-3.0

    AUTHOR:
        S. Numerius

    DESCRIPTION:
        A colorscheme for the ranger console file manager
"""

from __future__ import (absolute_import, division, print_function)

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    default, normal, bold, reverse, default_colors,
)

BLACK = 0
RED = 1
GREEN = 2
YELLOW = 3
BLUE = 4
MAGENTA = 5
CYAN = 6
WHITE = 7
LIGHT_BLACK = 8
LIGHT_RED = 9
LIGHT_GREEN = 10
LIGHT_YELLOW = 11
LIGHT_BLUE = 12
LIGHT_MAGENTA = 13
LIGHT_CYAN = 14
LIGHT_WHITE = 15


class ModifiedDefault(ColorScheme):
    progress_bar_color = BLUE

    def use(  # pylint: disable=too-many-branches,too-many-statements
            self,
            context
    ):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                fg = RED
            if context.border:
                fg = BLUE
            if context.media:
                if context.image:
                    fg = YELLOW
                else:
                    fg = MAGENTA
            if context.container:
                fg = RED
            if context.directory:
                attr |= bold
                fg = BLUE
            elif context.readme:
                attr |= bold
                fg = YELLOW
            elif context.executable and not \
                    any((context.media, context.container,
                         context.fifo, context.socket)):
                fg = GREEN
            if context.socket:
                fg = MAGENTA
                attr |= bold
            if context.fifo or context.device:
                fg = YELLOW
                if context.device:
                    attr |= bold
            if context.link:
                fg = CYAN if context.good else MAGENTA
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (RED, MAGENTA):
                    fg = WHITE
                else:
                    fg = RED
            if not context.selected and (context.cut or context.copied):
                fg = BLACK
                attr |= bold
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = YELLOW
            if context.badinfo:
                if attr & reverse:
                    bg = MAGENTA
                else:
                    fg = MAGENTA

            if context.inactive_pane:
                fg = CYAN

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = RED if context.bad else GREEN
            elif context.directory:
                fg = BLUE
            elif context.tab:
                if context.good:
                    bg = GREEN
            elif context.link:
                fg = CYAN

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = CYAN
                elif context.bad:
                    fg = MAGENTA
            if context.marked:
                attr |= bold | reverse
                fg = YELLOW
            if context.frozen:
                attr |= bold | reverse
                fg = CYAN
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = RED
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = BLUE
                attr &= ~bold
            if context.vcscommit:
                fg = YELLOW
                attr &= ~bold
            if context.vcsdate:
                fg = CYAN
                attr &= ~bold

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = BLUE

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = MAGENTA
            elif context.vcsuntracked:
                fg = CYAN
            elif context.vcschanged:
                fg = RED
            elif context.vcsunknown:
                fg = RED
            elif context.vcsstaged:
                fg = GREEN
            elif context.vcssync:
                fg = GREEN
            elif context.vcsignored:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync or context.vcsnone:
                fg = GREEN
            elif context.vcsbehind:
                fg = RED
            elif context.vcsahead:
                fg = BLUE
            elif context.vcsdiverged:
                fg = MAGENTA
            elif context.vcsunknown:
                fg = RED

        return fg, bg, attr
