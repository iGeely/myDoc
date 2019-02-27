#
#echo "running .cshrc"
# Default user .cshrc file (/bin/csh initialization).

# Set up default command search path:
#

set tmp_path = ( . ~/bin ~/bin/bin ~/util ~/go/bin /local_vol1_nobackup/shaojie/go/bin)
set tmp_path = ( $tmp_path /tool/pandora64/.package/vim-8.0/bin /tool/pandora64/.package/gcc-8.1.0 /tool/pandora64/hdk-4.8.1/19/bin /tool/pandora64/bin /tool/cbar/apps/vcs-mx/2017.03-SP1/include /tool/pandora/bin)
#set tmp_path = ( $tmp_path /tool/pandora64/bin /tool/pandora/bin)
set tmp_path = ( $tmp_path /tool/sysadmin/scripts /tool/sysadmin/bin )
set tmp_path = ( $tmp_path /tool/lsf/bin )
set tmp_path = ( $tmp_path /bin /usr/bin )
set tmp_path = ( $tmp_path /usr/X11R6/bin )
set tmp_path = ( $tmp_path /usr/bin/X11 )
set tmp_path = ( $tmp_path /usr/lib/X11 )
set path = ( $tmp_path )

set CLASSPATH = (.)

setenv LD_LIBRARY_PATH "/home/guash/tmp/python2.7/lib:/home/guash/new_bin/lib"

umask 002
#set correct=cmd
set autolist
setenv GREP_OPTIONS --color=auto
alias mv 'mv -i'
alias cp 'cp -i'
alias rm 'rm -i'


# Set up C shell environment:

	if ( $?prompt ) then		# shell is interactive.
	    stty erase ^H kill ^U intr ^C susp ^Z
      stty erase '^?'
	    set history=150		# previous commands to remember.
	    set savehist=150		# number to save across sessions.
	    set system=`hostname`	# name of this system.
	    unset autologout
	    #alias setprompt 'set prompt="${system}:${cwd}[ \! ] --> "'
        source /home/guash/.prompt
        
	    #alias cd 'chdir \!* && setprompt'	# reset prompt after change dir
	    alias cd 'chdir \!* && source /home/guash/.prompt && pwd'	# reset prompt after change dir
	    #setprompt				# to set the initial prompt

	    # Sample alias:

	    alias	h	history		
	    alias	d	dirs
	    alias 	a	alias
	    alias 	l	'ls -a -C -F'
	    alias 	lc	'ls -a -l -F | less'
	    #alias 	ll	'ls -al | less'
	    alias 	j	'jobs -l'
	    alias	m	'more -c'
	    alias 	cls	'clear'
	    alias 	bye	'clear; exit'
	    alias 	pg	'pg -ne'
	    alias 	pspg	'ps -ef | less'
	    alias 	psg	'ps -ef | grep '
	    alias 	r	rsh
	    alias 	vi	'/tool/pandora/bin/vim'
	endif

alias cbwa 'source /proj/verif_release_ro/cbwa_initscript/current/cbwa_init.csh'
alias cb 'cbwa'
#
setenv EDITOR 'vim'
#setenv EDITOR 'gvim'

source /home/guash/.alias

# To select a printer see
# http://mpdwww.amd.com/twiki/bin/view/Systeam/AsdcPrintersPlotters
# then uncomment these two lines and set your printer up.
#setenv PRINTER scribe
#setenv LPDEST scribe

# sourcing /tool/site-config/cshrc for updated license 
# and environment variable information
# source /tool/site-config/cshrc
# redundant now

# sourcing the LSF environment
source /tool/pandora/etc/lsf/cshrc.lsf
source /proj/verif_release_ro/cbwa_initscript/current/cbwa_init.csh

setenv P4PORT srdcp4ps1:1677
#setenv P4DIFF /tool/pandora64/bin/tkdiff
#setenv P4EDITOR /tool/pandora64/.package/vim-8.0/bin/vim
#setenv P4DIFF2 /tool/pandora64/bin/tkdiff
module load DiagPanda/current


unsetenv tt

#module swap hdk-4.8.1/22
echo "he: this cshrc"
