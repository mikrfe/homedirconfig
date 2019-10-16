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
$oCoRe = @{
	RCol = "$ESC[0m"
	Red = "$ESC[0;31m"
	Gre = "$ESC[0;32m"
	BYel = "$ESC[1;33m"
	BBlu = "$ESC[1;34m"
	Pur = "$ESC[0;35m"
}
