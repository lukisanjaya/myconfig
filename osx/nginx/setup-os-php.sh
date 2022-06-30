brew tap shivammathur/php

brew install shivammathur/php/php@5.6
/usr/local/opt/php@5.6/bin/php -v
brew services start php@5.6
sudo wget https://raw.githubusercontent.com/lukisanjaya/myconfig/master/osx/php/5.6/fpm.conf -O /usr/local/etc/php/5.6/php-fpm.conf
sudo wget https://raw.githubusercontent.com/lukisanjaya/myconfig/master/osx/php/5.6/php.ini -O /usr/local/etc/php/5.6/php.ini
sed -i '' "s:{{user}}:`whoami`:" /usr/local/etc/php/5.6/php-fpm.conf

brew install shivammathur/php/php@7.0
/usr/local/opt/php@7.0/bin/php -v
brew services start php@7.0
sudo wget https://raw.githubusercontent.com/lukisanjaya/myconfig/master/osx/php/7.0/fpm.conf -O /usr/local/etc/php/7.0/php-fpm.d/www.conf
sudo wget https://raw.githubusercontent.com/lukisanjaya/myconfig/master/osx/php/7.0/php.ini -O /usr/local/etc/php/7.0/php.ini
sed -i '' "s:{{user}}:`whoami`:" /usr/local/etc/php/7.0/php-fpm.d/www.conf

brew install shivammathur/php/php@7.3
/usr/local/opt/php@7.3/bin/php -v
brew services start php@7.3
sudo wget https://raw.githubusercontent.com/lukisanjaya/myconfig/master/osx/php/7.3/fpm.conf -O /usr/local/etc/php/7.3/php-fpm.d/www.conf
sudo wget https://raw.githubusercontent.com/lukisanjaya/myconfig/master/osx/php/7.3/php.ini -O /usr/local/etc/php/7.3/php.ini
sed -i '' "s:{{user}}:`whoami`:" /usr/local/etc/php/7.3/php-fpm.d/www.conf

brew install shivammathur/php/php@7.4
/usr/local/opt/php@7.4/bin/php -v
brew services start php@7.4
sudo wget https://raw.githubusercontent.com/lukisanjaya/myconfig/master/osx/php/7.4/fpm.conf -O /usr/local/etc/php/7.4/php-fpm.d/www.conf
sudo wget https://raw.githubusercontent.com/lukisanjaya/myconfig/master/osx/php/7.4/php.ini -O /usr/local/etc/php/7.4/php.ini
sed -i '' "s:{{user}}:`whoami`:" /usr/local/etc/php/7.4/php-fpm.d/www.conf

echo "Starting PHP 7.0"
echo "\n"
phpv 7.3
sudo chmod `whoami` ~/.zshrc
echo 'export PATH="/usr/local/opt/php@7.3/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/usr/local/opt/php@7.3/sbin:$PATH"' >> ~/.zshrc
echo "\n"
echo "List of Services"
brew services list
echo "\n"
echo "List of php-fpm"
sudo killall php-fpm
sudo lsof -i -n -P|grep php-fpm
echo "\n"
brew install nginx

brew cleanup
