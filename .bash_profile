# Add `~/bin` to the `$PATH`
export PATH="/usr/local/bin:$HOME/bin:/usr/bin:$PATH"

export CLICOLOR=1

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/dotfiles/.{path,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
# shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Load RVM into a shell session *as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# z-script
. $HOME/z/z.sh

# Git completion
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
   . /usr/local/etc/bash_completion.d/git-completion.bash
   PS1='\h:\W$(__git_ps1 "\[\e[0;35m\](%s)")\[\e[0;39m\] \u\$ '
fi

if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
   . /usr/local/etc/bash_completion.d/git-prompt.sh
fi