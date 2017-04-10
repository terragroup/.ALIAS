################################################################################
# BOWER
################################################################################


# bower init
bower install   polymerelements/<element-name>
bower install   google-map
bower install   --save sw-toolbox

# ------------------------------------------------------------------------------
# 2 - UPDATE LATEST VERSION DEPENDENCY              - https://github.com/tjunnone/npm-check-updates
# ------------------------------------------------------------------------------
ncu
ncu -u                              # Upgrader    la version de PACKAGE.json
ncu -m bower                        # Upgrader    la version de BOWER
