#!/usr/bin/env bash

# Compile latex files in directory
# Compiles on file save
alias ltcl="latexmk -pvc --silent"

# Clean up latex files afterwards
latexmk -c
