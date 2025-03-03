---
categories: ["tutorials"]
title: "Writing Wordpress Posts using Markdown"
date: "2024-09-23"
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
tags: ["markdown", "demo"]
---

# Writing Wordpress Posts using Markdown

This post demonstrates various markdown features that should render well in theme-agnostic Hugo sites.

## Text Formatting

Regular text, **bold text**, *italic text*, and ~~strikethrough~~.

## Lists

### Unordered List
- Item 1
- Item 2
  - Subitem 2.1
  - Subitem 2.2
- Item 3

### Ordered List
1. First item
2. Second item
   1. Subitem 2.1
   2. Subitem 2.2
3. Third item

## Code Blocks

Inline code: `console.log('Hello, World!');`

```python
def hello_world():
    print("Hello, World!")
    return True
```

## Tables

| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |

## Blockquotes

> This is a blockquote.
> 
> It can span multiple paragraphs.

## Links and Images

[Link to Hugo](https://gohugo.io/)

![Hugo Logo](https://d33wubrfki0l68.cloudfront.net/c38c7334cc3f23585738e40334284fddcaf03d5e/2e17c/images/hugo-logo-wide.svg)

## Math (if supported by theme)

Inline math: $E = mc^2$

Display math:

$$
\begin{align}
\dot{x} &= \sigma(y-x) \\
\dot{y} &= \rho x - y - xz \\
\dot{z} &= -\beta z + xy
\end{align}
$$