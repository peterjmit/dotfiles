#!/bin/sh

git submodule init
git submodule update

rsync -av --exclude '.git'  home/ ~
