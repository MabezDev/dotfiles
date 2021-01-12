#!/bin/zsh

# we are calling from non-interactive shell, we must manually invoke the colour schemes so its applied for ranger
(cat ~/.cache/wal/sequences &)

ranger $1
