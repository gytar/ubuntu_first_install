# What must I install ? 

# Python
* python3-pip
* python-is-python3
* wkhtmltopdf
* odoo
* django-admin

# Database
* postgresql
* postgresql-contrib
* [postgresql config](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-20-04-fr)

# Softwares
### **Google Chrome:**
```bash
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
```
### **Jetbrains Toolbox app:**

Open nav and go to : https://www.jetbrains.com/fr-fr/toolbox-app/download/download-thanks.html?platform=linux
```bash
cd ~/Downloads
tar -xf jetbrains-toolbox-1.24.11947.tar.gz
rm jetbrains-toolbox-1.24.11947.tar.gz
cd jetbrains-toolbox-1.24.11947
./jetbrains-toolbox
```

# Package Manager

* cargo
* nodejs
* vite 

# Stuff for the terminal
## with apt
- zsh
- vim
- z
- bat 
```bash
# after installing bat
ln -s /usr/bin/batcat ~/.local/bin/bat
```

- oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
plugins: 
```bash
cp -r my_config/custom-oh-my-zsh-plugins/* ~/.local/share/oh-my-zsh/custom/plugins
mv my_config/.zshrc ~/.zshrc
exec zsh
```
- oh my posh
```bash
brew install jandedobbeleer/oh-my-posh/oh-my-posh
# exec zsh 
```
see https://ohmyposh.dev/docs for more info
- FZF
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
cd ~/.fzf/
./install
```

# Fonts && graphics
Monofur Nerd Font : 
```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Monofur.zip
unzip Monofur.zip 
mv Monofur/* ~/.local/share/fonts
rm -r Monofur Monofur.zip
```

cascadia code: 
```bash
wget https://github.com/microsoft/cascadia-code/releases/download/v2111.01/CascadiaCode-2111.01.zip
```

Gnome shell extension / Gnome tweak: 
```bash
sudo apt install gnome-shell-extension-manager gnome-tweaks
```
some extensions to add : https://www.omgubuntu.co.uk/best-gnome-shell-extensions

some themes / icons : https://www.gnome-look.org/browse/


# Miscellaneous 
```bash
$ sudo apt-get install tlp tlp-rdw
$ sudo systemct1 enable tlp
```

## repo issues with apt-key not in trusted.gpg.d

1. find keys in the wrong place with `sudo apt-key list`
-> found in /etc/apt/trusted.gpg
2. Recover the gpg key in ubuntu key server
```
gpg --keyserver keyserver.ubuntu.com --recv-keys <Last 8 ch.>
```
3. Export gpg key

```
gpg --output <name of the repo>.gpg --export <Last 8 ch.>
```

4. Copy the key to right directory
```
sudo cp insync.gpg /usr/share/keyrings/
```
5. Adjust repository in /etc/apt/sources.list.d/\<name of repo\>.list  (sudo vim)
```
deb [signed-by=/usr/share/keyrings/insync.gpg arch=amd64] http://apt.insync.io/debian bookworm  non-free contrib
```
6. Update repository

```bash
sudo apt update
```