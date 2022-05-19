# Add some color
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Some variables
export FL_DYNCONFIG='/Users/jakegoldstein/employeer/dynconfig/dynconfig'
export FL_CONFIG='/Users/jakegoldstein/.employeer'
export FL_POOL="eng"

export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# cd
alias fl="cd /Users/jakegoldstein/employeer"
alias pc="cd /Users/jakegoldstein/employeer/py-services"
alias gc="cd /Users/jakegoldstein/employeer/goservices"
alias dyn="cd $FL_DYNCONFIG"
alias dc="cd /Users/jakegoldstein/employeer/data"
alias oc="cd /Users/jakegoldstein/employeer/ops"

# Go
export GOPATH="/Users/jakegoldstein/go"

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"

## Airflow
# Setup
export PATH="/Users/jakegoldstein/.pyenv/bin:$PATH:GOPATH/bin:/Users/jakegoldstein/.local/bin:"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export FLAIRFLOW_PROJECT=/Users/jakegoldstein/flipboard/py-services/apps/flairflow
alias flairflow="/Users/jakegoldstein/.pyenv/versions/.flairflow-cli/bin/flairflow"

alias build="flairflow build -c flairflow --push"
alias upgrade="flairflow deploy --upgrade"
alias purge="flairflow deploy --purge"
alias install="flairflow deploy --install"
alias bu="build --force ; upgrade"
alias install-from-scratch="purge ; build ; sleep 30 ; install"

# Docker
function docker-clean {
	containers=$(docker ps -aq)
	docker rm -f "${containers}"
}

# k8s
alias kc="kubectl --kubeconfig ~/.kube/config -n jgoldstein-dev"
alias watch="kc get pods -w"
alias pods="kc get pods"
function airlog {
	POD=$(pods | grep scheduler | cut -d ' ' -f 1)
	kc logs $POD -c airflow-scheduler
}
alias kcpurge="kubectl delete namespace jgoldstein-dev"
alias kc-dp="kc delete pods"
alias kc-dpf="kc-dp --force --grace-period=0"
alias kc-gn="kc get namespace"
alias kc-des="kc describe pod"
# Not sure that I'll ever use this. This is more so I can rememeber this command.
alias kc-node="kc get nodes -L employeer.io/airflow-subclass"

# Github
alias ga='git add'
alias gaa='git add --all'
# Adds in increments
alias gapa='git add --patch'
alias gb='git branch'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gco='git checkout'
# Change something about last commit
alias gc!='git commit -v --amend'
# Add more files to last commit
alias gcn!='git commit -v --no-edit --amend'
alias gcmsg='git commit -m'
alias gd='git diff'
alias gl='git pull'
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gp='git push'
alias grbi='git rebase -i'
alias grh='git reset'
alias head='git rev-parse HEAD'
alias gst='git status'
alias master="gcm ; gl"
alias mainb="git checkout main ; gl"
parse_git_branch() {
    gb 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h \[\033[31m\]\t \[\033[33;1m\]\w -\033[35m\]\$(parse_git_branch)\[\033[m\] \$ \n\$ "

# Python things
alias poem="CFLAGS=\"-I/usr/local/include -I/usr/local/opt/openssl@1.1/include\" LDFLAGS=\"-L/usr/local/lib -L/usr/local/opt/openssl@1.1/lib\" poetry install --no-root"
alias ca="PYENV_VERSION=emr aws codeartifact login --tool pip --repository python --domain flpython --domain-owner $(DOMAIN_NUMBER)"

# Data Base
alias db="pg_ctl -D /usr/local/var/postgres"

# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash" || true

export PATH="$HOME/.poetry/bin:$PATH"
