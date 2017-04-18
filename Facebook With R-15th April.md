
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

install.packages("devtools")
library(devtools)
install.packages("Rfacebook",repos = "http://cran.us.r-project.org")
require(Rfacebook)





```

    Installing package into 'C:/Users/Kanav/Documents/R/win-library/3.3'
    (as 'lib' is unspecified)
    


    Error in contrib.url(repos, "source"): trying to use CRAN without setting a mirror
    Traceback:
    

    1. install.packages("devtools")

    2. contrib.url(repos, "source")

    3. stop("trying to use CRAN without setting a mirror")


After installing these packages the API request needs an authentication token through which it will be having access.There are two ways of making authenticated requests with Rfacebook. One of the option is to generate a temporary token on the Graph API Explorer.Then just copy and paste that token into the R console and save it as a string vector to be passed as an argument to any function in the Rfacebook package.

For generating the token you need to go on this link
token generated here: https://developers.facebook.com/tools/explorer 
As this page will open you can see an access token tab and just copy it. If there is no access token then on the top right corenr of the page there is a tab for "Get Token". If you will click on it, a new token with be generated.





```R



token <- 'EAACEdEose0cBACNOkZA6ZByKDEHyGjSfZBdcLihqBFbBLZC8tGLJm4mILomsW03BuUEW4FwGdsR9HCX0VwuPCaZBy9lcNgxhfXwbDxhTii8JyVDFCsXDQ8IunW9mP6YvbMFA54OXGg9tuJ2ZApqI5QRqWwkhHEKrgAyoQCnrlOYEQwbp9Ej2BZASC0xJTX5LawZD'
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




# 3. Analyising data from facebook

## 3.1 Analyising posts on public pages
Now lets look at posts that are being posted to a public page since it was craeted. To get all the data of the posts there is a function called 'getPage' in Rfacebook package which returns all the posts from that page. The constraint here is still the same that the page should be public.
Here is the usage of this function getPage('page', token, n = 1000) where,
page is the name of the facebook page 
token is our authentication code which we have saved it as a string vector and 
n is the number of posts that we want to extract.We put n eaqual to alarge number so that we can get all the posts though it changes from page to page.

Note: Everything on the facebook has a facebook id which can be found out at https://findmyfbid.com/. In place of 'page' facebook id of that page can also be used.


There is a page on facebook for the Bentley Analytics Society and I am fetching all its post since the day it was created to further analyse them.


```R
BAS = getPage('bentleyAS', token, n=500)
```

    25 posts 50 posts 75 posts 100 posts 125 posts 150 posts 175 posts 200 posts 225 posts 250 posts 275 posts 276 posts 


```R

```
