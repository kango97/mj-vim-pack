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
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ' #original
    PS1='${debian_chroot:+($debian_chroot)}\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[m\]$(git_prompt)\$ ' #standard
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


alias v='nvim'

#showing git branch
if [ -x /usr/bin/tput ] && tput setaf 1 >& /dev/null; then
	c_git_clean=$(tput setaf 2)
	c_git_dirty=$(tput setaf 1)
	c_git_semi_dirty=$(tput setaf 3)
	c_reset=$(tput sgr0)
else
	c_git_clean=
	c_git_dirty=
	c_reset=
	c_git_semi_dirty=
fi

git_prompt ()
{
	if ! git rev-parse --git-dir > /dev/null 2>&1; then
		return 0
	fi

	git_branch=$(git branch 2> /dev/null | sed -n '/^\*/s/^\* //p')
	if git diff HEAD --quiet 2> /dev/null >&2; then
		git_color="${c_git_clean}"
		dirty=0
	else
		git_color="${c_git_dirty}"
		dirty=1
	fi

	if git diff $git_branch origin/$git_branch --quiet 2> /dev/null >&2; then
		git_color="$git_color"
	else
		if [ dirty=0 ]; then
			git_color="${c_git_semi_dirty}"
		fi
	fi

	echo " $git_color[$git_branch]${c_reset}"

}
# showing git branch end

# cd + ls
function cd {
    builtin cd "$@"
    ls -F
}

export LC_ALL="en_US.UTF-8"
