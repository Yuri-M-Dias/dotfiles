# TODO: find a way to execute this automatically, instead of applying it to
# a new shell
set interval 1500
function rsiWarning --description 'Simple warning to go stretch'
	while sleep $interval
		echo "Notifyin!"
		notify-send "Go stretch!" -u critical
	end
end
