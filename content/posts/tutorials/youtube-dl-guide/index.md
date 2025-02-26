---
categories: ["tutorials"]
title: "Best YouTuue Video Downloader : youtuue dl"
date: "2019-10-22"
ShowReadingTime: true
ShowWordCount: true
hidemeta: false
hideSummary: false
ShowBreadCrumbs: false
ShowPostNavLinks: true
ShowCodeCopyButtons: true
ShowShareButtons: false
disableShare: true
searchHidden: false
UseHugoToc: true
comments: true
---


This post is complete guide to youtube-dl installation and usage. youtube-dl is a command-line program to download videos from YouTube.com and a few more sites. It's Fast, free, flexible and most versatile YouTube downloader.

Instead, If you're looking for downloading Udacity Online Courses

Installation Commands:

```
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```

In this blog post I have given you configuration files to download:

- All Uploads of a Youtube Channel in Best available Video Format
- All Uploads of a Youtube Channel in Best available Audio Only Format
- All Videos in All Playlists of a Youtube Channel in Best available Video Format
- All Videos in All Playlists of a Youtube Channel in Best available Video Format
- All Videos in a Udemy Course Chapterwise

To use this configurations you just need to run below command, with one of the given configs

For example to download a UdemyCourse:  
youtube-dl --config-location UdemyCourse.conf

#### Config file to Download Whole youtube Channel Videos

```
#ytVideoChannel.conf

--batch-file            ytVideoChannel.txt
--download-archive      ytVideoArch.txt
--match-filter          "playlist_title != 'Trending' & playlist_title != 'Liked videos' & playlist_title != 'Favorites'"
--output                '/home/milav/Videos/%(extractor)s/%(playlist_uploader)s/%(playlist)s/%(upload_date)s - %($

--restrict-filenames
--ignore-errors
--add-metadata

--format                'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'
--write-sub
--write-auto-sub
--embed-subs
```

#### Config file to Download Whole youtube Playlist Videos

```
#ytVideoPlaylist.conf
--batch-file            ytVideoPlaylist.txt
--download-archive      ytVideoArch.txt
--match-filter          "playlist_title != 'Trending' & playlist_title != 'Liked videos' & playlist_title != 'Favorites'"
--output                '/home/milav/Videos/%(extractor)s/%(playlist_uploader)s/%(playlist)s/%(playlist_index)s -$

--restrict-filenames
--ignore-errors
--add-metadata

--format                'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'
--write-sub
--write-auto-sub
--embed-subs
```

#### Config file to Download Whole youtube Channel Audios

```
#ytAudioChannel.conf
--batch-file            ytAudioChannel.txt
--download-archive      ytAudioArch.txt
--match-filter          "playlist_title != 'Trending' & playlist_title != 'Liked videos' & playlist_title != 'Favorites'"
--output                '/home/milav/Music/%(extractor)s/%(playlist_uploader)s/%(playlist)s/%(upload_date)s - %(t$

--restrict-filenames
--ignore-errors
--add-metadata

--extract-audio
--audio-format mp3
--audio-quality 0
--embed-thumbnail
```

#### Config file to Download Whole youtube Playlist Audios

```
#ytAudioPlaylist.conf
--batch-file            ytAudioPlaylist.txt
--download-archive      ytAudioArch.txt
--match-filter          "playlist_title != 'Trending' & playlist_title != 'Liked videos' & playlist_title != 'Favorites'"
--output                '/home/milav/Music/%(extractor)s/%(playlist_uploader)s/%(playlist)s/%(playlist_index)s - $

--restrict-filenames
--ignore-errors
--add-metadata

--extract-audio
--audio-format mp3
--audio-quality 0
--embed-thumbnail
```

#### Config file to Download Whole Udemy Course Videos

```
#UdemyCourse.conf
--batch-file            UdemyCourseList.txt
--download-archive      UdemyCourseArch.txt
--output                '/home/milav/Videos/%(extractor)s/%(playlist)s/%(chapter_number)s - %(chapter)s/%(playlis$
--username              milav.dabgar@gmail.com
--password              yourPassword
--cookies               udemy-cookies.txt

--restrict-filenames
--ignore-errors
--add-metadata

--format                'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'
--write-sub
--write-auto-sub
--embed-subs
```

You can clone my github repo ([https://github.com/milavdabgar/youtube-dl-skeleton](https://github.com/milavdabgar/youtube-dl-skeleton)), containing all the above cofigs, youtube channels URLs, youtube Playlists URLs and Udemy Course Urls.

Other Most useful Usage Examples:

```
$ youtube-dl --get-filename -o '%(title)s.%(ext)s' BaW_jenozKc
youtube-dl test video ''_ä↭𝕐.mp4    # All kinds of weird characters

$ youtube-dl --get-filename -o '%(title)s.%(ext)s' BaW_jenozKc --restrict-filenames
youtube-dl_test_video_.mp4          # A simple file name

# Download YouTube playlist videos in separate directory indexed by video order in a playlist
$ youtube-dl -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' https://www.youtube.com/playlist?list=PLwiyx1dc3P2JR9N8gQaQN_BCvlSlap7re

# Download all playlists of YouTube channel/user keeping each playlist in separate directory:
$ youtube-dl -o '%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' https://www.youtube.com/user/TheLinuxFoundation/playlists

# Download Udemy course keeping each chapter in separate directory under MyVideos directory in your home
$ youtube-dl -u user -p password -o '~/MyVideos/%(playlist)s/%(chapter_number)s - %(chapter)s/%(title)s.%(ext)s' https://www.udemy.com/java-tutorial/

# Download entire series season keeping each series and each season in separate directory under C:/MyVideos
$ youtube-dl -o "C:/MyVideos/%(series)s/%(season_number)s - %(season)s/%(episode_number)s - %(episode)s.%(ext)s" https://videomore.ru/kino_v_detalayah/5_sezon/367617

# download only new videos from a playlist
youtube-dl --download-archive archive.txt "https://www.youtube.com/playlist?list=PLwiyx1dc3P2JR9N8gQaQN_BCvlSlap7re"

# Stream the video being downloaded to stdout
$ youtube-dl -o - BaW_jenozKc

# Stream the video to vlc
youtube-dl -o - "https://www.youtube.com/watch?v=BaW_jenozKcj" | vlc -
```

```
# Download best mp4 format available or any other best if no mp4 available
$ youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'

# Download best format available but no better than 480p
$ youtube-dl -f 'bestvideo[height<=480]+bestaudio/best[height<=480]'

# Download best video only format but no bigger than 50 MB
$ youtube-dl -f 'best[filesize<50M]'

# Download best format available via direct link over HTTP/HTTPS protocol
$ youtube-dl -f '(bestvideo+bestaudio/best)[protocol^=http]'

# Download the best video format and the best audio format without merging them
$ youtube-dl -f 'bestvideo,bestaudio' -o '%(title)s.f%(format_id)s.%(ext)s'
```

For Detailed guide, Visit:  
[https://github.com/ytdl-org/youtube-dl/blob/master/README.md#readme](https://github.com/ytdl-org/youtube-dl/blob/master/README.md#readme)
