#! /usr/bin/env bash

sed -i -r 's/(^\s*)#+(\s*allow_user_deletion\s*[:=]\s*).*/\1\2true/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*require_login\s*[:=]\s*).*/\1\2true/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*brand\s*[:=]\s*).*/\1\2de\.STAIR/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*enable_quotas\s*[:=]\s*).*/\1\2true/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*show_welcome_with_login\s*[:=]\s*).*/\1\2true/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*webhooks_dir.+)/\1\2/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*tour_config_dir.+)/\1\2/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*tool_path.+)/\1\2/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*conda_auto_install\s*[:=]).*/\1\2 true/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*conda_auto_init\s*[:=]).*/\1\2 true/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*conda_ensure_channels\s*[:=]).*/\1\2 iuc,bioconda,conda-forge,defaults/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*new_user_dataset_access_role_default_private\s*[:=]\s*).*/\1\2true/' $GALAXY_CONFIG_FILE
sed -i -r 's/(^\s*)#+(\s*allow_user_dataset_purge\s*[:=]\s*).*/\1\2true/' $GALAXY_CONFIG_FILE

head -4 $GALAXY_ROOT/config/tool_conf.xml.sample > $GALAXY_ROOT/config/tool_conf.xml
echo '  </section>' >> $GALAXY_ROOT/config/tool_conf.xml
echo '  <section id="destair_visualization" name="Visualization">' >> $GALAXY_ROOT/config/tool_conf.xml
for i in $(ls -d /tmp/tools/*/); do
	echo '    <tool file="'$(basename $i)/$(basename $i).xml'" />'
done >> $GALAXY_ROOT/config/tool_conf.xml
tail -2 $GALAXY_ROOT/config/tool_conf.xml.sample >> $GALAXY_ROOT/config/tool_conf.xml

sed -i -r 's/Get\s+Data/Upload Data/' $GALAXY_ROOT/integrated_tool_panel.xml

mv /tmp/webhooks/* $GALAXY_ROOT/config/plugins/webhooks
rm -rf /tmp/webhooks

mv /tmp/guided_tours/*yaml $GALAXY_ROOT/config/plugins/tours/
mv /tmp/guided_tours/*.html $GALAXY_ROOT/static
rm -rf /tmp/guided_tours

mv /tmp/web/* $GALAXY_ROOT/static
rm -rf /tmp/web

# source $GALAXY_CONDA_PREFIX/bin/activate
# conda install -y -c iuc -c bioconda -c conda-forge -c defaults $(grep -F 'requirement type' /tmp/tools/*/destair_heatmap.xml | sed -r 's/(.*)(version=")(.+)(">)(.+)(<.*)/\5=\3/' | xargs -echo)
cp -r /tmp/tools/* $GALAXY_ROOT/tools
mv /tmp/tools/* $GALAXY_ROOT/test-data

sed -i '$ d' $GALAXY_ROOT/tools/data_source/upload.xml
cat << EOF >> $GALAXY_ROOT/tools/data_source/upload.xml
  <citations>
    <citation type="bibtex">@Article{de.STARI-workflow-generator,                           
      author   = {Lott, Steffen C. and Wolfien, Markus and Riege, Konstantin and Bagnacani, Andrea and Wolkenhauer, Olaf and Hoffmann, Steve and Hess, Wolfgang R.},
      title    = {Customized workflow development and data modularization concepts for {RNA}-{S}equencing and metatranscriptome experiments.},
      journal  = {J. Biotechnol.},
      year     = {2017},
      volume   = {261},     
      pages    = {85--96},      
      month    = {Nov},   
      issn     = {1873-4863},      
      day      = {10},
      doi      = {10.1016/j.jbiotec.2017.06.1203},       
      language = {eng},
      url      = {http://www.ncbi.nlm.nih.gov/pubmed/28676233},
    }
    </citation>
  </citations>
</tool>
EOF
