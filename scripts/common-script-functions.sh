#!/bin/bash

set -e

function gitCloneIfNecessary {
	[ ! -e $2 ] && echo "Cloning $1 into $2" && git clone "$1" "$2"
}
