#!/bin/zsh
# inpath varifies that a specified program is either valid as is
# || can be found in the path directory

in_path()
{
# giving a command in the path, tries to find the command. Returns
# 0 if found and executable, and returns 1 if not.
# NOE: this temporarily modifies the internal field separator (IFS)
# but restores it upon completiong
echo "$IFS"
cmd=$1
ourpath=$2
result=1

echo "$IFS"

for directory in "${ourpath//:/'\n'}"
    do
       echo "$directory/$cmd"
        if [ -x $directory/$cmd ] ; then

            result=0    # if we're here , we found the command
        fi
    done


    return $result
}

checkForCmdInPath()
{

    var=$1
#    for singlepath in "${PATH//:/'\n'}"
#        do
#          echo "singlepath is $singlepath"
#        done
#    echo "var is $var"
    if [ $var != "" ] ; then
      if [ "${var:0:1}" = "/" ] ; then

        if [ !  -x $var ] ; then
          return 1
        fi
      elif !  in_path $var "$PATH" ; then
        return 2
      fi

    fi
}

if [ $# -ne 1 ] ; then
  echo "Usage: $0 command" >&2
  exit 1
fi

checkForCmdInPath "$1"
case $? in
  0) echo "$1 found in PATH" ;;
  1) echo "$1 not found in path or not executable" ;;
  2) echo "$1 not found in PATH" ;;
esac

exit 0
