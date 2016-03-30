################################################################################
# NPM TOOL (node.js)
################################################################################

# ------------------------------------------------------------------------------
# CONFIG / UPDATE TOOL
# ------------------------------------------------------------------------------
# PAS GRAVE, c est vendor error
# npm WARN optional Skipping failed optional dependency /chokidar/fsevents:

# update latest version node with npm
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

sudo ln -sf /usr/local/n/versions/node/<VERSION>/bin/node /usr/bin/node
# /usr/bin/env: node: No such file or directory
sudo ln -s /usr/bin/nodejs /usr/bin/node
# sudo ln -sf /usr/local/n/versions/node/<VERSION>/bin/node /usr/bin/node
sudo ln -sf /usr/local/n/versions/node/5.8.0/bin/node /usr/bin/node



#
sudo npm install -g npm@latest                  # Upgrader - la version de NPM
sudo npm install -g npm-check-updates           #


# ------------------------------------------------------------------------------
# GLOBAL
# ------------------------------------------------------------------------------
sudo npm install -g bower                       # 1 - install BOWER
sudo npm install -g gulp                        # 2 - install GULP
sudo npm install -g yo                          # 3 - install YEOMAN
sudo npm install -g generator-polymer           # 4 - install YO POLYMER
sudo npm install -g polylint
sudo npm install -g polyserve


sudo npm install -g generator-meanstack
sudo npm install -g generator-express-angular

# npm install -g npm                            # Installer   la version de NPM
# sudo npm install -g mean-cli                  # creer son 1er projet MEAN
#
# global - mais a verifier utilite
# npm install -g typescript
# npm install -g tsd@^0.6.0
# npm install -g typescript@^1.5.0

# ------------------------------------------------------------------------------
# LOCAL
# ------------------------------------------------------------------------------
sudo npm install babel-core babel-preset-es2015 --save-dev


npm install     --save-dev eslint eslint-config-google
npm install     --save-dev stylelint-config-standard       # pour pouvoir linter le css (creer un fichier )
# npm install     --save-dev eslint-config-xo                # pour faire marcher le linter de starter kit
# npm install     --save-dev eslint-config-xo-space          # g crois inutile
# npm install --save-dev babel-core
