# News-Article
A news article app which give users options to save articles and read it offline.

Requirements:
  Minimum:
* Use of Web API to fetch news details. API - https://moedemo-93e2e.firebaseapp.com/assignment/NewsApp/articles.json.
* Make sure to persist the data obtained from the above API, for the offline scenario.
* Home Screen -
    * List the Articles obtained with Image, Title, and Description(max 3 lines)
    * Implement Image Caching for the offline scenario.
    * Implement a feature to Sort articles based on old-to-new and new-to-old.
    * Search feature to filter the articles based on Publishers/Authors.
* Detail screen -
    * On clicking the article in home screen, load the article URL on this detail screen.
    * Implement offline storage for reading articles offline. User should select the articles which he/she wants to save offline.
* The app should support iOS 12 and above versions.  
  
  Good To Have:
* Implement a feature to periodically fetch news when the application is in the background and present this content when the user opens the application.
* Implement the Push Notification feature inside the app using any of the Providers.
* Visually interactive design to list details.
* Custom design, font, and icons to make the app more user friendly.
* Use your imagination and add features that would make things easier for end-users.



**Note**
* I have used iOS NSCache for caching images. iOS by default uses cache eviction policy for NSCache in low memory conditions, we don't have to take care of memory issues by ourselves. But this is temporary, have used Core data for storing articles instead. You can test image caching by opening the application with network connection, kill it, again open the app with no internet connection. You can see images in the cells are preloaded from cache.
