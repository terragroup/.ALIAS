//##############################################################################
# 
#                                   DIVERS ?
# 
##############################################################################//

# ------------------------------------------------------------------------------
# UPDATE LATEST VERSION - https://github.com/tjunnone/npm-check-updates
# ------------------------------------------------------------------------------

ncu
ncu -u                              # Upgrader    la version de PACKAGE.json
ncu -m bower                        # Upgrader    la version de BOWER


npm install npm@latest -g           # Upgrader    la version de NPM
npm install -g npm-check-updates    # 
# npm install npm -g                  # Installer   la version de NPM

# PAS GRAVE, c est vendor error
# npm WARN optional Skipping failed optional dependency /chokidar/fsevents:

################################################################################
# PYTHON
################################################################################
python -m SimpleHTTPServer 8080
or with Python 3 python -m http.server 8080)


################################################################################
# GULP
################################################################################
gulp serve

# reload les modifs des .js
gulp.watch(['app/**/*.js'], reload);


################################################################################
# BOWER
################################################################################
# bower init
bower install   polymerelements/<element-name>
bower install   google-map
bower install   --save sw-toolbox








################################################################################
# NPM TOOL (node.js)
################################################################################

# ------------------------------------------------------------------------------
# LINTER - local : --save-dev ==> SAUVEGARDE DANS PACKAGE.JSON
# ------------------------------------------------------------------------------
npm install     --save-dev eslint eslint-config-google
npm install     --save-dev stylelint-config-standard


# divers
npm install     stylelint-config-standard       # pour pouvoir linter le css (creer un fichier )
npm install     --save-dev eslint-config-xo     # pour faire marcher le linter de starter kit
npm install     --save-dev eslint-config-xo-space # g crois inutile



# ------------------------------------------------------------------------------
# BASE TOOL NODE - curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -
# ------------------------------------------------------------------------------
# apt-get install nodejs    # 1 - install NODE
# apt-get install npm       # 2 - install NPM

# global
npm install -g BOWER        # 3 - install BOWER
npm install -g GULP         # 4 - install GULP
npm install -g mean-cli     # creer son 1er projet MEAN

# ------------------------------------------------------------------------------
# Z
# ------------------------------------------------------------------------------

# global - mais a verifier utilite
npm install -g typescript
npm install -g tsd@^0.6.0
npm install -g typescript@^1.5.0
# npm install gulp-sass -- -dev ??
# tsd install angular2 es6-promise rx rx-lite
npm install polyserve -g
npm install -g yo
npm install -g generator-polymer
npm install -g yo
npm install -g <generator-name>
npm install -g generator-meanstack
npm install -g generator-express-angular

################################################################################
# ALGORITHME
################################################################################
algorithme du sac a dos

################################################################################
# TESTS JAVA
################################################################################
imdv > test > java > fr
click droit sur JAVA > debug ALL TEST


################################################################################
# SHELL
################################################################################
# bash color prompt
https://github.com/powerline/powerline

# zsh cool
https://github.com/robbyrussell/oh-my-zsh


################################################################################
# GCLOUD
################################################################################
# web starter kit + GAE
gcloud auth login


################################################################################
# YEOMAN
################################################################################
mkdir -p my-project && cd $_
yo meanstack

