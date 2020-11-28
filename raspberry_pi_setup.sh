#/bin/bash

if [ "$EUID" > "0" ]
	then echo " Please re-run with sudo (root)"
	exit
fi

if id pi >/dev/null; then
	USER=pi
else
	echo "pi user not found enter user name"
	read USER
fi

apt update
apt upgrade
apt install chromium-chromedriver
pip3 install pipenv
export PATH=$PATH:/home/$USER/.local/bin
echo $USER
pipenv shell
pipenv install

sed -i 's/self.path = executable/self.path = \"chromedriver\"/' /home/$USER/.local/share/virtualenvs/nvidia-bot-*/lib/python3.8/site-packages/selenium/webdriver/common/service.py

