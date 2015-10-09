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
升级PHP5.5
```
wget http://git.oschina.net/chinayin/wdcp/raw/master/php_up55.sh
sh php_up55.sh
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
```
