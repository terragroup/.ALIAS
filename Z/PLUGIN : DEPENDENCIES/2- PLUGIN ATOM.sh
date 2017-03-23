//##############################################################################
#
#                                   ATOM
#
##############################################################################//

# ------------------------------------------------------------------------------
# SHORTCUT + PLUGIN DE BASE
# ------------------------------------------------------------------------------
 (KEYMAP.CSON)
'atom-workspace atom-text-editor:not([mini])':
  'ctrl-k m': 'quick-highlight:toggle'
  'ctrl-k M': 'quick-highlight:clear'

'atom-text-editor':
  'ctrl-alt-f': 'atom-beautify:beautify-editor'

CTRL + SHFT + P                 # open command pallette
CTRL + SHFT + S                 # TOUS LES SNIPPETS de LA PAGE

ctrl +alt + m   : selecteionne inner bracket
ctrl + m        : next brace


# GIT-DIFF : CORE ; FAIRE SETTING ET AJOUTER 'show icons in editor gutter'

apm install duplicate-removal
'ctrl-alt-r': 'duplicate-removal:toggle'


# ------------------------------------------------------------------------------
# 2017  - INSTALL
# ------------------------------------------------------------------------------

seti-ui-red
pigments
minimap-highlight-selected
highlight-selected
minimap
monokai-seti
seti-ui
//https://www.sitepoint.com/10-essential-atom-add-ons/





# ------------------------------------------------------------------------------
# LINTER
# ------------------------------------------------------------------------------
apm install linter              # root plugin linter                -- obligatoire
apm install linter-eslint       # lintezr js // avec webstarterkit  -- obligatoire
apm install linter-stylelint    # linter css                        -- obligatoire
apm install linter-htmlhint
apm install linter-polymer

# apm install polymer-atom        # linter polymer
# apm install polymerjs-snippets  # https://atom.io/packages/polymerjs-snippets

# apm install jscs              # ?
# apm install jshint            # ?
#
# doc linter
# ------------
# linter js style guide        https://atom.io/packages/linter-eslint
# format style guide           https://atom.io/packages/linter-jscs
# react pour autocomplete ?    https://atom.io/packages/react
# ------------------------------------------------------------------------------
# SNIPPETS
# ------------------------------------------------------------------------------
apm install atom-polymer        # autocomplete POLYMER Rob
apm install Atom-PolymerSnippets
apm install tern.js             # SUPER : AUTOCOMPLETE JS - Adds support for ES5, ES6 (JavaScript 2015)...
                                # ...Node.js, jQuery, Angular and more
                                # https://atom.io/packages/atom-ternjs
                                #
                                # ctrl + alt + shift + D = GO TO DEFINITION FUNCTION ++++
                                # ctrl + alt + shift + E = FIND references
                                # ctrl + alt + shift + Z = back from definition
                                # ctrl + alt + shift + C = rename variable
                                # alt + o : show doc
# ------------------------------------------------------------------------------
# REF
# ------------------------------------------------------------------------------
apm install quick-highlight     # CTRL + K m ou M                               apm install higlighter
apm install atom-beautify       # CTRL + SHFT + L                               format (beautify)

apm install color-picker        # ctrl + shift + c                              Changer la couleur dans atom


# apm install markdown-preview  # CTRL + SHFT + m                               voir le html html preview  !!!
# apm install preview-plus      #                                               idem preview html
# apm install autocomplete-plus # pas besoin installe (core atom)

apm install advanced-open-file  # ctrl + alt + o                                fast open file
apm install fuzzy-finder        # CTRL + t                                      fast openfind file
apm install pigments            # color
apm install minimap
apm install terminal-plus
apm install seti-ui             # voir icon sexy js et autre
apm install autosave            # autosave when change focus                    +++ il faut aller ds settings pour l activerat
apm install jsdoc               # break sur last v
# ------------------------------------------------------------------------------
# THEME
# ------------------------------------------------------------------------------
# apm install atom-material-ui
# apm install atom-material-syntax
# apm install material-ui
# ------------------------------------------------------------------------------
# AUTRES
# ------------------------------------------------------------------------------
# apm install atom-typescript
# apm install color-picker
# apm install javascript-snippets
# apm install autocomplete-html
# apm install autoprefixer
# apm install symbols-view
# apm install bracket-matcher
# apm install script
# apm install bookmarks
# ------------------------------------------------------------------------------
# JAVA
# ------------------------------------------------------------------------------
apm install script
apm install linter-javac
apm install language-java
apm install debugger
