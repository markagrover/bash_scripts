#!/bin/bash
# Define the variables with values I want to replace
CLASS_NAME=''
STYLES=false
FUNCTIONAL=false
MAP_STATE=false

# Get params passed in. semicolon after teh character represents a parameter passed into the  flag
# OPTARG if the param passed to the flag
while getopts ":fmsn:" opt; do
    case ${opt} in
    f) FUNCTIONAL=true
    ;;
    m) MAP_STATE=true
    ;;
    n) CLASS_NAME=${OPTARG}
    ;;
    s) STYLES=true
    ;;
    \? ) echo "Usage: cmd [-f] [-s] [-M] [-C]"
    ;;
  esac
done

function render_template(){
    eval "echo \"$(cat $1)\""
}

function generate_file(){
    echo "### Creating file"
    render_template ~/myAssets/bin/react_class.tmpl > $1.js
}

function generate_functional_file(){
    echo "### Creating file"
    render_template ~/myAssets/bin/react_function.tmpl > $1.js
}

function generate_mapped_state_file(){
    echo "### Creating file"
    render_template ~/myAssets/bin/mapped_state.tmpl > $1.js
}

function create_styles_dir_and_file(){
    mkdir -p styles
    cd styles
    touch styles.css
}

if [ $FUNCTIONAL = false ]
    then
    if [ $MAP_STATE = false ]
        then
            generate_file $CLASS_NAME
        fi
    fi
if [ $FUNCTIONAL = true ]
    then
        generate_functional_file $CLASS_NAME
    fi


if [ $MAP_STATE = true ]
    then
        generate_mapped_state_file $CLASS_NAME
    fi


if [ $STYLES ]
    then
        create_styles_dir_and_file
    fi
