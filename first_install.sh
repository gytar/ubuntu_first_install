#!/usr/bin/env bash

GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"

cd || exit

echo "apt upgrade && update + primary installations"
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y git vim wget nodejs npm libfuse2 curl build-essential \
golang-go apt-transport-https python3-pip python-is-python3 \
python3.10-venv wkhtmltopdf postgresql postgresql-contrib \
zsh bat cargo gnome-shell-extension-manager gnome-tweaks \
vlc ffmpeg neofetch

echo -e "${YELLOW}installing spotify ${ENDCOLOR}"
sudo snap install spotify

echo -e "${YELLOW}Installing VSCode ${ENDCOLOR}"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code
echo -e "${GREEN}VSCode version : $(code --version | head -n1) ${ENDCOLOR}"

echo -e "${YELLOW}Installing Google Chrome${ENDCOLOR}"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &> /dev/null
sudo apt install ./google-chrome-stable_current_amd64.deb
echo -e "${GREEN}$(google-chrome --version)${ENDCOLOR}"

echo -e "${YELLOW}Downloads and extracts jetbrains toolbox${ENDCOLOR}"
wget https://download-cdn.jetbrains.com/toolbox/jetbrains-toolbox-1.24.11947.tar.gz &> /dev/null
tar -xf jetbrains-toolbox-1.24.11947.tar.gz
rm jetbrains-toolbox-1.24.11947.tar.gz
# ./jetbrains-toolbox-1.24.11947/jetbrains-toolbox

echo -e "${YELLOW}installing brew ${ENDCOLOR}"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo -e "${GREEN}brew version: $(brew --version) ${ENDCOLOR}"

echo -e "${YELLOW}install RUST env ${ENDCOLOR}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo -e "${GREEN}RUST version: $(rustc --version) ${ENDCOLOR}"

echo -e "${YELLOW}configure git ${ENDCOLOR}"
git config --global user.name "gytar"
git config --global user.email perrotguillaume@protonmail.com


echo -e "${YELLOW}create ssh key for github / gitty ${ENDCOLOR}"
echo -e "\n\n\n" | ssh-keygen -t ed25519 -C "perrotguillaume@protonmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo-e  "${YELLOW}add vim as default editor in bashrc ${ENDCOLOR}"
echo "export EDITOR=/usr/bin/vim" >> ~/.bashrc
echo "export VISUAL=/usr/bin/vim" >> ~/.bashrc

echo -e "${YELLOW}Display node and npm versions ${ENDCOLOR}"
node -v
npm -v


echo -e "${YELLOW}installs node lastest stable version ${ENDCOLOR}"
sudo npm install n -g
sudo n stable
hash -r

echo -e "${YELLOW}Installing ZX ${ENDCOLOR}"
sudo npm i -g zx

echo -e "${YELLOW} Install exa from cargo${ENDCOLOR}"
cargo install exa

echo -e "${GREEN} make batcat as bat ${ENDCOLOR}"
mkdir ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

echo -e "${YELLOW}Installs fonts ${ENDCOLOR}"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Monofur.zip
unzip Monofur.zip -d ~/.local/share/fonts/
rm Monofur.zip
wget https://github.com/microsoft/cascadia-code/releases/download/v2111.01/CascadiaCode-2111.01.zip 
unzip CascadiaCode*.zip -d ~/.local/share/fonts
rm CascadiaCode*.zip
echo -e "${GREEN}Monofur and Cascadia Code installed $ENDCOLOR"

if [[ "$USER" != "root" ]]; then
    sudo -u postgres createuser -s -i -d -r -l -w "$USER"
    sudo -u postgres psql -c "ALTER ROLE $USER WITH PASSWORD 'pass';"
    echo -e "${GREEN} create super user $USER in pqsl with password pass $ENDCOLOR"
fi

echo "TODO:"
echo "  [1] Change terminal font to Monofur"
echo "  [2] Configure ZSH and Github and launch the two remaining scripts"
echo "  [3] For ZSH: chsh -s /bin/zsh"
