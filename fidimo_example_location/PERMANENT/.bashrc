test -r ~/.alias && . ~/.alias
PS1='GRASS 6.5.svn (fidimo_example):\w > '
PROMPT_COMMAND="'/usr/local/grass-6.5.svn/etc/prompt.sh'"
export GRASS_ADDON_PATH=/home/radinger/.grass6/addons:/home/radinger/U_Radinger/05_GIS/04_GRASS_Scripts/r.rdfilter
export PATH="/usr/local/grass-6.5.svn/bin:/usr/local/grass-6.5.svn/scripts:/home/radinger/.grass6/addons:/bin:/usr/bin:/usr/X11R6/bin:/usr/local/bin"
export HOME="/home/radinger"
export GRASS_SHELL_PID=$$
trap "echo \"GUI issued an exit\"; exit" SIGQUIT
