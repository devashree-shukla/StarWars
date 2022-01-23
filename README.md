# StarWars

An iOS application about Star Wars that allows users to see all reelated information like Planets, Characters, Films, Vehicles, Starrships, Spices etc. The app is fully implemented in Swift & native frameworks using MVVM architecture. Also demonstrates several features like Listing, API calls, Offline storage, Sorting, Searching, Coding standards, Test cases etc.

## Requirements

Xcode 13+
iOS 13.0+
Swift 4.0+

## Installation

1. Clone or Download the project
2. Open in Xcode
3. Build and Run the project in iPhone/iPad

## How it looks like ?

### iPhone

### iPad

## Application work flow

## Modules

1. Planets
2. People/Residents/Characters/Pilots
3. Films
4. Starships
5. Spices
6. Vehicles

## Main Features

1. Fetch all data and save locally
2. Listing
3. Show details in human readable format
4. Show linked data
5. Accessibility, voice over assistance
6. Uderstandable, Faster, Scalable, Easy to maintain implementations and architecture
7. Search on data based on below entities or their attributes
    - Planets
    - People
    - Film
    - Starships
    - Spices
    - Vehicles 
8. Sorting 
9. Different language support 
10. UX improvements 
    - Scrolling of data in page
    - Animations for better visualization
    - Visual representation of data for information like gender, terrain, climate, rating, water level etc
    - Loader image related to app theme while fetching data -  can be implemented using various planets-people-starships images etc 
11. Settings feature
    - To set time format in display of data in detail page eg. hour/day/week/month/year etc
    - To set distance format in display of data in detail page eg. km/miles/lightyears etc
    - App theme enable/disble based on dark or default modes 
    - Set user name, profile image, device ids to display purpose and user identity
        - Mark as favourite / unfavourte if user profile is set
        - Add/remove films in Watchlist 
        - Reset above updates (as do not have post apis)
        - Show favourites/watchlist screens if above is done or can update UI to tabs view
    - Link to social media pages 
        - Facebook
        - instagram
        - Twitter
12. Filter on data of below entities based their attributes
    - Planets
    - People
    - Film
    - Starships
    - Spices
    - Vehicles
13. Contact us via mail
    - for any new suggestion or feedback or complains about app or feature
14. Rating view to display rating in Starships entity records
15. Toggle between List view / Gris view in Home/List screens
16. Lazy loading of all images for all records
    - Can handle to display multiple images for any record
17. Image identification/classification of images captured using camera or uploaded from folder
    - This feature can match image with available records and give related details in result
18. Download of image and set it as wallpaper
19. Share records/images ot other people or devices
20. Handle push notifications if any new record added/updated in server
    - Can handle rish pushnotifications 
21. Add link/available option to watch film for records in Films entity
22. Audio search option to user
23. Support app in landscape mode
24. CRUD in local 
    - Read : Fetching and displaying all records
    - Update : Mark as favourite/unfavourite, Add/remove to/from watchlist
    - Delete : Delete any record/list if no longer intrested
    - Create : N/A
25. Rearranging of records in list/favourites/watchlist screens
26. Pagination in lasting screen as api returns total counts & page details
        OR
    Auto loading of all data and save locally at once, on pull to refresh only refetch data from server. This approach will be seemless smooth UX experience while using app over pagination
    
## Architecture
    
## Folder structure

## Sequence diagram (For planet module)

## Entity relationship and core data

- One roote StarWarsItem relates to Many Planet/People/Films/Starships/Spices/Vehicles
- Many Plantes relates to Many Films/People
- Many People relates to Many /Films/Starships/Spices/Vehicles
- Many Film relates to Many Planet/People/Starships/Spices/Vehicles
- Many Starships relates to Many Films/People 
- Many Spices relates to Many Films/People
- Mnay Vehicles relates to Many Films/People

- This image shows database design for Root, Planet, Films and People table.

<img width="1355" alt="Screenshot 2022-01-23 at 11 21 43 AM" src="https://user-images.githubusercontent.com/38584944/150696950-9e09ac39-b626-49d4-8111-a9d2ebe8d5f5.png">


- This image shows database design for all table. Also added relationships between records, delete rules, one/many relationships among all.

<img width="1623" alt="Screenshot 2022-01-23 at 11 53 10 AM" src="https://user-images.githubusercontent.com/38584944/150696958-e7a5494b-7335-4a3a-b254-bf3c41062347.png">


## Other Wireframes for future improvements and new features 


