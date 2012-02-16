#Run for login shells to setup one time
#variables
if [[ $SHLVL = 1 ]]; then
    export PATH=$PATH:.:/opt/local/bin:/opt/local/sbin
    export MANPATH=/opt/local/share/man:$MANPATH
fi


export LS_COLORS="ow=01;90:di=01;90"
export EDITOR='vim'

