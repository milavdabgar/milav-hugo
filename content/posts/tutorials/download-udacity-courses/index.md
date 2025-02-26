---
categories: ["tutorials"]
title: "Udacity Courses Free Download using Udacimak"
date: "2019-09-16"
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


Udacity is today one of the best place to get free open education, specifically in CS Domain. Udacity keep almost all its courses free. You can download all the free courses using a Nodejs package udacimak. This post is your Complete guide to download all the free courses (Including Purchased NanoDegrees) available on Udacity using udacimak - a Nodejs based package.

Before Getting down the post, If youre not familliar with a great tool called youtube-dl to download youtube Video(Including Playlists and Whole Channel), then visit my blog to know more about it - [https://planetmilav.com/best-youtube-video-downloader-youtube-dl/](https://planetmilav.com/best-youtube-video-downloader-youtube-dl/)

In this blog I've explained  
how to install Nodejs?  
How to install udacimak package using npm?  
How to Download Free Udacity Courses using udacimak?

Install Nodejs on Debian Based System(Ubuntu/ Mint/ Raspbian):

```
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
```

For More Details on Installation of Nodejs, Visit: [https://nodejs.org/en/download/package-manager/](https://nodejs.org/en/download/package-manager/)

Install udacimak Node Package:

```
sudo npm install -g udacimak --unsafe-perm=true --allow-root
```

For Detailed Installation Instructions of udacimak package, Visit: [https://github.com/udacimak/udacimak/wiki/Install-&-Update](https://github.com/udacimak/udacimak/wiki/Install-&-Update)

Before you can start using udacimak you need to provide your udacity Account acccess key to udacimak:

```
udacimak settoken YOUR_UDACITY_AUTH_TOKEN
```

You can get your key from **Developer Tools** > **Application** > **Storage > Cookies >** `_jwt` key

Once It's done, Simple Usage of udacimak to Download Free Udacity Courses:

```
udacimak download --targetdir ~/udacimakCourses/jsons ud611 ud007
udacimak renderdir ~/udacimakCourses/jsons --targetdir ~/udacimakCourses/renders
```

For Advanced option and other details, Visit: [https://github.com/udacimak/udacimak/wiki/How-to-Use](https://github.com/udacimak/udacimak/wiki/How-to-Use)

Simply get udacity Course IDs of the Courses that you're interested in and paste their IDs (e.g. ud611, ud 007).

Alternatively I've You can use below Course IDs for Popular NanoDegrees Below:

```
Front-End Web Developer Nanodegree
ud304 ud893 ud882 ud804 ud245 ud015 ud292 ud884 ud860 ud110 ud989 ud549

Full Stack Web Developer Nanodegree
ud206 ud775 ud456 ud303 ud256 ud197 ud088 ud330 ud388 ud299 ud891 ud989 ud110

Senior Web Developer Nanodegree
ud890 ud892 ud898 ud899 ud891 ud894 ud897 

Data Analyst Nanodegree
ud827 ud201 ud170 ud032 ud651 ud120 ud507 ud304 ud804 ud257

Machine Learning Engineer Nanodegree
ud827 ud359 cs271 ud600 ud730 cs373 ud501 

Predictive Analytics for Business Nanodegree
ud976 ud977 ud978 ud1006 ud979 ud980 ud981 

Android Basics Nanodegree
ud834 ud836 ud839 ud843 ud845 

Android Developer Nanodegree
ud851 ud855 ud867 ud862 ud875A 

iOS Developer Nanodegree
ud585 ud788 ud421 ud325 ud607 ud1009

Mobile Game Developer Nanodegree
ud405 ud406 ud407

Tech Entrepreneur Nanodegree
ud509 ud518 ud723 ud719 ud806
```

Or Alternatively I've also collected IDs of all the Free Courses available Today on Udacity, and Here's the List:

```
Artificial Intelligence
cs271 cs373 ud104 ud120 ud185 ud187 ud188 ud257 ud262 ud381 ud409 ud501 ud507 ud600 ud617 ud651 ud741 ud758 ud810 ud827 ud919 ud953 ud954

Data Science
ud150 ud170 ud198 ud201 ud359 ud404

Programming and Development
cs212 cs215 cs258 cs259 cs262 cs291 cs313 cs387 ph100 ps001 st095 st101 ud001 ud007 ud032 ud0351 ud0352 ud061 ud088 ud098 ud1000 ud1006 ud1009 ud1012 ud1022 ud1025 ud1026 ud1028 ud1031 ud1034 ud1038 ud109 ud110 ud1110 ud117 ud123 ud1337 ud150 ud162 ud168 ud169 ud171 ud667 ud189 ud197 ud199 ud206 ud210 ud245 ud256 ud268 ud270 ud272 ud279 ud281 ud282 ud283 ud292 ud299 ud303 ud325 ud330 ud333 ud353 ud354 ud356 ud357 ud358 ud388 ud400 ud401 ud405 ud406 ud407 ud421 ud436 ud459 ud549 ud576 ud585 ud595 ud607 ud610 ud611 ud615 ud711 ud774 ud777 ud788 ud803 ud805 ud808 ud811 ud821 ud825 ud834 ud836 ud839 ud843 ud845 ud849 ud851 ud855 ud860 ud862 ud864 ud867 ud875C ud882 ud884 ud888 ud890 ud891 ud892 ud893 ud894 ud897 ud898 ud899 ud9011 ud9012 ud902 ud905 ud923 ud989 ud994

Autonomous Systems
ud0419 cs222 ud9876 

Business
ep245 ud509 ud518 ud719 ud723 ud806 ud976 ud977 ud978 ud979 ud980 ud981

Career
ud1001 ud1011 ud240 ud241 ud242 ud243 ud244 ud250 ud251 ud252 ud513 ud944
```

If you're someone like me and simply juts want to grab all the available Udacity Free Courses, then simply Run Below Two Commands:

```
udacimak download --targetdir ~/udacimakCourses/jsons cs271 cs373 ud104 ud120 ud185 ud187 ud188 ud257 ud262 ud381 ud409 ud501 ud507 ud600 ud617 ud651 ud741 ud758 ud810 ud827 ud919 ud953 ud954 ud150 ud170 ud198 ud201 ud359 ud404 cs212 cs215 cs258 cs259 cs262 cs291 cs313 cs387 ph100 ps001 st095 st101 ud001 ud007 ud032 ud0351 ud0352 ud061 ud088 ud098 ud1000 ud1006 ud1009 ud1012 ud1022 ud1025 ud1026 ud1028 ud1031 ud1034 ud1038 ud109 ud110 ud1110 ud117 ud123 ud1337 ud150 ud162 ud168 ud169 ud171 ud667 ud189 ud197 ud199 ud206 ud210 ud245 ud256 ud268 ud270 ud272 ud279 ud281 ud282 ud283 ud292 ud299 ud303 ud325 ud330 ud333 ud353 ud354 ud356 ud357 ud358 ud388 ud400 ud401 ud405 ud406 ud407 ud421 ud436 ud459 ud549 ud576 ud585 ud595 ud607 ud610 ud611 ud615 ud711 ud774 ud777 ud788 ud803 ud805 ud808 ud811 ud821 ud825 ud834 ud836 ud839 ud843 ud845 ud849 ud851 ud855 ud860 ud862 ud864 ud867 ud875C ud882 ud884 ud888 ud890 ud891 ud892 ud893 ud894 ud897 ud898 ud899 ud9011 ud9012 ud902 ud905 ud923 ud989 ud994 ud0419 cs222 ud9876 ep245 ud509 ud518 ud719 ud723 ud806 ud976 ud977 ud978 ud979 ud980 ud981 ud1001 ud1011 ud240 ud241 ud242 ud243 ud244 ud250 ud251 ud252 ud513 ud944
```

```
udacimak renderdir ~/udacimakCourses/jsons --targetdir ~/udacimakCourses/renders
```

In Case you're interested in downloading All the Coursera courses with same ease, Have a look at my other post - [Coursera Courses Free Download using coursera-dl](https://planetmilav.com/coursera-courses-free-download-using-coursera-dl/)

Happy Learning...!
