#!/bin/bash
# To use run the following script from your terminal.
# curl -L https://cdn.rawgit.com/ATCUSA/scripts/develop/jekyllDevEnv.sh | bash

# Variables
rubyv="2.4.2"

# Update Ubuntu
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

#Install Dependencies
sudo apt install autoconf bison build-essential libssl-dev libyaml-dev \
libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 \
libgdbm-devautoconf bison build-essential libssl-dev libyaml-dev \
libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 \
libgdbm-dev git

# Install Node Repo
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

#Install Atom Repo
sudo add-apt-repository ppa:webupd8team/atom -y

# Install Programs
sudo apt update
sudo apt install \
atom \
nodejs \

# Install Ruby
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source $HOME/.bashrc
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
#rbenv install -l | less
#read -p "Enter the version of Ruby you would like to install: " rubyv
rbenv install $rubyv
rbenv global $rubyv

# Install Jekyll and dependencies
echo "gem: --no-document" > ~/.gemrc
gem install bundler
gem install jekyll
