#!/bin/sh

cd $( dirname "$(readlink -f "$0")" )

echo "cp -a ./usr/local/bin/yum-repo-splunk-create-or-update_choose_splunk_uf_version.sh /usr/local/bin/yum-repo-splunk-create-or-update_choose_splunk_uf_version.sh :"
cp -a ./usr/local/bin/yum-repo-splunk-create-or-update_choose_splunk_uf_version.sh /usr/local/bin/yum-repo-splunk-create-or-update_choose_splunk_uf_version.sh

echo "cp -a ./usr/local/bin/splunk_UF_versions_to_Download.txt /usr/local/bin/splunk_UF_versions_to_Download.txt :"
cp -a ./usr/local/bin/splunk_UF_versions_to_Download.txt /usr/local/bin/splunk_UF_versions_to_Download.txt


echo "set selinux attributes:"
chcon system_u:object_r:bin_t:s0 /usr/local/bin/yum-repo-splunk-create-or-update_choose_splunk_uf_version.sh

echo "yum install needed prerequisites:"
yum install createrepo coreutils curl mailx -y

#prompt for splunk.com credentials instead of saving to file.

# echo '------------'
# USERFILE=~/.yum-repo-splunk
# if ! [ -f "${USERFILE}" ]; then
# 	echo "create a credentials file to hold splunk.com credentials: ${USERFILE}"
# 	touch "${USERFILE}"
# 	chmod 660 "${USERFILE}"
# 	echo 'SPLUNKUSER=PUTSPLUNKDOTCOMUSERNAMEHERE' >> "${USERFILE}"
# 	echo 'SPLUNKPASS=PUTSPLUNKDOTCOMPASSWORDHERE' >> "${USERFILE}"
# 	echo "File ${USERFILE} has been created if needed."
# 	echo "Make sure to input/update your splunk.com SPLUNKUSER and SPLUNKPASS there."
# else
# 	echo "Please verify splunk.com credentials are correct in file: ${USERFILE}"
# fi
