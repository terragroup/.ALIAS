#!/bin/bash
alias sspace='du -sh *  | gsort -h | h G M'

# savoir les prgm qui utilisent internet
alias internetConsuming='lsof -P -i -n | cut -f 1 -d " " | uniq'
