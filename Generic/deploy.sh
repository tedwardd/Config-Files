#!/usr/bin/env bash
#
#  This script will runs the necessary commands to automatically deploy
#  the files in the "Generic" configs directory. This includes running a few
#  git commands to update some submodules as well as compiling an application
#  or two.
#
#  This script was written to discover if you are on a Redhat or Debian based
#  system. Support for Mac OSX may be added in the future. Pull requests are
#  welcome to add support additional operating systems and other useful
#  features.
#
#  This script makes the assumption that you already have git installed since
#  that's hopefully how you got here to begin with. If not, you'll need to
#  install that yourself. And while you're at it, do yourself a favor and
#  clone this repository from this link below to make sure you get the latest
#  updates: https://github.com/k4k/Config-Files.git


[ -x /usr/bin/yum ] && os="redhat"
[ -x /usr/bin/dnf ] && os="fedora"


#  We'll need to temporarily elevate privleges with sudo
if [[ "$os" = "redhat" ]]; then ## Redhat
  sudo yum groupinstall "Developer Tools"
  sudo yum install gcc-c++
  [ ! -z $? ] && echo "Package installation failed" && exit 1
fi
if [[ "$os" = "fedora" ]]; then ## Fedora
  sudo dnf groupinstall "Developer Tools"
  sudo dnf install gcc-c++
  [ ! -z $? ] && echo "Package installation failed" && exit 1
fi


currentDir=$(pwd)
#  Symlink .vim
[ -d ~/.vim ] && mv ~/.vim{,.bak}
[ ! -z $? ] && \
  echo "Unable to move ~/.vim for some reason. Aborting" && exit 2
[ -d "${currentDir}"/.vim ] && ln -s "${currentDir}"/.vim ~/.vim
[ ! -z $? ] && \
  echo "Unable to symlink ${currentDir}/.vim to ~/.vim. Aborting." && echo 3


#  Symlink .vimrc
[ -f ~/.vimrc ] && mv ~/.vimrc{,.bak}
[ ! -z $? ] && \
  echo "Unable to move ~/.vimrc for some reason. Aborting" && exit 4
[ -f "${currentDir}"/.vimrc ] && ln -s "${currentDir}"/.vimrc ~/.vimrc
[ ! -z $? ] && \
  echo "Unable to symlink ${currentDIr}/.vimrc to ~/.vimrc. Aborting." && echo 4


#  Get all git submodules in ~/.vim
cd "${currentDir}"/.vim
git submodule update --init --recursive
[ ! -z $? ] && \
  echo "Updating git submodules failed. Aborting" && exit 6


# Compile YouCompleteMe for vim
cd "${currentDir}"/.vim/bundle/YouCompleteMe
python install.py
[ ! -z $? ] && \
  echo -e "YouCompleteMe did not compile correctly.\nI recommend that you
go to ${currentDir}/.vim/bundle/YouCompleteMe and run install.py by hand to\n
trouleshoot further." && exit 7

#  Congrats, we're done... I think
echo -e "Congratulations! If you're seeing this message, in theory, you should be\n
all set... in theory. I recommend reading through the script you just ran and\n
and verifying that everything it should have done was completed successfully.\n
Not that I doubt my script... but bugs happen. If you find one, report it\n
please."
