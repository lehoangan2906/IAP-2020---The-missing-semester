echo "Starting program at $(date)"     # date will be substited

echo "Running program $0 with $# arguments with pid $$"

# $0 is the name of the script we are running
# $# is the number of arguments that we are giving to the command
# ## is the process ID of the command that is running
# $@ is meaning expand to all arguments 

for file in "$@"; do
    grep foobar "$file" > /dev/null 2> /dev/null      # grep - search for a subtring in one file
    # we are searching for the string foobar in the file 
    # > means redirecting the output to some file, here wwe redirect the output to dev/null, which is always discarded
    # 2> means redirecting the standard error

    # when pattern is not found, grep has exit status
    # we redirect STDOUT and STDERR to a null register

    # $? means get the error code, 0 means True and 1 means False 
    # -ne means not equal

    if [[ "$?" -ne 0 ]]; then
        echo "File $file does not have any foobar, adding one"
        echo "# foobar" >> "$file"

        # >> means append at the end of the file

    fi
done 
