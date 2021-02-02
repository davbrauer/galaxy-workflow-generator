#! /usr/bin/env bash

## modify galaxy config
sed -i -E -e 's/(^\s*)#+(\s*allow_user_deletion\s*[:=]\s*).*/\1\2true/' \
  -e 's/(^\s*)#+(\s*require_login\s*[:=]\s*).*/\1\2true/' \
  -e 's/(^\s*)#+(\s*brand\s*[:=]\s*).*/\1\2de\.STAIR/' \
  -e 's/(^\s*)#+(\s*enable_quotas\s*[:=]\s*).*/\1\2true/' \
  -e 's/(^\s*)#+(\s*welcome_url.+)/\1\2/' \
  -e 's/(^\s*)#+(\s*show_welcome_with_login\s*[:=]\s*).*/\1\2true/' \
  -e 's/(^\s*)#+(\s*webhooks_dir.+)/\1\2/' \
  -e 's/(^\s*)#+(\s*tour_config_dir.+)/\1\2/' \
  -e 's/(^\s*)#+(\s*tool_path.+)/\1\2/' \
  -e 's/(^\s*)#+(\s*conda_auto_install\s*[:=]).*/\1\2 true/' \
  -e 's/(^\s*)#+(\s*conda_auto_init\s*[:=]).*/\1\2 true/' \
  -e 's/(^\s*)#+(\s*conda_ensure_channels\s*[:=]).*/\1\2 iuc,bioconda,conda-forge,defaults/' \
  -e 's/(^\s*)#+(\s*new_user_dataset_access_role_default_private\s*[:=]\s*).*/\1\2true/' \
  -e 's/(^\s*)#+(\s*allow_user_dataset_purge\s*[:=]\s*).*/\1\2true/' $GALAXY_CONFIG_FILE


## rename get data to upload data in tools section
sed -i -E 's/Get\s+Data/Upload Data/' $GALAXY_ROOT/integrated_tool_panel.xml


## add own tools (xml) to tools section
head -4 $GALAXY_ROOT/config/tool_conf.xml.sample > $GALAXY_ROOT/config/tool_conf.xml
echo '  </section>' >> $GALAXY_ROOT/config/tool_conf.xml
echo '  <section id="destair_visualization" name="Visualization">' >> $GALAXY_ROOT/config/tool_conf.xml
for f in $(find tools -type f -name "*.xml" -printf '%P\n'); do
	echo "    <tool file=\"$f\" />"
done >> $GALAXY_ROOT/config/tool_conf.xml
tail -2 $GALAXY_ROOT/config/tool_conf.xml.sample >> $GALAXY_ROOT/config/tool_conf.xml


## move welcome page, atoms, webhooks, workflows where they belong to
mv /tmp/web/* $GALAXY_ROOT/static
rm -rf /tmp/web

find /tmp/atoms -type f -name "*.yaml" -exec mv "{}" $GALAXY_ROOT/config/plugins/tours \;
find /tmp/atoms -type f -name "*.html" -exec mv "{}" $GALAXY_ROOT/static \;
rm -rf /tmp/atoms

find /tmp/webhooks -mindepth 1 -maxdepth 1 -type d -exec mv "{}" $GALAXY_ROOT/config/plugins/webhooks \;
rm -rf /tmp/webhooks

find /tmp/tools -mindepth 1 -maxdepth 1 -type d -exec cp -r "{}" $GALAXY_ROOT/tools \; -exec cp -r "{}" $GALAXY_ROOT/test-data \;
rm -rf /tmp/tools
# source $GALAXY_CONDA_PREFIX/bin/activate
# conda install -y -c iuc -c bioconda -c conda-forge -c defaults $(grep -F 'requirement type' /tmp/tools/*/destair_heatmap.xml | sed -E 's/(.*)(version=")(.+)(">)(.+)(<.*)/\5=\3/' | xargs echo)


## add publications to upload tool for automated export
sed -i '$ d' $GALAXY_ROOT/tools/data_source/upload.xml
cat << EOF >> $GALAXY_ROOT/tools/data_source/upload.xml
  <citations>
    <citation type="bibtex">@Article{de.STAIR-workflow-generator,
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

    <citation type="bibtex">@Article{Galaxy,
      author   = {Afgan, Enis and Baker, Dannon and Batut, B{\'e}r{\'e}nice and Van Den Beek, Marius and Bouvier, Dave and {\v{C}}ech, Martin and Chilton, John and Clements, Dave and Coraor, Nate and Gr{\"u}ning, Bj{\"o}rn A and others},
      title    = {The Galaxy platform for accessible, reproducible and collaborative biomedical analyses: 2018 update.},
      journal  = {Nucleic acids research},
      year     = {2018},
      volume   = {46},
      number   = {W1},
      pages    = {W537--W544},
      doi      = {10.1093/nar/gky379},
      language = {eng},
      url      = {https://academic.oup.com/nar/article/46/W1/W537/5001157},
    }
    </citation>

  </citations>
</tool>
EOF
