---
categories: ["programming"]
title: "Python Lists"
date: "2021-03-16"
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


#### Python program to sum all the items in a list.

<iframe width="800" height="500" frameborder="0" src="http://pythontutor.com/iframe-embed.html#code=def%20sum_list%28items%29%3A%0A%20%20%20%20sum_numbers%20%3D%200%0A%20%20%20%20for%20x%20in%20items%3A%0A%20%20%20%20%20%20%20%20sum_numbers%20%2B%3D%20x%0A%20%20%20%20return%20sum_numbers%0Aprint%28sum_list%28%5B1,2,-8%5D%29%29%0A&amp;codeDivHeight=400&amp;codeDivWidth=350&amp;cumulative=false&amp;curInstr=13&amp;heapPrimitives=nevernest&amp;origin=opt-frontend.js&amp;py=3&amp;rawInputLstJSON=%5B%5D&amp;textReferences=false"></iframe>

#### Python program to get the largest number from a list.

<iframe width="800" height="500" frameborder="0" src="http://pythontutor.com/iframe-embed.html#code=def%20max_num_in_list%28%20list%20%29%3A%0A%20%20%20%20max%20%3D%20list%5B%200%20%5D%0A%20%20%20%20for%20a%20in%20list%3A%0A%20%20%20%20%20%20%20%20if%20a%20%3E%20max%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20max%20%3D%20a%0A%20%20%20%20return%20max%0Aprint%28max_num_in_list%28%5B1,%202,%20-8,%200%5D%29%29%0A&amp;codeDivHeight=400&amp;codeDivWidth=350&amp;cumulative=false&amp;curInstr=0&amp;heapPrimitives=nevernest&amp;origin=opt-frontend.js&amp;py=3&amp;rawInputLstJSON=%5B%5D&amp;textReferences=false"></iframe>

#### Python program to remove duplicates from a list.

<iframe width="800" height="500" frameborder="0" src="http://pythontutor.com/iframe-embed.html#code=a%20%3D%20%5B10,20,30,20,10,50,60,40,80,50,40%5D%0A%0Adup_items%20%3D%20set%28%29%0Auniq_items%20%3D%20%5B%5D%0Afor%20x%20in%20a%3A%0A%20%20%20%20if%20x%20not%20in%20dup_items%3A%0A%20%20%20%20%20%20%20%20uniq_items.append%28x%29%0A%20%20%20%20%20%20%20%20dup_items.add%28x%29%0A%0Aprint%28dup_items%29%0A&amp;codeDivHeight=400&amp;codeDivWidth=350&amp;cumulative=false&amp;curInstr=0&amp;heapPrimitives=nevernest&amp;origin=opt-frontend.js&amp;py=3&amp;rawInputLstJSON=%5B%5D&amp;textReferences=false"></iframe>

#### Python function that takes two lists and returns True if they have at least one common member.

<iframe width="800" height="500" frameborder="0" src="http://pythontutor.com/iframe-embed.html#code=def%20common_data%28list1,%20list2%29%3A%0A%20%20%20%20%20result%20%3D%20False%0A%20%20%20%20%20for%20x%20in%20list1%3A%0A%20%20%20%20%20%20%20%20%20for%20y%20in%20list2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20if%20x%20%3D%3D%20y%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20result%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20result%0Aprint%28common_data%28%5B1,2,3,4,5%5D,%20%5B5,6,7,8,9%5D%29%29%0Aprint%28common_data%28%5B1,2,3,4,5%5D,%20%5B6,7,8,9%5D%29%29%0A&amp;codeDivHeight=400&amp;codeDivWidth=350&amp;cumulative=false&amp;curInstr=0&amp;heapPrimitives=nevernest&amp;origin=opt-frontend.js&amp;py=3&amp;rawInputLstJSON=%5B%5D&amp;textReferences=false"></iframe>

#### Python program to get the difference between the two lists.

<iframe width="800" height="500" frameborder="0" src="http://pythontutor.com/iframe-embed.html#code=list1%20%3D%20%5B1,%203,%205,%207,%209%5D%0Alist2%3D%5B1,%202,%204,%206,%207,%208%5D%0Adiff_list1_list2%20%3D%20list%28set%28list1%29%20-%20set%28list2%29%29%0Adiff_list2_list1%20%3D%20list%28set%28list2%29%20-%20set%28list1%29%29%0Atotal_diff%20%3D%20diff_list1_list2%20%2B%20diff_list2_list1%0Aprint%28total_diff%29%0A&amp;codeDivHeight=400&amp;codeDivWidth=350&amp;cumulative=false&amp;curInstr=0&amp;heapPrimitives=nevernest&amp;origin=opt-frontend.js&amp;py=3&amp;rawInputLstJSON=%5B%5D&amp;textReferences=false"></iframe>
