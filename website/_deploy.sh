#! /bin/bash

REPO_NAME=intro_repro_workflo

mkdir $REPO_NAME
git clone -b gh-pages \
  https://github.com/benkeser/$REPO_NAME \
  $REPO_NAME

# remove contents from existing gh-pages branch
cd $REPO_NAME
git rm -rf *
echo "All files in /$REPO_NAME after git rm"
ls -l 
# replace with contents from master branch /website
cp -r ../website/* ./
# move tmp_lectures and tmp_homeworks in and rename
cp -r ../lectures ./
cp -r ../homework ./

echo "All files in /$REPO_NAME after copies"
ls -l 
ls -l lectures
ls -l homework

COMMIT_MESSAGE="update the website."
git add --all *
git commit -m "${COMMIT_MESSAGE}"
git push -q origin gh-pages