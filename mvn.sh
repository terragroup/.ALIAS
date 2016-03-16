#!/bin/bash
################################################################################
# MVN
################################################################################

################################################################################
# VARIABLE
################################################################################
        MVN_SEPARATOR=",\serrors|,\sfailures|.*\-\-\-.*|webapp|war|module|classe"
    MVN_KEYWORD_CYCLE="\-release\-|\-deploy\-|\-package\-|\-clean\-|\-jar\-|\-war\-|\-resources\-|\-compiler\-|gwt\-|\-surefire\-|\-assembly\-|goals|\-source\-|\-javadoc\-|\-install\-"             # 'clean verify' |'Reactor Summary:' |\[INFO\] Scanning for projects\.\.\.
  MVN_KEYWORD_SUCCESS="succès|successfully|succeeded|success|fine"      #|0ms

# '\ in\ '|'but was'|
  MVN_KEYWORD_FAIL="fake|SMTP|\->|unchecked|unsafe|problems|missing|deprecated|assertionerror|error|failure!|failure|failed|onfail|fail|fatal|cannot|not|unable|null|java\.util\.NoSuchElementException|NoSuchElement|Exception|java.net.BindException:"  #|'Address already in use'
  MVN_KEYWORD_WARN="expected|warning|warn|recompile"
   MVN_KEYWORD_ING="linking|executing|generating|marking|handling|registering|attaching|configuring|forking|expecting|recompiling|compiling|building|deleting|installing|trying|checking|copying|skipped|skip|using|encoding|Computing|Rebinding|Invoking|scanning|reading|running|run|Packaging|naming|assuming|setting|searching|assembling|processing|dropping|creating"
    MVN_KEYWORD_ED="generated|enabled|redifined|defined|got|executed|acquired|named|found|filtered|loaded|detected|time|finished|assembled|aquired|released|tests"
# 'Native\ method'|'at\ '
MVN_PATH_EXTENSION="java|net|~|test|<|>|\/home\/axel\/com\/atn_v2\/|/src/main/java|com\.groupemre\.atnv2|\\.java|javax\.|xml|\\.|:"
MVN_OTHER="address\salready\sin\suse|UUID|fakeftpserver|main|system|donnees|MARK_RAN|permutation|structure\\.xml|property|META-INF|file|descriptor|target|thread|command|object|schema|table|postgresql|h2|profile|results|testsuite|AM|PM|<<<|changeset" #'at '|'but was'|"

MVN_ALL="\
$MVN_KEYWORD_WARN \
$MVN_KEYWORD_ING \
$MVN_KEYWORD_ED \
$MVN_PATH_EXTENSION \
$MVN_SEPARATOR \
$MVN_KEYWORD_CYCLE \
$MVN_KEYWORD_FAIL \
$MVN_KEYWORD_SUCCESS \
$MVN_OTHER"

################################################################################
# FAST COMPILE
################################################################################

# ATTENTION : j ai laisse le PROFILE de atn (useless dans les autres projets)
alias   c='mvn clean install -U -Dgpg.skip=true    -P Atnv2_Local,gwt-dev,resources-dev   -DskipTests  2>&1     | h -i $MVN_ALL'
alias  ct='mvn clean install -U -Dgpg.skip=true    -P Atnv2-TU,gwt-dev,resources-dev                   2>&1     | grep -v "DATABASECHANGELOG|executed|changeset|expected\ postgresql,\ got\ h2|Successfully\ released\ change\ log\ lock|Successfully\ acquired\ change\ log\ lock"   |  h -i $MVN_ALL'

# AUTRE MRE (attention, existe profile LIQUIBASE)
alias  cf='cd /home/axel/com/atnv2/frontend    && mvn clean install -U -P Atnv2_Local,gwt-dev,resources-dev -DskipTests  2>&1        | h -i $MVN_ALL        && cd ..'

alias  cr='cd /home/axel/com/atnv2/multirouter && mvn clean install -U -P Atnv2_Local,gwt-dev,resources-dev -DskipTests  2>&1        | h -i $MVN_ALL        && cd ..'
alias  cb='cd /home/axel/com/atnv2/backend     && mvn clean install -U -P Atnv2_Local,gwt-dev,resources-dev -DskipTests  2>&1        | h -i $MVN_ALL        && cd ..'
alias cbt='cd /home/axel/com/atnv2/backend     && mvn clean install -U -P Atnv2-TU,gwt-dev,resources-dev                 2>&1        | h -i $MVN_ALL        && cd ..'
alias  cm='cd /home/axel/com/atnv2/model       && mvn clean install -U -P Atnv2_Local,gwt-dev,resources-dev -DskipTests  2>&1        | h -i $MVN_ALL        && cd ..'
alias  ccc='cr && cb && cm'

# MVN TEST UNITAIRE
alias cbu='cd /home/axel/com/atnv2/backend     && mvn clean install -P Atnv2_TU,gwt-dev,resources-dev -Dsurefire.useFile=false -Dtest=DemandeLogServiceTest#test_purge_demande_de_log test       2>&1     |   && cd ..'
# -Dsurefire.useFile=false
alias   cc='mvn clean install -Dtest=ParseurTest#testParse test       2>&1  |  h -i $MVN_ALL'
