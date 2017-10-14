#!/bin/bash

set -e

gitCloneIfNecessary()
{
	if [ ! -e $2 ]; then
		echo "Cloning $1 into $2" 
			git clone "$1" "$2"
			fi
}
