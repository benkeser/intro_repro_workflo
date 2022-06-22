#! /bin/bash

REPO_NAME=intro_repro_workflo

# switch to a new temporary branch
cd ..
mkdir build_dir
cd build_dir
git clone -b master https://github.com/benkeser/$REPO_NAME
cd $REPO_NAME
export TRAVIS_BUILD_DIR=$(pwd)

# run website/_build.sh 
website/_build.sh

# run website/_deploy.sh local
website/_deploy.sh local

# rm build_directory
rm -rf ../../build_dir