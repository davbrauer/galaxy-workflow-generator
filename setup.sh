#! /usr/bin/env bash

sed -i -r 's/(^\s*)#+(\s*require_login\s*=\s*).*/\1\2True/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*brand\s*=\s*).*/\1\2de\.STAIR/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*enable_quotas\s*=\s*).*/\1\2True/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*show_welcome_with_login\s*=\s*).*/\1\2True/' $GALAXY_CONFIG_FILE
mv /tmp/webhooks/switchtour $GALAXY_ROOT/config/plugins/webhooks
rm -rf /tmp/webhooks
mv /tmp/guided_tours/*yaml $GALAXY_ROOT/config/plugins/tours/
rm -rf /tmp/guided_tours

####NEW - check paths and what is necessary
sed -i -r 's/(^\s*)#+(\s*webhooks_dir.+)/\1\2/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*tour_config_dir.+)/\1\2/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*tool_path.+)/\1\2/' $GALAXY_CONFIG_FILE

echo 'channels: [iuc, bioconda, conda-forge, defaults]' > $GALAXY_ROOT/database/dependencies/_condarc
sed -i -r 's/(^\s*)#+(\s*conda_auto_install\s*=).*/\1\2 True/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*conda_auto_init\s*=).*/\1\2 True/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*conda_ensure_channels\s*=).*/\1\2 iuc,bioconda,conda-forge,defaults/' $GALAXY_CONFIG_FILE

echo '  <section id="Visualization" name="Visualization">' > /tmp/tmp
for i in $(ls -d /tmp/tools/*/); do
	echo '    <tool file="'$(basename $i)/$(basename $i).xml'" />'
done >> /tmp/tmp
echo '  </section>' >> /tmp/tmp
sed -i '2 r /tmp/tmp' $GALAXY_ROOT/config/tool_conf.xml

rm -f /tmp/tmp
cp -r /tmp/tools/* $GALAXY_ROOT/tools
mv -r /tmp/tools/* $GALAXY_ROOT/test-data
#####
