#!/bin/sh

# Créer l'utilisateur avec son dossier de connexion dans /var/www/wordpress
adduser --disabled-password --gecos "" --home /var/www/wordpress $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd

echo "FTP Started on :21"
/usr/sbin/vsftpd /etc/vsftpd.conf
