---
author: ["Hugo Authors", "PaperMod Contributors"]
title: "Rich Content and Shortcodes"
date: "2019-03-10"
description: "A brief description of Hugo Shortcodes"
tags: ["markdown", "shortcodes", "privacy"]
ShowToc: true
---

Hugo ships with several [Built-in Shortcodes](https://gohugo.io/content-management/shortcodes/#use-hugos-built-in-shortcodes) for rich content, along with a [Privacy Config](https://gohugo.io/about/hugo-and-gdpr/) and a set of Simple Shortcodes that enable static and no-JS versions of various social media embeds.

<!--more-->

---

## Figure Shortcode ([PaperMod enhanced](https://github.com/adityatelange/hugo-PaperMod/commits/master/layouts/shortcodes/figure.html))

{{< figure src="https://source.unsplash.com/Z0lL0okYjy0" attr="Photo by [Aditya Telange](https://unsplash.com/@adityatelange?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash) on [Unsplash](https://unsplash.com/photos/Z0lL0okYjy0?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash)" align=center link="https://unsplash.com/photos/Z0lL0okYjy0" target="_blank" >}}

---
## Figure Shortcode (Hugo Official)

{{< figure
  src="/images/examples/zion-national-park.jpg"
  alt="A photograph of Zion National Park"
  link="https://www.nps.gov/zion/index.htm"
  caption="Zion National Park"
  class="ma0 w-75"
>}}

---

## QR Code

{{< qr text="https://gohugo.io" />}}

---

## Instagram

{{< instagram CxOWiQNP2MO >}}

---

## X Shortcode

{{< x user="adityatelange" id="1724414854348357922" >}}

---

## YouTube

{{< youtube hjD9jTi_DQ4 >}}

---
