#!/bin/bash

## create thumbnails from svg's
for f in ../svgs/*.svg
do
	fullname=$f
	basename=$(basename $fullname)
	name=${basename%.*}
	convert -resize 200x $fullname ../thumbnails/$name.png
done 

## create README.md from golang template
python -c 'import os, json; directory = {"files":""}; directory["files"]=os.listdir("../thumbnails"); print json.dumps(directory)'  | ./gomplate_linux-amd64 -d directory=stdin:///in.yaml --file README.md.tpl -o ../README.md
