#!/bin/sh
set -o pipefail
latest="$(curl -sL https://raw.githubusercontent.com/xo1v/hentaishell/main/latest)"

if [ $(id -u) = 0 ]; then
   echo "This script shall not be run as root."
   exit 1
else
   echo

   echo "888                        888             d8b          888               888 888 
888                        888             Y8P          888               888 888 
888                        888                          888               888 888 
88888b.   .d88b.  88888b.  888888  8888b.  888 .d8888b  88888b.   .d88b.  888 888 
888  88b d8P  Y8b 888  88b 888         88b 888 88K      888  88b d8P  Y8b 888 888 
888  888 88888888 888  888 888    .d888888 888  Y8888b. 888  888 88888888 888 888 
888  888 Y8b.     888  888 Y88b.  888  888 888      X88 888  888 Y8b.     888 888 
888  888   Y8888  888  888  "Y888 "Y888888 888  88888P' 888  888   Y8888  888 888 "
echo
echo "                     ⠀⠀⣠⣿⣿⠿⠿⠿⠷⠶⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⡶⠶⠿⠿⠿⢿⣿⣧⡀⠀⠀
                     ⠲⣿⡟⠉⠀⠀⢀⣤⣶⣶⣶⣍⠛⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠟⢋⣴⣶⣶⣶⣄⠀⠀⠈⠙⣿⡷⠂
                     ⠀⢹⡇⠀⠀⠀⠈⠈⢰⣤⣾⡟⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢽⣦⣴⠞⠙⠀⠀⠀⠀⣿⠃⠀
                     ⠀⠀⢷⠀⠀⠀⠀⠘⠂⠉⠁⠠⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠣⠂⠉⠁⠀⠈⠀⠀⠀⢰⠃⠀⠀
                     ⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⢀⠀⢀⠔⢋⡠⢀⡀⠀⣀⠄⣀⠔⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠀⠀⠀⠀⠀
                     ⠀⢀⠔⢀⡤⠀⡠⠒⣀⠝⡡⠚⢁⠔⢋⠔⠉⡠⠞⡡⠞⠁⡠⠚⠀⣀⠄⠉⢁⠤⠊⠁⡠⠔⠉⠀⠀⠀
                     ⠐⡡⠚⢁⠔⠉⡠⢊⠵⠊⡠⠖⡡⠚⢁⠤⢊⡠⠊⢀⠔⠊⢀⠴⠊⣠⠔⠊⢁⡤⠒⢉⠤⠂⠀⠀⠀⠀
                     ⠈⠀⠞⠁⡴⠊⠀⠁⠠⠊⠔⠋⢀⠔⢁⠔⠉⣠⠾⣁⠀⠐⠁⠒⠉⠀⠤⠚⠁⠀⠊⠁⠀⠀⠀⠀⠀⠀
                     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠁⠀⠈⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"

sleep 2
   echo
   echo "    the hentaishell installer"
   fi

   if [ ! -e /System ]; then
   echo "hentaishell can only be installed on macOS (for the moment)"
   exit 1
   fi

if [ $(uname -m) = "arm64" -o "$(uname -m)" = "aarch64" ]; then
if [ ! -e /opt/homebrew ]; then
   echo "    ~-~-~-~-~-~-~-~-~-~-~-~-~"
   echo "Homebrew installation not found."
   echo "Homebrew is required in order to properly set up hentaishell."
   echo "Cannot proceed."
   exit 1
else
   echo "    ~-~-~-~-~-~-~-~-~-~-~-~-~"
fi
fi

if [ $(uname -m) = "amd64" -o "$(uname -m)" = "x86_64" ]; then
if [ ! -e /usr/local/homebrew ]; then
   echo "~-~-~-~-~-~-~-~-~-~-~-~-~-~"
   echo "Homebrew installation not found."
   echo "Homebrew is required in order to properly set up hentaishell."
   echo "Cannot proceed."
   exit 1
else
   echo "~-~-~-~-~-~-~-~-~-~-~-~-~-~"
fi
fi

sleep 1

echo
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "READ:"
echo "This script requires root access for some operations.."
echo "Please enter your password if prompted to do so."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo
printf "\e[94mFetching packages\e[0m" && echo
HOMEBREW_NO_AUTO_UPDATE=1 brew install coreutils curl zsh aalib bat

echo
printf "\e[94mDownloading hentaishell.zip\e[0m" && echo
curl -sL "https://github.com/xo1v/hentaishell/releases/download/"$latest"/hentaishell.zip" -o /tmp/hentaishell.zip

echo
printf "\e[94mUnzipping hentaishell.zip\e[0m" && echo
unzip -o -q -d "/tmp" /tmp/hentaishell.zip
/bin/rm -rf "/tmp/__MACOSX"

# printf "\e[94mPlaying with Homebrew's zsh..\e[0m" && echo

echo
printf "\e[94mCreating links for binaries\e[0m" && echo
sleep 1
sudo /bin/ln -vs /tmp/hentaishell/bin/hsh /usr/local/bin
/bin/ln -vs /bin/* /tmp/hentaishell/bin
/bin/ln -vs /usr/bin/* /tmp/hentaishell/usr/bin
/bin/ln -vs /sbin/* /tmp/hentaishell/sbin
/bin/ln -vs /usr/sbin/* /tmp/hentaishell/usr/sbin
/bin/ln -vs /usr/local/bin/* /tmp/hentaishell/usr/local/bin

echo
printf "\e[95mCreating hentaishell's space\e[0m" && echo
sudo mv /tmp/hentaishell /opt

echo
printf "\e[95mSetting PATH\e[0m" && echo
echo >> ~/.zshrc
echo "export PATH=/opt/hentaishell/bin:/opt/hentaishell/sbin:/opt/hentaishell/usr/bin:/opt/hentaishell/usr/sbin:/opt/hentaishell/usr/local/bin:$PATH" >> ~/.zshrc
rm -rf /tmp/hentaishell.zip

echo
printf "\e[95mSetting up hentai-per-login\e[0m" && echo
echo >> ~/.zshrc
echo "percmdexec() {
  if [ -z "'$PRE_COMMAND_RUN'" ]; then
    PRE_COMMAND_RUN=1
    /opt/hentaishell/.simg/handlesimg.sh
  fi
}

postcmdexec() {
  PRE_COMMAND_RUN=""
}

trap percmdexec DEBUG
trap postcmdexec EXIT" >> ~/.zshrc
echo >> ~/.zshrc

source ~/.zshrc
/opt/hentaishell/bin/hshsam
