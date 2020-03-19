### Install basic stuff

sudo apt update
sudo apt install curl build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip

# Aptitude B)
sudo apt install aptitude
sudo aptitude update

# git
sudo add-apt-repository ppa:git-core/ppa
sudo aptitude update
sudo aptitude install git

# also this unrelated thing
git config --global user.name "Kishlaya Jaiswal"
git config --global user.email "kishlaya.j@gmail.com"

# nodejs and npm
curl -sL https://deb.nodesource.com/setup_8.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
sudo aptitude update
sudo aptitude install nodejs
sudo aptitude install npm

# atom
sudo add-apt-repository ppa:webupd8team/atom
sudo aptitude update
sudo aptitude install atom

# chrome (because I prefer chrome)
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo aptitude update
sudo aptitude install google-chrome-stable

## Some git extras
# Type `git open` to open the GitHub page or website for a repository.
npm install -g git-open

# fancy listing of recent branches
npm install -g git-recent

# sexy git diffs
npm install -g diff-so-fancy

# trash as the safe `rm` alternative
npm install --global trash-cli


### Cool stuff starts here

# zsh
sudo aptitude install zsh
chsh -s $(which zsh) $(whoami)
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
cp .zshrc ~/

# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# for the c alias (syntax highlighted cat)
sudo aptitude install python3-pip
pip3 install Pygments


# github.com/rupa/z   - oh how i love you
git clone https://github.com/rupa/z.git ~/z
# consider reusing your current .z file if possible. it's painful to rebuild :)


# Hide Top Bar GNOME Extension
mkdir -p ~/.local/share/gnome-shell/extensions/
cd ~/.local/share/gnome-shell/extensions/
git clone https://github.com/mlutfy/hidetopbar.git hidetopbar@mathieu.bidon.ca
cd hidetopbar@mathieu.bidon.ca
make schemas
gnome-shell-extension-tool -e hidetopbar@mathieu.bidon.ca
gnome-shell --replace &


# Copying contents to clipboard
aptitude install xclip
# xclip -sel cli < file.txt
