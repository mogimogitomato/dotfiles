#!/bin/sh
function getFortuneVersion() {
  eval $1=`brew list --formula --versions | grep fortune | sed 's/fortune //g'`
}

function getCowsayVersion() {
  eval $1=`brew list --formula --versions | grep cowsay | sed 's/cowsay //g'`
}

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

getFortuneVersion FORTUNE_VERSION
getCowsayVersion COWSAY_VERSION

cp -i $SCRIPT_DIR/.fortune/meigen "/usr/local/Cellar/fortune/${FORTUNE_VERSION}/share/games/fortunes"
cp -i $SCRIPT_DIR/.fortune/meigen.dat "/usr/local/Cellar/fortune/${FORTUNE_VERSION}/share/games/fortunes"
cp -i $SCRIPT_DIR/.cowsay/lain.cow "/usr/local/Cellar/cowsay/${COWSAY_VERSION}/share/cows"
cp -i $SCRIPT_DIR/.cowsay/mojo.cow "/usr/local/Cellar/cowsay/${COWSAY_VERSION}/share/cows"
