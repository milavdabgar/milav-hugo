---
categories: ["linux"]
title: "Data Science Setup   Conda, Jupyter, Python, IntelliJ IDEA, R, RStudio"
date: "2019-02-25"
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


Get Anaconda for your suitable platform - Windows, Linux and Mac. We will go for Linux

```
conda install -c anaconda-nb-extensions nb_conda
conda install -c anaconda-nb-extensions/label/dev nb_conda
```

```
conda install -c conda-forge jupyter_contrib_nbextensions 
conda install -c conda-forge jupyter_nbextensions_configurator
```

Get IntelliJ IDEA from [https://www.jetbrains.com/idea/download/#section=linux](https://www.jetbrains.com/idea/download/#section=linux)

Extract the Zip and, cd to bin, run setup file idea.sh and follow simple instructions to install IDEA. At the end dont forget to "Create a Desktop Entry".

Install Python Community Edition Plugin. and setup Project structures to add your Python/Conda Environment. You can directly add your existing Environment or create a new virtual environment to use with IDEA.

Install irkernels for using Jupyter for R to created rstudio environment

```
conda install -c r r-irkernel
```

Jupyter Dark Theme Setup & reset to default theme commands:

```
conda install -c conda-forge jupyterthemesjt -t chesterishjt -r
```
