"""modified_default

    LICENSE:
        GPL-3.0

    AUTHOR:
        S. Numerius

    DESCRIPTION:
        A plugin for the ranger console file manager that extends the
        functionality of the colorscheme.
"""

import ranger.gui.widgets.browsercolumn
import ranger.gui.context

OLD_HOOK_BEFORE_DRAWING = ranger.gui.widgets.browsercolumn.hook_before_drawing

ranger.gui.context.CONTEXT_KEYS.append('readme')
ranger.gui.context.Context.readme = False


def hook_before_drawing(fsobject, color_list):
    if fsobject.basename == "README.md":
        color_list.append("readme")

    fsobject, color_list = OLD_HOOK_BEFORE_DRAWING(fsobject, color_list)

    return fsobject, color_list


ranger.gui.widgets.browsercolumn.hook_before_drawing = hook_before_drawing
