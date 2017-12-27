#!/bin/bash
VERSION=59
if [[ $# -eq 0 ]] ; then
	echo $"Usage '$0 -f=(path to file)|--file=(path to file)'.";
    exit 1;
fi

for i in "$@"
do
	case $i in
		-f=*|--file=*)
			path="${i#*=}.ver";
			oldVersion=`cat "$path" | grep "VERSION=\\S*" | awk '{print $0}' | sed -e "s/VERSION=//"`;

			newVersion=$(($oldVersion+1));
			sudo sed -i".bac" "s/VERSION=\\S*/VERSION=$newVersion/" "$path";
			printf "File saving to %s from old version %s to new version %s" $path $oldVersion $newVersion;
			notify-send -t 2000 --icon=info 'File saved' "File saving to $path from old version $oldVersion to new version $newVersion";
			printf "#!/bin/bash\n## = = = VERSION = = =\nVERSION=$newVersion" > "$path";
		shift # past argument=value
		;;

		*)
		    # unknown option
			echo "Usage '$0 -f=(path to file)|--file=(path to file)'.";
			exit 1;
		;;
	esac
done
