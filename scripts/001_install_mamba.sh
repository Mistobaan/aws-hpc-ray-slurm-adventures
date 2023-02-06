#!/usr/bin/env zsh

# Linux Intel (x86_64):
set -ex

export USER=$(whoami)
export MAMBA_ROOT_PREFIX=/fsx/$USER # optional, default to ~/micromamba

curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba
eval "$(./bin/micromamba shell hook -s posix)"
./bin/micromamba shell init -s zsh -p ~/micromamba  # this writes to your .bashrc file

# For now, only micromamba provides shell completion on bash and zsh.
# To activate it, it’s as simple as running:
micromamba shell install

#sourcing the bashrc file incorporates the changes into the running session.
# better yet, restart your terminal!
# source ~/.bashrc

