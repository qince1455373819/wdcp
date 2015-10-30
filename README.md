# WDCP安装
    
### 安装

RPM包安装
```
wget http://git.oschina.net/chinayin/wdcp/raw/master/lanmp_install.sh
sh lanmp_install.sh
```
RPM包卸载 (切记备份好数据)
```
sh lanmp_install.sh uninstall
```
修复 glibc 漏洞
```
yum update glibc
```
同步系统时间
```
sh /www/wdlinux/tools/wdcp_ntp.sh
```
升级PHP5.5
```
wget http://git.oschina.net/chinayin/wdcp/raw/master/php_up55.sh
sh php_up55.sh
```
升级PHP5.6
```
wget http://git.oschina.net/chinayin/wdcp/raw/master/php_up56.sh
sh php_up56.sh
```
安装memcached-1.4.24
```
wget http://git.oschina.net/chinayin/wdcp/raw/master/memcached_install.sh
sh memcached_install.sh
```
安装git
```
yum install -y git
ssh-keygen -t rsa -C "youremail@163.com"
vim ~/.ssh/id_rsa.pub
ssh -T git@github.com
```

备注
```
#http://ip:8080
#用户名:admin 默认密码:wdlinux.cn
#mysql默认的管理用户名:root 默认密码:wdlinux.cn
#站点配置文件
#/www/wdlinux/nginx/conf/vhost
#/www/wdlinux/apache/conf/vhost
#数据库配置文件/www/wdlinux/etc/my.cnf
#数据库数据文件目录 /www/wdlinux/mysql/var
#wdcp后台登录密码忘记的修改方法
#sh /www/wdlinux/tools/wdcp_login_chp.sh
#强制修改mysql的root密码
#sh /www/wdlinux/tools/mysql_root_chg.sh
```
