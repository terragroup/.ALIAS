
#  Copyright 2013 Manuel Gutierrez <dhunterkde@gmail.com>
#  https://github.com/xr09/rainbow.sh
#  Bash helper functions to put colors on your scripts
#
#  Usage example:
#  vargreen=$(echogreen "Grass is green")
#  echo "Coming next: $vargreen"
#

__RAINBOWPALETTE="1"

function __colortext()
{
  echo -e " \e[$__RAINBOWPALETTE;$2m$1\e[0m"
}

function rechogreen()
{
  tput rev
  echo $(__colortext "$1" "32")
}

function rechored()
{
  tput rev
  echo $(__colortext "$1" "31")
}

function rechoblue()
{
  tput rev
  echo $(__colortext "$1" "34")
}

function rechopurple()
{
  tput rev
  echo $(__colortext "$1" "35")
}

function rechoyellow()
{
  tput rev
  echo $(__colortext "$1" "33")
}

function rechocyan()
{
  tput rev
  echo $(__colortext "$1" "36")
}

# ------------------------------------------------------------------------------


function echogreen()
{
  echo $(__colortext "$1" "32")
}

function echored()
{
  echo $(__colortext "$1" "31")
}

function echoblue()
{
  echo $(__colortext "$1" "34")
}

function echopurple()
{
  echo $(__colortext "$1" "35")
}

function echoyellow()
{
  echo $(__colortext "$1" "33")
}

function echocyan()
{
  echo $(__colortext "$1" "36")
}
