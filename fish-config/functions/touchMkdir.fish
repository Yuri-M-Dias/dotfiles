function touchMkdir --description 'Make all directories for that touch command'
	echo $1
	# Need to strip the filename
	mkdir -p $1
	touch $1
end
