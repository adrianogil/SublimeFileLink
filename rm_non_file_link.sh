# Remove files that are not linked

for f in *; do
    linked_by=$(cat ~/filelinks/*.sh | grep $f)
    if [ -z "$linked_by" ]
    then
        echo 'Non Linked '$f
        rm $f
    else
        echo 'Linked '$f
    fi
done