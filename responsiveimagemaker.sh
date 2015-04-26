#!/bin/bash

# To run for whole folder type below in the command line, imgcnv should reside 
# in the folder
# for i in $(ls); do ./imgcnv $i; done
echo $1

if [ "$1" == "imgcnv.sh" ] 
	then
		echo "good"
		exit
fi
# ImageMagick Size Conversion - adjust sizes to your liking
convert $1 -strip -resize 75% xlarge.$1
convert $1 -strip -resize 54% large.$1
convert $1 -strip -resize 33% medium.$1
convert $1 -strip -resize 25% small.$1
# Rename original file to xxlarge
cp $1 xxlarge.$1
# Run PNG optimization, assuming these are PNG of course
# Note that these are set at the highest optimization, 
# meaning they will run ALL available trials. For larger images and image sets 
# it may take a while 
# Adjust as necessary
optipng -o7 -zm1-9 -strip all xlarge.$1
optipng -o7 -zm1-9 -strip all large.$1
optipng -o7 -zm1-9 -strip all medium.$1
optipng -o7 -zm1-9 -strip all small.$1
optipng -o7 -zm1-9 -strip all xxlarge.$1
