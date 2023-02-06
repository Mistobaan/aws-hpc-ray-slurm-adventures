#!/bin/bash
set -ex

export USER=$(whoami)
export NGROK_URL=https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz

wget  -c -nc -v $NGROK_URL
# wget is a command-line tool used to download files from the internet.
# -q is an option that tells wget to run in "quiet" mode, which reduces the amount of output displayed on the screen.
# -c is an option that tells wget to continue downloading a file that was previously interrupted.
# -nc is an option that tells wget not to download a file if a local copy of the same file already exists.
# $NGROK_URL is a variable that contains the URL of the file that you want to download.

tar xvzf ngrok-v3-stable-linux-amd64.tgz -C /fsx/$USER/micromamba/condabin
 
