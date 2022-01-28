# StarWars  ![example workflow](https://github.com/ShuklaDevashree963/StarWars/actions/workflows/swift.yml/badge.svg)

An iOS application about Star Wars that allows users to see all reelated information like Planets, Characters, Films, Vehicles, Starrships, Spices etc. The app is fully implemented in Swift & native frameworks using MVVM architecture. Also demonstrates several features like Listing, API calls, Offline storage, Sorting, Searching, Coding standards, Test cases etc.



## Requirements

- Xcode 13+
- iOS 13.0+
- Swift 4.0+

## Installation

1. Clone or Download the project
2. Open in Xcode
3. Build and Run the project in iPhone/iPad

## How it looks like ?

### iPhone

### iPad

## Application and work flow

- Have done API analysis, Requirement/Feature understanding, UI plan, Coding, Testcases for Planets API
- Have shown listing of all 6 types possible data in StarWars-API(https://swapi.dev/documentation) 
- Have implemented Planets API to show first page's 10 records(In Listing screen) along with it's related films & residents records(In detail screen)
- Have taken care of Scalability, Reusability, Maintainability, Modularity while implementations - 
- Used MVVM app architecture, protocol based approach, Generics based classes to be done for all 6 types
- Have followed coding standard, naming convensions and used SwiftLint tool for clean and warnings less code
- Have implemented UI tests and Unit test cases for API, ViewModels, Network, Mocked responses etc
- Have tried to manage CI/CD pipelines through Git Hub actions and shown status badge above
- Have useed Async concurrent tasks to fetch nested records (films/residents) : Yet to make it generics to support any 6 types
- Supported offline storage using core data : Yet to fix an issue in saving transformable objects(for nested objects)


## Modules

1. Planets
2. People/Residents/Characters/Pilots
3. Films
4. Starships
5. Spices
6. Vehicles

## Main Features

[Features](https://github.com/ShuklaDevashree963/StarWars/blob/main/Features.md)

## Architecture


    
## Folder structure

## Sequence diagram (For planet module)

## Entity relationship and core data

- Many Plantes relates to Many Films/People
- Many People relates to Many /Films/Starships/Spices/Vehicles
- Many Film relates to Many Planet/People/Starships/Spices/Vehicles
- Many Starships relates to Many Films/People 
- Many Spices relates to Many Films/People
- Mnay Vehicles relates to Many Films/People

#

- This image shows database design for Root, Planet, Films and People table.

<img width="1355" alt="Screenshot 2022-01-23 at 11 21 43 AM" src="https://user-images.githubusercontent.com/38584944/150696950-9e09ac39-b626-49d4-8111-a9d2ebe8d5f5.png">


- This image shows database design for all table. Also added relationships between records, delete rules, one/many relationships among all.

<img width="1628" alt="Screenshot 2022-01-24 at 2 17 07 AM" src="https://user-images.githubusercontent.com/38584944/150697420-9efbc571-5471-4a7c-b47d-1812db18bc60.png">




## Testing Approach 


## CI/CD

- Basic workflow added for Swift project

https://github.com/ShuklaDevashree963/StarWars/blob/main/.github/workflows/swift.yml

## Swift Lint 

- Issues are fixed using Swift lint tool. Removed all warnings to keep the code clean.

- Added below script in Build Phases. (Can be removed and add on need basis)

<img width="909" alt="Screenshot 2022-01-27 at 10 20 19 AM" src="https://user-images.githubusercontent.com/38584944/151294259-cfd3ed93-4abb-4a64-aa39-01c7a2adfcc9.png">

- Enabled auto correct as below commands in terminal :
    cd /Users/devashreeks/Desktop/(PROJECT_DIRECTORY)
    swiftlint autocorrect
    
Above steps to bee followed before any push request to succeed CI/CD pipelines

## Other Wireframes for future improvements and new features 


