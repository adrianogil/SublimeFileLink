file_name=$1
line_in_file=$2

sha1_file_name=$(echo -n $file_name":"$line_in_file | openssl sha1 | cut -c10-)

if [ ${file_name: -5} == ".note" ]
then
    sha1_file_path=~/Notes/filelinks/$sha1_file_name'.sh'
else
    sha1_file_path=~/filelinks/$sha1_file_name'.sh'
fi


echo '# File Link'                          > $sha1_file_path
echo ''                                    >> $sha1_file_path
echo 'sublime "'$file_name'":'$line_in_file  >> $sha1_file_path

chmod +x $sha1_file_path

echo $sha1_file_path