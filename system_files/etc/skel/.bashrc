# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
# ENVIRONMENT VARS
export PATH="${HOME}/.bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/Scripts:${PATH}"
export PATH="${HOME}/go/bin:${PATH}"
export PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"
export BAT_PAGER="less -FRX"
export BAT_STYLE="plain"
export EDITOR="vim"
export MANPAGER="less -FRX"
export MANPATH="/usr/share/man:/usr/local/share/man"
export MANWIDTH=88
export PAGER="less -FRX"
export ANSIBLE_NO_COWS=1
export SYSTEMD_PAGER=

### ALIASES / FUNCTIONS
alias sc-enable='sudo systemctl enable'
alias sc-enable-now='sudo systemctl enable --now'
alias sc-start='sudo systemctl start'
alias sc-restart='sudo systemctl restart'
alias sc-stop='sudo systemctl stop'
alias sc-disable='sudo systemctl disable'
alias sc-disable-now='sudo systemctl disable --now'
alias sc-list-svc='sudo systemctl list-units --type=service'
alias sc-list-timers='sudo systemctl list-timers'
alias sc-list-sockets='sudo systemctl list-sockets'
alias sc-cat='sudo systemctl cat'
alias sc-edit='sudo systemctl edit'
alias sc-daemon-reload='sudo systemctl daemon-reload'
alias sc-reload='sudo systemctl reload'
alias sc-status='sudo systemctl status'
alias scu-enable='systemctl --user enable'
alias scu-enable-now='systemctl --user enable --now'
alias scu-start='systemctl --user start'
alias scu-restart='systemctl --user restart'
alias scu-stop='systemctl --user stop'
alias scu-disable='systemctl --user disable'
alias scu-disable-now='systemctl --user disable --now'
alias scu-list-svc='systemctl --user list-units --type=service'
alias scu-list-timers='systemctl --user list-timers'
alias scu-list-sockets='systemctl --user list-sockets'
alias scu-cat='systemctl --user cat'
alias scu-edit='systemctl --user edit'
alias scu-daemon-reload='systemctl --user daemon-reload'
alias scu-reload='systemctl --user reload'
alias scu-status='systemctl --user status'
alias jc-f='sudo journalctl -f'
alias jc-fu='sudo journalctl -f -u'
alias jc-xeu='sudo journalctl -xeu'
alias jcu-f='journalctl --user -f'
alias jcu-fu='journalctl --user -f -u'
alias jcu-xeu='journalctl --user -xeu'
alias ts='sudo tailscale status'
alias fw='sudo firewall-cmd'
alias fwp='sudo firewall-cmd --permanent'
alias fwr='sudo firewall-cmd --reload'
alias fwrp='sudo firewall-cmd --runtime-to-permanent'

if command -v lsd >/dev/null; then
    alias ls='lsd'
    alias la='lsd -a'
    alias lal='lsd -al'
    alias ll='lsd -l'
else
    alias ls='ls --color=auto'
    alias la='ls -a'
    alias lal='ls -al'
    alias ll='ls -l'
fi

if command -v batman >/dev/null; then
    alias man='batman'
fi

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ga='git add'
alias gcmsg='git commit -m'
alias gd='git diff'
alias gl='git pull'
alias gp='git push'
alias grbi='git rebase -i'
alias grm='git remove'
alias grv='git remote -v'
alias gst='git status'

rsrc() {
    cd "${HOME}" || exit
    clear
    exec bash
}

# Create a bookmark
mark() {
    if ! test -f "${HOME}/.shellmarks"; then
        touch "${HOME}/.shellmarks"
    fi

    mark_to_add="$(pwd)"

    if grep -qxFe "${mark_to_add}" "${HOME}/.shellmarks"; then
        gum style \
            --foreground 210 \
            --margin "1 2" \
            "This bookmark already exists: ${mark_to_add}"
    else
        echo "${mark_to_add}" >>"${HOME}/.shellmarks"
        gum style \
            --foreground "#73F59F" \
            --margin "1 2" \
            "${mark_to_add} added to shellmarks file"
    fi

    /bin/cat "${HOME}/.shellmarks" | sort | tee "${HOME}/.shellmarks" >/dev/null

    return 0
}

# List bookmarks
lsmarks() {
    echo "# Shellmarks" | gum format

    while IFS= read -r line; do
        echo "- ${line}"
    done <"${HOME}/.shellmarks" | gum format
}

# Remove bookmarks
delmark() {
    selection=$(cat "${HOME}/.shellmarks" | gum choose --no-limit)

    if test -n "${selection}"; then
        while read -r line; do
            perl -n -i -e "print unless /^\\Q${line//\//\\/}\\E\$/" "${HOME}/.shellmarks"
        done <<<"${selection}"
    else
        return 0
    fi

    gum format -t markdown -- \
        "# The following bookmarks were deleted:" \
        "$(printf "%s\n" "${selection}")"

    return 0
}

# Goto bookmark
gotomark() {
    if ! test -f "${HOME}/.shellmarks"; then
        echo "No bookmarks exist yet. Add some!"
        return 1
    fi

    echo
    builtin cd "$(cat "${HOME}/.shellmarks" | gum choose --limit=1 --height=20)" || exit
}

# Do an ls after cd
cd() { builtin cd "$@" && ls; }

# Create a new directory and enter it.
mkd() { mkdir -p "$@" && cd "$_" || exit; }
### bling.sh source start
test -f /usr/share/bazzite-cli/bling.sh && source /usr/share/bazzite-cli/bling.sh
### bling.sh source end
