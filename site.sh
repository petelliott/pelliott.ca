#!/usr/bin/env bash

schng $@ -i template/ -i data/ -l src/ site/ -o build/
