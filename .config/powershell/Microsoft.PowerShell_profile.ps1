function are_we_gd {
	($env:GIT_DIR).StartsWith("${env:HOME}/.gd")
}
function gd_enter {
	$env:GIT_DIR = "${env:HOME}/.gd"
	$env:GIT_WORK_DIR = "${env:HOME}"
}
function gd {
	env GIT_DIR="${env:HOME}/.gd" GIT_WORK_DIR="${env:HOME}" git @Args
}
function ls { get-childitem @args }
function lsa { get-childitem -attributes hidden,!hidden @args }
$ESC = [char]27
function prompt {
	$local:path = $executionContext.SessionState.Path.CurrentLocation
	$promptsigns = ('>' * ($nestedPromptLevel + 1))
	"$ESC[0;31m$(hostname):$ESC[0;35m$path$ESC[1;37m$promptsigns $ESC[0m"
}
