#!/bin/bash

# Make sure rofi's "run" menu is aware of scripts in .local/bin
export PATH="$HOME/.local/bin:$PATH"

rofi -show run
