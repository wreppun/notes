export CLICOLOR=1

#use brew VIM for clipboard access
alias vim="/usr/local/bin/vim"

set -o vi

#latest preview JDK 8 by Oracle
export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home

#default JDK is  7
export JAVA_HOME=$JAVA_8_HOME

# enable git unstaged indicators - set to a non-empty value
GIT_PS1_SHOWDIRTYSTATE="."

# enable showing of untracked files - set to a non-empty value
GIT_PS1_SHOWUNTRACKEDFILES="."

# enable stash checking - set to a non-empty value
GIT_PS1_SHOWSTASHSTATE="."

# enable showing of HEAD vs its upstream
GIT_PS1_SHOWUPSTREAM="auto"

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

# set the prompt to show current working directory and git branch name, if it exists

# this prompt is a cyan username, green current working directory and yellow git branch (only shows if you're in a git branch)
# unstaged and untracked symbols are shown, too (see above)
source ~/git-scripts/git-prompt.sh

# return the prompt prefix for the second line
function set_prefix {
    BRANCH=`__git_ps1`
    if [[ -z $BRANCH ]]; then
        echo "o"
    else
        echo "+"
    fi
}

PS1='${CYAN}\u${WHITE} in ${GREEN}\w${WHITE} on${YELLOW}`__git_ps1 " %s"`${WHITE}\n\[${UNDERLINE}\]`set_prefix`\[${NORMAL}\] '
