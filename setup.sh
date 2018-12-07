sudo apt update

sudo apt-get install build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip

# Install git
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git

# Install nodejs and npm
curl -sL https://deb.nodesource.com/setup_8.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
sudo apt update
sudo apt-get install nodejs
sudp apt-get install npm

# Install atom
sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
sudo apt-get install atom

sudo apt-get install google-chrome-stable


# Type `git open` to open the GitHub page or website for a repository.
npm install -g git-open

# fancy listing of recent branches
npm install -g git-recent

# sexy git diffs
npm install -g diff-so-fancy

# trash as the safe `rm` alternative
npm install --global trash-cli


# Install zsh and oh-my-zsh
sudo apt-get install zsh
chsh -s $(which zsh) $(whoami)
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh


# for the c alias (syntax highlighted cat)
sudo apt-get install python3-pip
pip3 install Pygments
