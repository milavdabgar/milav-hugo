#!/bin/bash

function clean_public() {
    echo "Cleaning public directory..."
    hugo --cleanDestinationDir
}

function serve() {
    echo "Starting Hugo server..."
    hugo server -D
}

function build() {
    echo "Building site..."
    hugo --minify
}

function update_post_metadata() {
    local post=$1
    if [ -z "$post" ]; then
        echo "Please provide a post path"
        return 1
    fi
    
    # Add common metadata to post
    sed -i '' '2i\
ShowReadingTime: true\
ShowWordCount: true\
ShowBreadCrumbs: true\
ShowPostNavLinks: true\
ShowCodeCopyButtons: true\
disableShare: false\
searchHidden: false\
' "$post"
}

case "$1" in
    "clean")
        clean_public
        ;;
    "serve")
        serve
        ;;
    "build")
        build
        ;;
    "update-meta")
        update_post_metadata "$2"
        ;;
    *)
        echo "Usage: $0 {clean|serve|build|update-meta POST_PATH}"
        exit 1
        ;;
esac
