#!/usr/bin/env bash

#  Note that a variable may require special treatment
#+ if it will be exported.

DARKGRAY='\e[1;30m'
LIGHTRED='\e[1;31m'
GREEN='\e[32m'
YELLOW='\e[1;33m'
LIGHTBLUE='\e[1;34m'
NC='\e[m'

#\e is a special character denoting the start of a color sequence
#\u indicates the name of the user, followed by the '@' symbol
#\h showcases the system's hostname
#\w indicates base directory
#\a represents an active directory
#$ represents a non-root user
#0 for standard text, 1 for bold, 3 for italic, and 4 for underlined text.
#The color range for background pallets is 40-47.
#The color range for text colors is 30-37.

PCT="\`if [[ \$EUID -eq 0 ]]; then T='$LIGHTRED' ; else T='$LIGHTBLUE'; fi; 
echo \$T \`"

#  For "literal" command substitution to be assigned to a variable,
#+ use escapes and double quotes:
#+       PCT="\` ... \`" . . .
#  Otherwise, the value of PCT variable is assigned only once,
#+ when the variable is exported/read from .bash_profile,
#+ and it will not change afterwards even if the user ID changes.


PS1="\n$GREEN[\w] \n$DARKGRAY($PCT\t$DARKGRAY)-($PCT\u$DARKGRAY)-($PCT\!
$DARKGRAY)$YELLOW-> $NC"

#  Escape a variables whose value changes:
#        if [[ \$EUID -eq 0 ]],
#  Otherwise the value of the EUID variable will be assigned only once,
#+ as above.

#  When a variable is assigned, it should be called escaped:
#+       echo \$T,
#  Otherwise the value of the T variable is taken from the moment the PCT 
#+ variable is exported/read from .bash_profile.
#  So, in this example it would be null.

#  When a variable's value contains a semicolon it should be strong quoted:
#        T='$LIGHTRED',
#  Otherwise, the semicolon will be interpreted as a command separator.


#  Variables PCT and PS1 can be merged into a new PS1 variable:
#PS1="\`if [[ \$EUID -eq 0 ]]; then PCT='$LIGHTRED';
#else PCT='$LIGHTBLUE'; fi; 
#echo '\n$GREEN[\w] \n$DARKGRAY('\$PCT'\t$DARKGRAY)-\
#('\$PCT'\u$DARKGRAY)-('\$PCT'\!$DARKGRAY)$YELLOW-> $NC'\`"
#The trick is to use strong quoting for parts of old PS1 variable.


#unset PROMPT_COMMAND
#unset PS0
PS1="\\u@\\h:\\w\a\] $"
#PS1="\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\\n\[\033[35m\]\t: "

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach-session -t default || tmux new-session -s default
fi
