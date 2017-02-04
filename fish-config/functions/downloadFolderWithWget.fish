set DESCRIPTION "Attepts to download an entire FTP folder using WGET"
#TODO: parameters?
function downloadFolderWithWget --description $DESCRIPTION
	#TODO: make this more organized
	set -x WGET_DOWNLOAD_EXCLUDE "-R \"$argv[1]\""
	set -x WGET_DOWNLOAD_URL "$argv[2]"
	set WGET_OPTIONS_BASE "--no-parent"
	set WGET_OPTIONS $WGET_OPTIONS_BASE
	set WGET_DATE_LOG "-owget-output-"(date +%s)".log"
	if test (count $argv) -gt 2
		set WGET_CONTINUE_DOWNLOAD "-vrbNm"
	else
		set WGET_CONTINUE_DOWNLOAD "-vrNm"
	end
	#TODO:Check if FTP
	wget $WGET_DOWNLOAD_EXCLUDE $WGET_DATE_LOG $WGET_OPTIONS $WGET_CONTINUE_DOWNLOAD $WGET_DOWNLOAD_URL
end
