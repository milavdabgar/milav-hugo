#!/bin/bash

# Create category directories
mkdir -p content/posts/{programming,linux,tutorials,data-science,raspberry-pi}

# Programming
mv content/posts/2018-09-15-8051-asm-codes content/posts/programming/assembly-8051-examples
mv content/posts/2018-09-26-8051-c-codes content/posts/programming/c-8051-examples
mv content/posts/2018-09-26-8085-asm-codes content/posts/programming/assembly-8085-examples
mv content/posts/2018-09-26-pycv-codes content/posts/programming/python-opencv-examples
mv content/posts/2021-03-16-python-lists content/posts/programming/python-lists-guide

# Linux & System Setup
mv content/posts/2018-12-19-arch-linux-minimal-installation-with-kde-plasma content/posts/linux/arch-linux-kde-installation
mv content/posts/2018-12-19-fixing-manjaro-boot-problems content/posts/linux/manjaro-boot-fixes
mv content/posts/2018-11-05-jacksetup content/posts/linux/jack-audio-setup
mv content/posts/2019-02-25-data-science-setup-conda-jupyter-python-intellij-idea-r-rstudio content/posts/linux/data-science-environment-setup

# Tutorials & Guides
mv content/posts/2019-06-18-migrate-your-wordpress-site-from-http-to-https content/posts/tutorials/wordpress-https-migration
mv content/posts/2019-09-16-udacity-courses-free-download-using-udacimak content/posts/tutorials/download-udacity-courses
mv content/posts/2019-10-22-best-youtube-video-downloader-youtube-dl content/posts/tutorials/youtube-dl-guide
mv content/posts/2020-05-16-coursera-courses-free-download-using-coursera-dl content/posts/tutorials/download-coursera-courses
mv content/posts/2024-09-23-writing-wordpress-posts-using-markdown content/posts/tutorials/wordpress-markdown-writing
mv content/posts/2019-05-05-karate-basics content/posts/tutorials/karate-fundamentals

# Data Science & ML
mv content/posts/2021-03-17-deep-learning-comparing-various-optimization-techniques content/posts/data-science/deep-learning-optimization-comparison

# Raspberry Pi Projects
mv content/posts/2018-11-02-raspberrypisetup content/posts/raspberry-pi/basic-setup
mv content/posts/2019-04-30-owncloud-with-raspberry-pi content/posts/raspberry-pi/owncloud-server
mv content/posts/2019-06-07-nextcloud-with-raspberry-pi content/posts/raspberry-pi/nextcloud-server

# Update front matter for all posts
find content/posts -type f -name "index.md" | while read post; do
    dir=$(dirname "$post")
    category=$(echo "$dir" | cut -d'/' -f3)
    
    # Add category to front matter if not present
    if ! grep -q "^categories:" "$post"; then
        sed -i '' "/^---/a\\
categories: [\"${category}\"]\\
" "$post"
    fi
    
    # Clean up the title if needed (remove date prefixes, convert dashes to spaces)
    title=$(grep "^title:" "$post" | sed 's/^title: *"//' | sed 's/"$//')
    clean_title=$(echo "$title" | sed 's/^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-//' | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')
    
    if [ "$title" != "$clean_title" ]; then
        sed -i '' "s/^title: .*/title: \"$clean_title\"/" "$post"
    fi
done
