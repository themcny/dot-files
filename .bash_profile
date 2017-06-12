echo "Loading ~/.bash_profile a shell script that runs in every new terminal you open"
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.roostify/bash_profile_extensions/bash_completion"
source "$HOME/.roostify/bash_profile_extensions/colorful_git_branch"
source "$HOME/.roostify/bash_profile_extensions/rvm"
source "$HOME/.roostify/bash_profile"

# The CERT for SSL
export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem
export CLICOLOR=1
export TERM=xterm-256color

# Load git completions
git_completion_script=/usr/local/etc/bash_completion.d/git-completion.bash
test -s $git_completion_script && source $git_completion_script

# A more colorful prompt
# \[\e[0m\] resets the color to default color
c_reset='\[\e[0m\]'
#  \e[0;31m\ sets the color to red
c_path='\[\e[0;31m\]'
# \e[0;32m\ sets the color to green
c_git_clean='\[\e[0;32m\]'
# \e[0;31m\ sets the color to red
c_git_dirty='\[\e[0;31m\]'

# PS1 is the variable for the prompt you see everytime you hit enter
PROMPT_COMMAND=$PROMPT_COMMAND' PS1="${c_path}\W${c_reset}$(git_prompt) :> "'

export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '

# determines if the git branch you are on is clean or dirty
git_prompt ()
{
  # Is this a git directory?
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  # Grab working branch name
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  # Clean or dirty branch
  if git diff --quiet 2>/dev/null >&2; then
    git_color="${c_git_clean}"
  else
    git_color=${c_git_dirty}
  fi
  echo " ($git_color$git_branch${c_reset})"
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=ExGxFxdxCxDxDxaccxaeex
# Force ls to use colors (G) and use humanized file sizes (h)
alias ls='ls -Gh'

# Force grep to always use the color option and show line numbers
export GREP_OPTIONS='--color=auto'


alias rebash='source ~/.bash_profile'
alias reload_profile='. ~/.bash_profile'
alias be='bundle exec'
alias dcss='be rake db:drop; be rake db:create; be rake db:schema:load; be rake db:seed'
alias dcms='be rake db:drop; be rake db:create; be rake db:migrate; be rake db:seed'
alias roostify-root='cd Desktop/Roostify/roostify'
alias e='subl'
alias rials='rails'
alias rail='rails'
alias railss='rails server'
alias railsc='rails console'
alias sandbox='rails console --sandbox'
alias postgresup='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias vroom='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias validatexml='xmllint --noout --schema ~/Desktop/Roostify/docmagic/xsd/MISMO_3.3.0_B299.xsd ~/Desktop/dmxml.xml'
alias killalltmux="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"

# How to Get into the EC2 Box
alias intosharedbox='ssh -A nicole@52.41.132.8 -L5556:localhost:3001'
alias tmuxwkevin='tmux -S /tmp/kb1 attach-session'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
