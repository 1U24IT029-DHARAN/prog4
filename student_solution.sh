#!/bin/bash

# SELinux Access Denial Practical
# Student Name:DHARAN K
# Register Number:1U24IT029

echo "===== SELinux Status ====="
getenforce

echo "===== Creating Web Directory ====="
mkdir -p /var/www/html/test

echo "===== Creating HTML File ====="
echo "<h1>Test Page</h1>" > /var/www/html/test/index.html

echo "===== Setting Linux Permissions ====="
chmod 644 /var/www/html/test/index.html

echo "===== Checking Initial Context ====="
ls -Z /var/www/html/test/index.html

echo "===== Assigning Wrong SELinux Context ====="
chcon -t admin_home_t /var/www/html/test/index.html

echo "===== Checking Wrong Context ====="
ls -Z /var/www/html/test/index.html

echo "===== Checking AVC Denials ====="
ausearch -m avc -ts recent | head -20

echo "===== Correcting SELinux Context ====="
chcon -t httpd_sys_content_t /var/www/html/test/index.html

echo "===== Checking Correct Context ====="
ls -Z /var/www/html/test/index.html

echo "===== Practical Completed ====="
