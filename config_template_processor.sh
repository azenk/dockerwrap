#!/bin/bash
config_file_paths=$(cat $1)
shift

for file in "${config_file_paths}" ; do
	tempfile=$(mktemp)
	while read -r line ; do
    		while [[ "$line" =~ (\$\{[a-zA-Z_][a-zA-Z_0-9]*\}) ]] ; do
        		LHS=${BASH_REMATCH[1]}
        		RHS="$(eval echo "\"$LHS\"")"
        		line=${line//$LHS/$RHS}
    		done
    		echo "$line" >> ${tempfile}
	done < ${file}
	mv ${tempfile} ${file}
done

exec "$@"
