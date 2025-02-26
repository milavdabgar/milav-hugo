---
categories: ["tutorials"]
title: "Coursera Courses Free Download using coursera dl"
date: "2020-05-16"
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


This post is your Complete guide to download all the free courses (Including Purchased Specialization) available on Coursera using coursera-dl - a command line based package.

[Coursera](https://coursera.org/) is one of the popular and largest online educational platform. It has partnered with various Universities, educational institutions and other organizations to offer online courses, specializations and degrees in numerous subjects, including engineering, humanities, medicine, biology, social sciences, mathematics, business, computer science, digital marketing, data science, and a lot more.

Say hello to “[Coursera-dl](https://github.com/coursera-dl/coursera-dl)”, a Python script that can be used to download lecture resources (e.g., videos, ppt, etc) for Coursera classes. Of course, you can use many downloader programs such as Youtube-dl, You-Get, Wget etc., to download the videos and other course materials. But the problem is those programs have the following limitations in general:

- Video names have numbers in them, but this does not correspond to the actual order. So, you may need to manually rename the videos one by one. It is time-consuming and bit difficult to find the videos in correct order.
- Using wget in a for loop picks up extra videos which are not posted/linked, and these are sometimes duplicates.
- You can not download multiple courses at once.

Coursera-dl will solve all of the above problems and will also give you some added features while Coursera Courses Free Downloading.

You can install coursera-dl using pip, It's damn that simple. Just throw the below command at you linux terminal

```
sudo pip install coursera-dl
```

To download all the course materials of course. (you must be enrolled to the course, or else coursera will not provide access to the content, and coursera-dl will fail). Neither me nor the developer of this script is responsible for any violations of Coursera Terms Of Use.

Before you can use the tool you need to get your CAUTH key of coursera.  
To get your CAUTH,

Login to Coursera using you id and password.  
Press F12 -> Application -> Cookies -> Coursera -> CAUTH -> Value  
Just copy the value and keep it with you, we will need this.

```
coursera-dl -u <urUserName> -p <urPassword -ca <urCAUTHKey> courseraCourseSlug
```

Take for example you want to download the course, "Introduction to Deep Learning" (url - [https://www.coursera.org/learn/intro-to-deep-learning](https://www.coursera.org/learn/intro-to-deep-learning))  
For this course courseraCourseSlug = intro-to-deep-learning.  
The complete command will look something like this:

```
coursera-dl -u myid@gmail.com -p myPassword -ca SxFSDFEHvffdg intro-to-deep-learning
```

The above course is part of specialization "Advanced Machine Learning Specialization" (URL - [https://www.coursera.org/specializations/aml](https://www.coursera.org/specializations/aml))  
The specialization slug = 'aml'

The Beauty of coursera-dl is that you can download all the courses under any specialization using one simple command. For example you can download all the courses under specialization "Advanced Machine Learning Specialization" using below command:

```
coursera-dl -u myid@gmail.com -p myPassword -ca SxFSDFEHvffdg --specialization aml
```

In case if you want to download multiple specialization/courses at once, simply give slugs of all the specialization/courses that you want to download.  
For example you want to download, all the courses from the below specialization:

- "[Advanced Machine Learning Specialization](https://www.coursera.org/specializations/aml)" (slug - aml)
- "[Machine Learning Specialization](https://www.coursera.org/specializations/machine-learning)" (slug - machine-learning)
- "[Deep Learning Specialization](https://www.coursera.org/specializations/deep-learning)" (slug - deep-learning)

The single command to download all the above specializations is:

```
coursera-dl -u myid@gmail.com -p myPassword -ca SxFSDFEHvffdg --specialization aml machine-learning deep-learning
```

By far, All seems fine, but there are few problems with default options of coursera-dl:

- Default download video quality is 540p
- Default subtitle language is English and Korean
- Quizzes are not downloaded by default.
- Doesn't Resume partial downloads
- Coursera Lecture videos are generally of very short duration, it's irritating to browse and play videos manually, a playlist would be of much help
- Downloads stored in home directory, most probably not your desired location to store courses.

The above problems can be solved by providing additional inputs to coursera-dl

```
coursera-dl -u myid@gmail.com -p myPassword -ca SxFSDFEHvffdg --specialization aml machine-learning deep-learning --subtitle-language en --video-resolution 720p --download-quizzes --resume --playlist --path=/home/milav/Coursera/
```

The above command all courses from listed specialization, but with below improvements:

- Only English Subtitles Downloaded (--subtitle-language en)
- Video Downloaded in 720p (--video-resolution 720p)
- Now it Downloads Quizzes (--download-quizzes)
- Reumes Partial Downloads (--resume)
- Makes M3U Playlist of All the Lecture Videos of Courses (--playlist)
- Downloads Courses to Desired Location, /home/milav/Coursera/ (--path=/home/milav/Coursera/)

But the downside is that, the command now is very messy with all this options included. The work around is to store all this desired option to a configuration file in your home directory, named coursera-dl.conf.  
The file should look like this:

```
#coursera-dl.conf 
coursera-dl --username myid@gmail.com --password mypwd --cauth 0BbiGP8Ci --subtitle-language en --video-resolution 720p --download-quizzes --resume --playlist --path=/home/milav/Coursera/ --specialization
```

And then this clean command will work:

```
coursera-dl aml machine-learning deep-learning
```

If you're someone like me and want to grab all the specializations available on the coursera, then..

- Simply make a script file coursera-dl-sh.sh like below
- Throw it on your linux terminal.
- And Boom, You've just replicated whole Coursera Content Server on your Hard Disk...!

```
#coursera-dl-sh.sh

#technologies

#gcp
coursera-dl gcp-data-machine-learning
coursera-dl machine-learning-tensorflow-gcp
coursera-dl advanced-machine-learning-tensorflow-gcp
coursera-dl gcp-data-engineering
coursera-dl machine-learning-trading
coursera-dl from-data-to-insights-google-cloud-platform
coursera-dl gcp-architecture
coursera-dl architecting-google-kubernetes-engine
coursera-dl security-google-cloud-platform
coursera-dl networking-google-cloud-platform
coursera-dl google-it-support
coursera-dl gcp-cloud-architect
coursera-dl apigee-api-gcp-onprem
coursera-dl cloud-engineering-gcp
coursera-dl developing-apps-gcp
coursera-dl apigee-api-gcp
coursera-dl gcp-data-machine-learning-es
coursera-dl google-it-automation
coursera-dl g-suite-administration

#ibm
coursera-dl advanced-data-science-ibm
coursera-dl ibm-data-science
coursera-dl applied-artifical-intelligence-ibm-watson-ai
coursera-dl ibm-ai-workflow
coursera-dl introduction-data-science
coursera-dl applied-data-science
coursera-dl ai-engineer
coursera-dl ai-foundations-for-everyone
coursera-dl it-fundamentals-cybersecurity

#UCSanDiego
coursera-dl big-data
coursera-dl python-data-products-for-predictive-analytics
coursera-dl data-structures-algorithms
coursera-dl object-oriented-programming
coursera-dl java-object-oriented
coursera-dl discrete-mathematics
coursera-dl bioinformatics
coursera-dl interaction-design
coursera-dl internet-of-things
coursera-dl teach-java
coursera-dl teach-impacts-technology-k12-education
coursera-dl computational-thinking-block-programming-k12-education

#colorado system
coursera-dl computer-communications
coursera-dl programming-unity-game-development
coursera-dl computer-network-security
coursera-dl algorithms-for-battery-management-systems
coursera-dl cyber-security-business
coursera-dl computer-security-systems-management
coursera-dl computational-thinking-c-programming
coursera-dl introduction-applied-cryptography
coursera-dl advanced-system-security-design
coursera-dl applied-crypto
coursera-dl requirements-engineering-secure-software
coursera-dl homeland-security-cybersecurity
coursera-dl secure-software-design

#Colorado Boulder
coursera-dl power-electronics
coursera-dl embedding-sensors-motors
coursera-dl semiconductor-devices
coursera-dl statistical-thermodynamics-engineering
coursera-dl developing-industrial-iot
coursera-dl spacecraft-dynamics-control
coursera-dl optical-engineering
coursera-dl active-optical-devices
coursera-dl excel-vba-creative-problem-solving
coursera-dl mind-machine

#JHU
coursera-dl jhu-data-science
coursera-dl data-science-foundations-r
coursera-dl data-science-statistics-machine-learning
coursera-dl genomic-data-science
coursera-dl executive-data-science
coursera-dl biostatistics-public-health
coursera-dl health-informatics
coursera-dl r

#michigan
coursera-dl python
coursera-dl data-science-python
coursera-dl web-design
coursera-dl python-3-programming
coursera-dl web-applications
coursera-dl michiganux
coursera-dl statistics-with-python
coursera-dl data-collection

#UCDavis
coursera-dl learn-sql-basics-data-science
coursera-dl seo
coursera-dl data-visualization
coursera-dl gis
coursera-dl computational-social-science-ucdavis
coursera-dl healthcare-information-literacy-data-analytics

#deep-learning.ai
coursera-dl deep-learning
coursera-dl ai-for-medicine
coursera-dl tensorflow-in-practice
coursera-dl tensorflow-data-and-deployment

#Autodesk
coursera-dl cad-design-digital-manufacturing
coursera-dl autodesk-cad-cam-cae-mechanical-engineering
coursera-dl autodesk-cad-cam-manufacturing
coursera-dl autodesk-generative-design-manufacturing

#unity
coursera-dl unity-3d-artist
coursera-dl unity-xr
coursera-dl unity-gameplay-programmer
coursera-dl unity-certified-programmer

#Minnesota
coursera-dl software-development-lifecycle
coursera-dl user-interface-design
coursera-dl software-testing-automation

#UC irvine
coursera-dl iot
coursera-dl google-golang
coursera-dl ios-development

#Imperial College
coursera-dl mathematics-machine-learning
coursera-dl statistical-analysis-r-public-health
coursera-dl public-health-epidemiology

#GoldSmiths Uni London
coursera-dl virtual-reality
coursera-dl website-development
coursera-dl introduction-computer-science-programming

#Illionis
coursera-dl cs-fundamentals
coursera-dl data-mining

#HSE
coursera-dl aml
coursera-dl mathematics-for-data-science

#alberta
coursera-dl software-design-architecture
coursera-dl reinforcement-learning

#duke
coursera-dl java-programming
coursera-dl c-programming

#INSEAD
coursera-dl blockchain
coursera-dl blockchain-financial-services

#Rice
coursera-dl introduction-scripting-in-python
coursera-dl computer-fundamentals
coursera-dl pcdp

#toronto
coursera-dl self-driving-cars
coursera-dl gis-mapping-spatial-analysis
coursera-dl plant-bioinformatic-methods

#mathematics
coursera-dl infectious-disease-modelling

#IT
coursera-dl aws-fundamentals
coursera-dl networking-basics
coursera-dl cloudera-big-data-analysis-sql
coursera-dl emerging-technologies
coursera-dl information-systems
coursera-dl secure-coding-practices
coursera-dl palo-alto-networks-cybersecurity
coursera-dl machine-learning-algorithms-real-world
coursera-dl sscp-training
coursera-dl architecting-hybrid-cloud-infrastructure-anthos
coursera-dl ibm-z-mainframe

#Physical Science
coursera-dl energy-industry
coursera-dl digital-manufacturing-design-technology
coursera-dl robotics
coursera-dl cyber-security
coursera-dl modernrobotics
coursera-dl managing-major-engineering-projects
coursera-dl climate-change-and-health
coursera-dl journey-of-the-universe

#Data Science
coursera-dl investment-management-python-machine-learning
coursera-dl machine-learning
coursera-dl excel-mysql
coursera-dl social-science
coursera-dl pwc-analytics
coursera-dl statistics
coursera-dl data-warehousing
coursera-dl practical-data-science-matlab
coursera-dl strategic-analytics
coursera-dl probabilistic-graphical-models
coursera-dl database-systems
coursera-dl machine-learning-reinforcement-finance
coursera-dl data-analysis
coursera-dl marketing-analytics
coursera-dl information-visualization
coursera-dl rpa-cognitive-analytics
coursera-dl data-science
coursera-dl leadership-nursing-informatics
coursera-dl sas-programming
coursera-dl sas-visual-business-analytics

#CS
coursera-dl ruby-on-rails
coursera-dl full-stack-react
coursera-dl full-stack-mobile-app-development
coursera-dl ui-ux-design
coursera-dl android-app-development
coursera-dl algorithms
coursera-dl agile-development
coursera-dl scala
coursera-dl game-development
coursera-dl cloud-computing
coursera-dl intro-cyber-security
coursera-dl blockchain-revolution-enterprise
coursera-dl game-design
coursera-dl embedded-systems-security
coursera-dl oss-development-linux-git
coursera-dl swift-5-ios-app-developer
coursera-dl app-development
coursera-dl advanced-app-android
coursera-dl introduction-to-blockchain
coursera-dl data-structures-algorithms-tsinghua



#Art & business

#Illinois
coursera-dl digital-marketing
coursera-dl strategic-leadership
coursera-dl financial-management
coursera-dl managerial-economics-business-analysis
coursera-dl value-chain-management
coursera-dl innovation-creativity-entrepreneurship
coursera-dl accounting-fundamentals
coursera-dl global-challenges-business
coursera-dl financial-reporting
coursera-dl united-states-federal-taxation
coursera-dl professional-iq

#Pennsylvania
coursera-dl team-building
coursera-dl introduction-intellectual-property
coursera-dl regulatory-compliance
coursera-dl healthcare-administration-management
coursera-dl positivepsychology
coursera-dl wharton-business-foundations
coursera-dl business-analytics
coursera-dl finance-quantitative-modeling-analysts
coursera-dl wharton-success
coursera-dl wharton-fintech
coursera-dl wharton-global-business-strategy
coursera-dl wharton-business-financial-modeling
coursera-dl wharton-entrepreneurship
coursera-dl healthcare-law

#Berkely Music
coursera-dl diy-musician
coursera-dl electronic-music-production
coursera-dl music-production
coursera-dl business-music-production
coursera-dl musicianship-specialization
coursera-dl music-business
coursera-dl singer-songwriter

#UC Irvine
coursera-dl career-success
coursera-dl project-management-success
coursera-dl product-management
coursera-dl conflict-management
coursera-dl esports
coursera-dl uci-blockchain
coursera-dl applied-project-management
coursera-dl intermediate-grammar
coursera-dl advanced-grammar-punctuation
coursera-dl speaklistenenglish
coursera-dl teach-english
coursera-dl american-english-pronunciation

#Michigan
coursera-dl leading-teams
coursera-dl foundational-finance
coursera-dl financialtechnology
coursera-dl photography-basics
coursera-dl become-a-journalist
coursera-dl art-for-games
coursera-dl business-statistics-analysis
coursera-dl engineering-project-management
coursera-dl investment-portolio-management
coursera-dl leadership-communication-engineers
coursera-dl leadership-development-engineers
coursera-dl market-research
coursera-dl coaching-skills-manager
coursera-dl fundraising-development

#Colorado boulder
coursera-dl data-analytics-business
coursera-dl effective-business-communication
coursera-dl digital-advertising-strategy
coursera-dl sustainable-transformation

#Macquaire
coursera-dl excel
coursera-dl influencing-storytelling-change-management
coursera-dl hr-management-leadership
coursera-dl strategic-management-competitive-advantage
coursera-dl analysing-numeric-digital-literacies
coursera-dl adapting-career-development
coursera-dl solving-complex-problems

#North western university
coursera-dl social-media-marketing
coursera-dl organizational-leadership
coursera-dl the-art-of-sales-mastering-the-selling-process
coursera-dl content-strategy

#Virginia
coursera-dl uva-darden-digital-product-management
coursera-dl uva-darden-bcg-pricing-strategy
coursera-dl business-strategy
coursera-dl coding-for-managers

#ASU
coursera-dl tesol
coursera-dl tesol-certificate-2
coursera-dl arizona-state-university-tesol
coursera-dl ell-teaching
coursera-dl english-for-business

#Cal inst Arts
coursera-dl graphic-design

#Copenhegan
coursera-dl strategic-management
coursera-dl digital-transformation-financial-services
coursera-dl social-entrepreneurship-cbs

#Rutgers
coursera-dl supply-chain-management
coursera-dl healthcare-organization-operations
coursera-dl procurement-sourcing

#Maryland
coursera-dl business-entrepreneurship
coursera-dl english-interview-resume
coursera-dl corporate-entrepreneurship

#ESSEC
coursera-dl hotel-management
coursera-dl negotiation-mediation-conflict-resolution

#ISB
coursera-dl business-technology-managment
coursera-dl trading-strategy
coursera-dl investment-strategy

#Uni Georgia
coursera-dl six-sigma-fundamentals
coursera-dl six-sigma-green-belt
coursera-dl cybersecurity-developing-program-for-business
coursera-dl human-resource-management
coursera-dl healthcare-marketplace
coursera-dl recommender-systems

#IE business school
coursera-dl marketing-mix
coursera-dl marketing-strategy
coursera-dl branding-the-creative-journey

#health
coursera-dl anatomy
coursera-dl immunology
coursera-dl professional-epidemiology
coursera-dl become-an-emt
coursera-dl integrative-health-and-medicine
coursera-dl school-health-for-children-and-adolescents
coursera-dl systems-biology
coursera-dl global-health
coursera-dl patient-safety
coursera-dl newborn-baby-care
coursera-dl foundations-public-health-practice
coursera-dl social-welfare-policy
coursera-dl health-effects-cannabis-thc-cbd
coursera-dl palliative-care
coursera-dl gmph-global-disease-masterclass
coursera-dl healthcare-trends-business-professionals
coursera-dl global-health-innovations

#social Science
coursera-dl academic-english
coursera-dl academic-skills
coursera-dl english-for-research-publication-purposes
coursera-dl virtual-teacher
coursera-dl globalization-economic-growth-and-stability
coursera-dl good-with-words
coursera-dl teacher-sel
coursera-dl nonprofit

#Languages
coursera-dl improve-english
coursera-dl learn-spanish
coursera-dl business-english-speakers
coursera-dl business-english
coursera-dl learn-english
coursera-dl hsk-learn-chinese
coursera-dl learn-mandarin
coursera-dl russian-for-beginners-a1
coursera-dl learn-mandarin-chinese-intermediate
coursera-dl effective-communication
Personal development
coursera-dl public-speaking
coursera-dl presentation-skills
coursera-dl inspirational-leadership
coursera-dl graphic-design-elements-non-designers
coursera-dl futures-thinking
coursera-dl career-brand-management
coursera-dl sustainable-business-change-agent

#Arts
coursera-dl creative-writing
coursera-dl memoir-personal-essay

#business
coursera-dl project-management
coursera-dl investment-management
coursera-dl construction-management
coursera-dl inspired-leadership
coursera-dl foundations-management
coursera-dl managing-innovation-design-thinking
coursera-dl competitive-strategy
coursera-dl finance-for-everyone
coursera-dl mba
coursera-dl marketing-digital
coursera-dl sales-training-high-performing-teams
coursera-dl entrepreneurial-finance
coursera-dl learn-finance
coursera-dl fintech
coursera-dl international-marketing
coursera-dl startup-entrepreneurship
coursera-dl start-your-own-business
coursera-dl value-creation-innovation
coursera-dl understanding-modern-finance
coursera-dl sales-management-bridging-gap-strategy-sales
coursera-dl sales-operations
coursera-dl startup-valuation
coursera-dl supply-chain-finance-and-blockchain-technology
coursera-dl fintech-startups-emerging-markets
coursera-dl doing-business-in-china
```

you can get the extensive guide to use this tool form official [github page](https://github.com/coursera-dl/coursera-dl) or using the --help command.

```
coursera-dl --help
```

Hope this post will help you to do Coursera Courses Free Download.

In Case you're interested in downloading All the Udacity courses with same ease, Have a look at my other post - [Udacity Courses Free Download using Udacimak](https://planetmilav.com/udacity-courses-free-download-using-udacimak/)

Happy Learning...!
