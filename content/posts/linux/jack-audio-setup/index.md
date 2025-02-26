---
categories: ["linux"]
title: "JackSetup"
date: "2018-11-05"
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


Edit the \*.conf found in the directory '/etc/security/limits.d' with the below content:  
@realtime - rtprio 99  
@realtime - memlock unlimited  
and run the following commands in terminal:

```
$ sudo groupadd realtime
$ sudo usermod -a -G realtime yourUserID
```

$latex  Testing latex $

\[latex\]E=mc^2\[/latex\]

$$E=mc^2$$

\[latex\]E=mc^2\[/latex\]
