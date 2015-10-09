#!/bin/bash

###yum
yum install -y libmcrypt-devel libjpeg-devel libpng-devel freetype-devel curl-devel openssl-devel libxml2-devel

###
Ver=5.3.29
if [ ! -f php-${Ver}.tar.gz ];then
	wget -c http://dl.wdlinux.cn:5180/soft/php-${Ver}.tar.gz
fi
if [ ! -f iconv_ins.sh ];then
	wget -c http://down.wdlinux.cn/in/iconv_ins.sh
	sh iconv_ins.sh
fi

###
tar zxvf php-${Ver}.tar.gz
cd php-${Ver}
if [ -d /www/wdlinux/apache_php ];then
make clean
	./configure --prefix=/www/wdlinux/apache_php-${Ver} --with-config-file-path=/www/wdlinux/apache_php-${Ver}/etc --with-mysql=/www/wdlinux/mysql --with-iconv=/usr --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath --enable-inline-optimization --with-curl --enable-mbregex --enable-mbstring --with-mcrypt=/usr --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-ftp --enable-sockets --enable-zip --with-apxs2=/www/wdlinux/apache/bin/apxs
[ $? != 0 ] && echo "configure err" && exit
make
[ $? != 0 ] && echo "make err" && exit
make install
[ $? != 0 ] && echo "make install err" && exit
cp php.ini-production /www/wdlinux/apache_php-${Ver}/etc/php.ini
#grep '\[eaccelerator\]' -A15 /www/wdlinux/apache_php/etc/php.ini >> /www/wdlinux/apache_php-${Ver}/etc/php.ini
#grep '\[Zend\]' -A5 /www/wdlinux/apache_php/etc/php.ini >> /www/wdlinux/apache_php-${Ver}/etc/php.ini
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /www/wdlinux/apache_php-${Ver}/etc/php.ini
rm -f /www/wdlinux/apache_php
ln -sf /www/wdlinux/apache_php-${Ver} /www/wdlinux/apache_php
service httpd restart
echo
echo "php update is OK"
fi

if [ -d /www/wdlinux/nginx_php ];then
make clean
	./configure --prefix=/www/wdlinux/nginx_php-${Ver} --with-config-file-path=/www/wdlinux/nginx_php-${Ver}/etc --with-mysql=/www/wdlinux/mysql --with-iconv=/usr --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath --enable-inline-optimization --with-curl --enable-mbregex --enable-mbstring --with-mcrypt=/usr --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-ftp --enable-sockets --enable-zip --enable-fpm
[ $? != 0 ] && echo "configure err" && exit
make
[ $? != 0 ] && echo "make err" && exit
make install
[ $? != 0 ] && echo "make install err" && exit
cp php.ini-production /www/wdlinux/nginx_php-${Ver}/etc/php.ini
#grep '\[eaccelerator\]' -A15 /www/wdlinux/nginx_php/etc/php.ini >> /www/wdlinux/nginx_php-${Ver}/etc/php.ini
#grep '\[Zend\]' -A5 /www/wdlinux/nginx_php/etc/php.ini >> /www/wdlinux/nginx_php-${Ver}/etc/php.ini
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /www/wdlinux/nginx_php-${Ver}/etc/php.ini
service php-fpm stop
rm -f /www/wdlinux/nginx_php
ln -sf /www/wdlinux/nginx_php-${Ver} /www/wdlinux/nginx_php
cp /www/wdlinux/nginx_php-${Ver}/etc/php-fpm.conf.default /www/wdlinux/nginx_php-${Ver}/etc/php-fpm.conf
sed -i 's/user = nobody/user = www/g' /www/wdlinux/nginx_php/etc/php-fpm.conf
sed -i 's/group = nobody/group = www/g' /www/wdlinux/nginx_php/etc/php-fpm.conf
sed -i 's/;pid =/pid =/g' /www/wdlinux/nginx_php/etc/php-fpm.conf
cp -f sapi/fpm/init.d.php-fpm /www/wdlinux/init.d/php-fpm
chmod 755 /www/wdlinux/init.d/php-fpm
service php-fpm start
echo
echo "php update is OK"
fi
echo
