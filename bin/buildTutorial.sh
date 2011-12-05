#!/bin/bash

# Loop over tutorial content directory and generate HTML pages
# With Table of Contents (TOC), as HTML5, using particular CSS
# and a particular page template

PRESENT_DIR=`pwd`
CONTENT_DIR=$PRESENT_DIR/../content
WEB_DIR=$PRESENT_DIR/../
TEMPLATE_DIR=$PRESENT_DIR/../templates
TUTORIAL_DIR=$PRESENT_DIR/../tutorial
TUTORIAL_CONTENT_DIR=$TUTORIAL_DIR/content

for file in $TUTORIAL_CONTENT_DIR/*
do
  # remove extension from the file
  FILESNIP=`basename $file | cut -f 1 -d \.`
  # convert the mdown file to html
  pandoc -f markdown -t html --standalone --html5 --toc --template=$TEMPLATE_DIR/tutorial-page.html  --css=../styles/tutorial.css $file > $TUTORIAL_DIR/$FILESNIP.html
done