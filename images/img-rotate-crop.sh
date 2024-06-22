#!/bin/bash
img="$1"
filename=$(basename "$img")
basenamesinextension="${filename%.*}"
convert "$img" -fuzz 20% -bordercolor white -set option:deskew:auto-crop true -deskew 40% "$basenamesinextension"_rcrop.jpeg
