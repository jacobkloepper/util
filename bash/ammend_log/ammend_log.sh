#!/usr/bin/bash
val=$(cat "log.txt")
arg="${1--1}" # use first arg if exists, else default -1.

newval=$((val + arg))
echo "$val -> $newval"
echo "$newval" > "log.txt"