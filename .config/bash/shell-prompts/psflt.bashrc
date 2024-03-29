#!/usr/bin/env bash

__sig() {
        # Giant switch case for getting the name of the signal (`kill -l`)
        a=0
        for i in $@; do
                a=$((a+1))
                case $i in
                        126) printf ACCES  ;;
                        127) printf NOENT  ;;
                        129) printf HUP    ;;
                        130) printf INT    ;;
                        131) printf QUIT   ;;
                        132) printf ILL    ;;
                        133) printf TRAP   ;;
                        134) printf ABRT   ;;
                        135) printf BUS    ;;
                        136) printf FPE    ;;
 	                    137) printf KILL   ;;
                        138) printf USR1   ;;
                        139) printf SEGV   ;;
                        140) printf USR2   ;;
                        141) printf PIPE   ;;
                        142) printf ALRM   ;;
                        143) printf TERM   ;;
                        144) printf STKFLT ;;
                        145) printf CHLD   ;;
                        146) printf CONT   ;;
                        147) printf STOP   ;;
                        148) printf TSTP   ;;
                        149) printf TTIN   ;;
                        150) printf TTOU   ;;
                        151) printf URG    ;;
                        152) printf XCPU   ;;
                        153) printf XFSZ   ;;
                        154) printf VTALRM ;;
                        155) printf PROF   ;;
                        156) printf WINCH  ;;
                        157) printf IO     ;;
                        158) printf PWR    ;;
                        159) printf SYS    ;;
                        16[3-9]|1[7-8][0-9]|19[0-2]) printf RT$(($i-128)) ;; # Savagery
                        *)   printf $i     ;; # Print exit code if not in list
                esac
        done
}
sig() {
        PLC=(${PIPESTATUS[@]})
        printf "$(__sig ${PLC[@]})"
}
NO_COLOUR="\[\033[0m\]"
# Bold Colours
RED="\[\033[01;31m\]"
GREEN="\[\033[01;32m\]"
YELLOW="\[\033[01;33m\]"
BLUE="\[\033[01;34m\]"

PS1="[${RED}\$(sig)${NO_COLOUR}] [\t] [${RED}\u${NO_COLOUR}@${GREEN}\h${NO_COLOUR}|${BLUE}\w${NO_COLOUR}] [${YELLOW}#\#${NO_COLOUR}] ${GREEN}\$ ${NO_COLOUR}"

