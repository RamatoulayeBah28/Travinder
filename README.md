# TRAVINDER

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

Travinder is an app that allows the user to match with a travel destination. Think dating app meets travel agent and you get Travinder! The user can specify a price range, the activities they wish to do, the language and more to get the perfect match that meets their travel needs.

### App Evaluation

[Evaluation of your app across the following attributes]
- **Category:** 
Travel/Lifestyle

- **Mobile:**
The app checks your current location to suggest accurate travel destinations based on proximity. The user is also able to swipe like in a dating app and also allows the user to listen to a song from that specific location in the profile of the destination.

- **Story:**
I showed my brainstorming list to friends and Travinder seemed to receive a lot more posititve reaction due to the connection to dating apps among college students. Most people like to travel (especially for cheap) and it's often overwhelming to figure out where to go.

- **Market:**
The app has a large target audience of 18+ with potentially more popularity among young adults who are more familiar with dating apps.

- **Habit:**
Swiping is a very addictive behavior. However, people are not necessarily looking to travel every time and the app would be primarily used before breaks.

- **Scope:**
It will be challenging to complete this app by the end of the program however, I believe a stripped-down version of this app would still interesting to build.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User is abled to sign up and fill out their travel preferences
* User can swipe left or right on travel profiles that interest them
* The profiles swiped right are saved in a Favorites navigation bar
* Fetched from a flight API to get information about different destinations
* User can tap a destination profile to view a more detailed description with a percentage match

**Optional Nice-to-have Stories**

* User can tap a destination profile to view a more detailed description with a percentage match
* User can check out a map navigation bar with flights nearby
* User receives a match among the favored destination based on the ones that meet more than five requirements

### 2. Screen Archetypes

- [ ] Login Screen
* User can login
- [ ] Registration Screen
* User can create a new account
* User can add their preferences
- [ ] Stream
* User can view a destination with a few lines of descriptions (flight price from current location, main activities, size of city, overall popularity)
* User can swipe left or right

- [ ] Favorites
* User can see a list of all the favored destinations


### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Feed
* Favorites

**Flow Navigation** (Screen to Screen)

- [ ] Login Screen
* => Home
- [ ] Registration Screen
* => Home
- [ ] Stream Screen
* Destination profile
- [ ] Favorites Screen
* => Destination profile
