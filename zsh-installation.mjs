#!/usr/bin/env zx
import { okLog, infoLog } from "./personalLogs.mjs"

infoLog("Installing oh-my-zsh")
await $`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
okLog("Oh my zsh installed!")

await $`brew install jandedobbeleer/oh-my-posh/oh-my-posh`
okLog("Oh my posh installed")


// install .zshrc and oh-my-zsh config
infoLog("Importing my configuration")
await $`cp -r my_config/oh-my-zsh ~/.local/share/oh-my-zsh`
await $`mv my_config/.zshrc ~/.zshrc`
await $`echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/ubuntu/.zprofile`

await $`exec zsh`

okLog("All done and zsh sourced")