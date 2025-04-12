# system aliases
alias src="source $HOME/.zshrc"
alias reload="source $HOME/.zshrc"
alias r="echo 'uh oh'" # this is to overwrite danderous r command which repeats last command

# edit oh-my-zsh stuff on vs-code
alias edz="c /Users/hydenpolikoff/.zshrc && c /Users/hydenpolikoff/.p10k.zsh && c /Users/hydenpolikoff/.oh-my-zsh/custom/aliases.zsh"

##############################################################################
### system utils stuff

# copy path to clipboard with cpath and remove the trailing endline character
alias cpath="pwd | tr -d '\n' | pbcopy"

# pipe output to nn to copy to clipboard without endline character
alias nn="tr -d '\n' | pbcopy"

# use htop from npm instead of top
alias top="htop"

# setting battery charge limits faster
alias write100="sudo bclm write 100"
alias write80="sudo bclm write 80"
alias readbc="bclm read"

### CLI tool stuff
alias t="tmux"
alias li="linode-cli"
alias vi="nvim"
alias vim="nvim"
alias ovim="vim"


# use exa when doing ls and tree things
alias ls="eza --icons" # regular ls command with icons
alias lsa="eza --icons --all --long --git --header --colour-scale" # list all files
alias lsi="eza --icons --all --long --git --header --colour-scale --git-ignore" # list all files excluding gitignored files
alias lss="eza --icons --all --long --group-directories-first --colour-scale" # list all files excluding gitignored files sorted directories first
alias lsd="eza --icons --all --long --only-dirs --colour-scale" # list only directories
alias lsdi="eza --icons --all --long --only-dirs --colour-scale --git-ignore"
# alias lsf="exa --icons --all --long --only-files --colour-scale" # want to only list files
alias tree='eza --icons --all --long --git --tree --ignore-glob=".git"'
alias treei='eza --icons --all --long --git --tree --git-ignore --ignore-glob=".git"' # print tree excluding gitignored files
alias trees='eza --icons --all --tree --git-ignore --ignore-glob=".git"' # print tree excluding gitignored files + JUST files, no perms
alias lsr="eza --icons --recurse"

##############################################################################
### navigation stuff

# Open the current directory in a Finder window
alias ofd='open_command $PWD'

# dev nav
alias dv="cd /Users/hydenpolikoff/development"

alias ds="cd /Users/hydenpolikoff/Desktop"
alias dl="cd /Users/hydenpolikoff/Downloads"

# school nav
alias dvs="cd /Users/hydenpolikoff/development/school"

# project navs
alias dvp="cd /Users/hydenpolikoff/development/projects"
alias lrn="cd /Users/hydenpolikoff/development/learnings"


##############################################################################
### homebrew things

# brew aliases
alias b="brew"
alias bi="brew install"
alias bl="brew list"
alias bs="brew services"
alias bsl="brew services list"
alias bic="brew install --cask"
alias buu="brew update && brew upgrade"

# x86 things
alias x86="arch -x86_64"
# use the x86 brew
alias ibrew="arch -x86_64 /usr/local/bin/brew"
alias ib="arch -x86_64 /usr/local/bin/brew"
alias ibs="arch -x86_64 /usr/local/bin/brew services"
alias ibsl="arch -x86_64 /usr/local/bin/brew services list"



##############################################################################
### development stuff
alias c="code ."

### git aliases
# copy the current branch name to the clipboard without the newline character
alias gbc="git rev-parse --abbrev-ref HEAD | nn"

# switch branches with fuzzy - this is sorted 30 branches with the most recent at the top
# source https://github.com/junegunn/fzf/wiki/examples#git
gcof() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

gcofa() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# python stuff
alias p="python3"
alias va="source env/bin/activate"
alias da="deactivate"
alias juno="jupyter notebook"

# Rails alias
alias rls="rails"
alias rlsdbm="rails db:migrate"
alias rlsdbmT="rls db:migrate RAILS_ENV=test"
alias be="bundle exec"

# node stuff
alias rns="npx react-native start"
alias rnri="npx react-native run-ios"
alias y="yarn"
alias ys="yarn start"
alias yri="yarn run ios"

# docker stuff
alias lzd='lazydocker'

# Access IP's
alias myip="echo 'wifi IP: $(Ipconfig getifaddr en0)\nethernet IP: $(Ipconfig getifaddr en1)'"

# gcp alias
alias gcp="gcloud"
