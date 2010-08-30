#!/bin/bash

tag_from_dir () 
{
    if [ ! -d $2 ] ; then
        echo "generating tags from $1..."
        mkdir $2
        cd $2
        ctags -R --c++-kinds=+p --fields=+iaS --extra=+q $1
        cd ..
    else
        echo "`pwd`/'$2' already exist, skip."
    fi
}

tags_from_dir ()
{
    cwd=`pwd`
    root_dir=$1
    echo "generating tags from $root_dir..."
    ctags -R --c++-kinds=+p --fields=+iaS --extra=+q $root_dir
    cd $root_dir
    directory_array=(*);

    for dir in ${directory_array[@]}; do
        if [ -d $dir ] ; then
            cd $cwd
            tag_from_dir "$root_dir/$dir" $dir
            cd $root_dir
        fi
    done
}

if [ $# -eq 1 ]; then
    tags_from_dir $1
else
    echo "usage: $0 dir"
fi
