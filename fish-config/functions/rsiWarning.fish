# TODO: find a way to execute this automatically, instead of applying it to
# a new shell
# 25 minutes
set interval 1500
function rsiWarning --description 'Simple warning to go stretch'
	echo Script started at (date)!
	while sleep $interval
		echo Notify: (date)
		notify-send "Go stretch!" -u critical
	end
end
