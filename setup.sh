#! /usr/bin/env bash

sed -i -r 's/(^\s*)#+(\s*require_login\s*=\s*).*/\1\2True/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*brand\s*=\s*).*/\1\2de\.STAIR/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*enable_quotas\s*=\s*).*/\1\2True/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*show_welcome_with_login\s*=\s*).*/\1\2True/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*webhooks_dir.+)/\1\2/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*tour_config_dir.+)/\1\2/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*tool_path.+)/\1\2/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*conda_auto_install\s*=).*/\1\2 True/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*conda_auto_init\s*=).*/\1\2 True/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*conda_ensure_channels\s*=).*/\1\2 iuc,bioconda,conda-forge,defaults/' $GALAXY_CONFIG_FILE

head -4 $GALAXY_ROOT/config/tool_conf.xml.sample > $GALAXY_ROOT/config/tool_conf.xml
echo '  </section>' >> $GALAXY_ROOT/config/tool_conf.xml
echo '  <section id="visualization" name="visualization">' >> $GALAXY_ROOT/config/tool_conf.xml
for i in $(ls -d /tmp/tools/*/); do
	echo '    <tool file="'$(basename $i)/$(basename $i).xml'" />'
done >> $GALAXY_ROOT/config/tool_conf.xml
tail -2 $GALAXY_ROOT/config/tool_conf.xml.sample >> $GALAXY_ROOT/config/tool_conf.xml

sed -i -r 's/Get\s+Data/Upload Data/' $GALAXY_ROOT/integrated_tool_panel.xml

mv /tmp/webhooks/switchtour $GALAXY_ROOT/config/plugins/webhooks
rm -rf /tmp/webhooks
mv /tmp/guided_tours/*yaml $GALAXY_ROOT/config/plugins/tours/
rm -rf /tmp/guided_tours
cp -r /tmp/tools/* $GALAXY_ROOT/tools
mv /tmp/tools/* $GALAXY_ROOT/test-data
