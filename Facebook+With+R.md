
---
title: 'Analysing Facebook data with R'
author: "Kanav Katyal"
date: "March 25, 2016"
output: 
  html_document
---


# 1. Introduction
The goal of this report is to analyse facebook data using facebook API and R.The data on the facebook can be analysed with R or Python but this report focuses on R. The way this goes is by connecting your R to facebook API. After a succesfull connection is made we can extract data from public pages,posts, froups or public profiles. Although facebook has put alot of restrictions on their latest update of  API's due to privacy issues still this is possible.

So there are basically two ways to connect to the API,Via an app or via a temporary token.
Using the app has an advantage that this is valid for atleast two months, but the process of creating an app and then connecting it to your R console is more complicated than compared to a temporary token.Also you won´t get all the data available via this method.

The connection via the temporary token is much more easier and will give you more data but the token is only valid for 2 hours. After 2 hours the token has to be refreshed and the new token has to be used. Also you have to be always logged in for doing this analysis. In further section we will look on how to connect R to facebook API via a temporary authentication token.




# 2. Connecting R to Facebook
Before doing anything you need to login to our facebook account. After that we have to install the package Rfacebook and devtools. Rfacebook package provides a series of functions that allow R users to access Facebook's API to get information about public pages, groups, and posts, as well as some of the authenticated user's private data. Authenticated user here means the user who is logged in. 
Rfacebook is being installed from github because the latest version of this package is available on github itself.



```R




install.packages("devtools",repos = "http://cran.us.r-project.org")
library(devtools)
install.packages("Rfacebook",repos = "http://cran.us.r-project.org")
require (Rfacebook)





```

    Installing package into 'C:/Users/Kanav/Documents/R/win-library/3.3'
    (as 'lib' is unspecified)
    

    package 'devtools' successfully unpacked and MD5 sums checked
    
    The downloaded binary packages are in
    	C:\Users\Kanav\AppData\Local\Temp\Rtmp690njA\downloaded_packages
    

    Warning message:
    "package 'devtools' was built under R version 3.3.3"Installing package into 'C:/Users/Kanav/Documents/R/win-library/3.3'
    (as 'lib' is unspecified)
    

    package 'Rfacebook' successfully unpacked and MD5 sums checked
    
    The downloaded binary packages are in
    	C:\Users\Kanav\AppData\Local\Temp\Rtmp690njA\downloaded_packages
    

    Loading required package: Rfacebook
    Warning message:
    "package 'Rfacebook' was built under R version 3.3.3"Loading required package: httr
    Loading required package: rjson
    Loading required package: httpuv
    
    Attaching package: 'Rfacebook'
    
    The following object is masked from 'package:methods':
    
        getGroup
    
    

After installing these packages the API request needs an authentication token through which it will be having access.There are two ways of making authenticated requests with Rfacebook. One of the option is to generate a temporary token on the Graph API Explorer.Then just copy and paste that token into the R console and save it as a string vector to be passed as an argument to any function in the Rfacebook package.

For generating the token you need to go on this link
#token generated here: https://developers.facebook.com/tools/explorer 
As this page will open you can see an access token tab and just copy it. If there is no access token then on the top right corenr of the page there is a tab for "Get Token". If you will click on it, a new token with be generated.





```R



token <- 'EAACEdEose0cBAEQYAQ9xketBXPlvSjQqOrR1QhL8gJTSljXDRY7O2XFTlJ2wzsg3Y1rZCJUlkGMG28Q4I4ZBje4UFIMDjTOvCV8uLUAF0wds2WyGUhKenEoYjbYqDl8P9MHmTKO4s3hZAE5EtcKLqEn5SlrnCqov0IcGTg5uXzvHcMK6OxSAWgVJgfOTkgZD'
me <- getUsers("me", token, private_info=TRUE)
me$name
me$username
me$gender
me$birthday
me$location

```


'Kanav Katyal'



    [1] NA



'male'



'01/30/1991'



'Boston, Massachusetts'





```R

```
