#!/usr/bin/env bash

# TODO: allow compiling for an arbitrary directory? 
# - or current file?

# Compile latex files in directory
latexmk -pdf

# Clean up latex files afterwards
latexmk -c
