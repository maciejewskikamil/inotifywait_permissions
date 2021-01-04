USER=""
DIR=""
inotifywait -m $DIR -e modify,create,moved_to -q -r --format %w%f | while read FILE; do
        if [[ -f $FILE ]]; then
                setfacl -m u:$USER:r $FILE
                echo "Set permission to file: $FILE"
        elif [[ -d $FILE ]]; then
                setfacl -m u:$USER:rx $FILE
                echo "Set permission to folder: $FILE"
        else
                setfacl -m u:$USER:r $FILE
                echo "Warning! This is not a file or folder. Set file permission to: $FILE"
        fi
done
