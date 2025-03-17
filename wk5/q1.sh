#!/bin/dash

# We want at least one file to do extraction on
# Hence the 0) means 0 arguments were given
case $# in
  0)
    echo "Usage: $0 <file> [<file> ...]"
    exit 1
    ;;
esac

# Holds the exit code to see if it was a success or not for all files
# Prevents us from breaking the script if we have an error but also return that there was one
status=0
for archive in "$@"
do  
    # Check if its a valid file
    # We continue you on as we want to check all the other files
    if [ ! -f archive ] 
    then
         echo "$0: error: '$archive' is not a file" >&2
        status=1
        continue
    fi

    # Case can work on file formats for different behvaiour
    # In our case we want to do extract a file differently based onthe format
     case "$archive" in
        *.tar.bz2) 
            tar xjf    "$archive" ;;
        *.tar.gz)  
            tar xzf    "$archive" ;;
        *.tar.xz)  
            tar xJf    "$archive" ;;
        *.bz2)     
            bunzip2    "$archive" ;;
        *.rar)     
            rar x      "$archive" ;;
        *.gz)      
            gunzip     "$archive" ;;
        *.tar)     
            tar xf     "$archive" ;;
        *.tbz2)    
            tar xjf    "$archive" ;;
        *.tgz)     
            tar xzf    "$archive" ;;
        *.zip)     
            unzip      "$archive" ;;
        *.jar)     
            unzip      "$archive" ;;
        *.Z)       
            uncompress "$archive" ;;
        *.7z)      
            7z x       "$archive" ;;
        *)
            echo "$0: error: '$archive' cannot be extracted" >&2
            status=1
        ;;
    esac
done

exit $status