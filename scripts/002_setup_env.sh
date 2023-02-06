#!/bin/bash

micromamba activate  # this activates the base environment
micromamba create python=3.8 jupyter ipykernel -c pytorch -c nvidia -c conda-forge -n py-38-torch
micromamba activate py-38-torch
