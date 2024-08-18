#!/bin/bash

# Colors and styles
Green='\033[0;32m'
Blue='\033[0;34m'
ColorReset='\033[0m'
bold=$(tput bold)
normal=$(tput sgr0)

echo -e "${Blue}${bold}Script to create new Jekyll posts easily.${normal}${ColorReset}"

# The post directory
#POSTS_DIR=$HOME'/haruniv.github.io/_posts/'
POSTS_DIR=$HOME'/haruniv.github.io/_posts/'

# Post title
# Trim leading spaces
read -p "${bold}Title:${normal} " TITLE
TITLE="$(echo "${TITLE}" | sed -e 's/^[ \t]*//')"

# Date
DATE=$(date +%Y-%m-%d)

# Post extension
EXT='.md'

# File name
read -p "${bold}Filename:${normal} " FILENAME

# File name should be lowercase
FILENAME=$(tr A-Z a-z <<<$FILENAME)
FILENAME=${DATE}-${FILENAME}${EXT}

# Go to _posts and create a file
cd ${POSTS_DIR}
touch ${FILENAME}

# Add YAML front matter and excerpt space
tee -a $FILENAME >/dev/null <<END
---
layout: post
title: ${TITLE}
tags: []
category:
aside:
  toc: true
show_category: true
---
<!--more-->
END

echo -e "${Green}${bold}File was successfully created!
❯${ColorReset}${normal} ${POSTS_DIR}${FILENAME}"

