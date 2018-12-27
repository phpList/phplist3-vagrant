#!/bin/bash

cd /tmp/

git clone https://github.com/phpList/phplist3.git phplist

cd /var/www/html/phplist/public_html/lists
git clone https://github.com/phpList/Updater.git updater
rm -rf texts
git clone https://github.com/phpList/phplist-lan-texts texts
cd admin
rm -rf help
git clone https://github.com/phpList/phplist-lan-help help
rm -rf info
git clone https://github.com/phpList/phplist-lan-info info

cd /var/www/html/phplist/public_html/lists/admin/
rm -rf locale
git clone https://gitlab.com/erionsina/phplist-locale.git locale

cd /var/www/html/phplist/public_html/lists/admin/ui

git clone https://github.com/phpList/phplist-ui-dressprow.git dressprow
git clone https://github.com/phpList/phplist-ui-bootlist.git
cd ../plugins

#cd $BUILDDIR/phplist-$version/public_html/lists/admin/plugins
cd /var/www/html/phplist/public_html/lists/admin/plugins

#cp -R "$RELEASEPLUGINDIR"/* .

mkdir tmp

git clone https://github.com/bramley/phplist-plugin-common.git tmp/common
git clone https://github.com/bramley/phplist-plugin-captcha.git tmp/captcha
git clone https://github.com/bramley/phplist-plugin-ckeditor.git tmp/ckeditor
git clone https://github.com/arnoldle/phplist-plugin-subjectLinePlaceholdersPlugin.git tmp/subjectplaceholder
git clone https://github.com/bramley/phplist-plugin-segment.git tmp/segment
git clone https://github.com/michield/phplist-plugin-invite.git tmp/invite

for plugin in tmp/*; do
   mv $plugin/plugins/* /var/www/html/phplist/public_html/lists/admin/plugins
done
rm -rf tmp

cd /var/www/html

find ./ -name .git -type d -exec rm -rf {} \; 2>/dev/null
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
chmod 777 /var/www/html/phplist/public_html/lists/admin/plugins

cat /var/www/html/phplist/public_html/lists/admin/init.php | tr '\n' '\r' | sed 's~//## remove on rollout.*//## end remove on rollout ###~define("VERSION","'${version}'");~' | tr '\r' '\n' > /tmp/$$.init
mv -f /tmp/$$.init /var/www/html/phplist/public_html/lists/admin/init.php
sed -i s~define\(\'STRUCTUREVERSION\'.*~define\(\'STRUCTUREVERSION\',\"${version}\"\)\;~ /var/www/html/phplist/public_html/lists/admin/structure.php

sed -i s~'//# load language files'~"\$plugins_disabled['fckphplist'] = 1;saveConfig('plugins_disabled', serialize(\$plugins_disabled), 0);saveConfig('179086c5f0269ea80def0b97d4af3062',time(),0);"~ /var/www/html/phplist/public_html/lists/admin/initialise.php


## Read version of php and append to init.php

cd /var/www/html/phplist/
head -4 VERSION | grep -Eo '3.3.*' > readversion.txt
phplistversion=$( cat readversion.txt )

sed -i 's/define("VERSION","")/define("VERSION","'"$phplistversion"'")/g' /var/www/html/phplist/public_html/lists/admin/init.php

