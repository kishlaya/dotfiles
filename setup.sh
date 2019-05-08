### Install basic stuff

sudo apt update
sudo apt install curl build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip

# git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

# also this unrelated thing
git config --global user.name "Kishlaya Jaiswal"
git config --global user.email "kishlaya.j@gmail.com"

# nodejs and npm
curl -sL https://deb.nodesource.com/setup_8.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
sudo apt update
sudo apt-get install nodejs
sudo apt-get install npm

# atom
sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
sudo apt install atom

# chrome (because I prefer chrome)
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable

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
sudo apt-get install zsh
chsh -s $(which zsh) $(whoami)
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
cp .zshrc ~/

# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# for the c alias (syntax highlighted cat)
sudo apt install python3-pip
pip3 install Pygments


# github.com/rupa/z   - oh how i love you
git clone https://github.com/rupa/z.git ~/z
# consider reusing your current .z file if possible. it's painful to rebuild :)
