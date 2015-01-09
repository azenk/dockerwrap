#!/bin/sh
allowed_variables=$(cat /etc/allowed_variables)
config_file_paths=$(cat /etc/config_manifest)

sedscript=$(mktemp)
for varname in ${allowed_variables} ; do
	value=$(eval echo -n \$${varname} | sed 's/%/\\%/g')
	echo "s%\${${varname}}%${value}%g" 
done > ${sedscript}

for file in "${config_file_paths}" ; do
	sed -f ${sedscript} -i ${file}
done
rm ${sedscript}

exec "$@"
