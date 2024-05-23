#!/usr/bin/env bash

# get argument
if [ $# -eq 0 ]; then
  echo "Usage: $0 <color_code>"
  exit 1
fi

color_code=$1

# translate color_code to RGB
red=$((color_code & 0xFF))
green=$(((color_code >> 8) & 0xFF))
blue=$(((color_code >> 16) & 0xFF))

# export RGB
echo "RGB($red,$green,$blue)"

# translate RGB to hex
hex_red=$(printf "%02X" $red)
hex_green=$(printf "%02X" $green)
hex_blue=$(printf "%02X" $blue)

# export hex by #FFFFFF format
echo "#$hex_red$hex_green$hex_blue"
