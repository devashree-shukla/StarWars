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

![Simulator Screenshot - iPhone 15 - 2024-03-13 at 18 50 06](https://github.com/devashree-shukla/StarWars/assets/38584944/45c8a80f-d9e9-4d0e-99ba-238507cd1246)


### iOS : https://drive.google.com/file/d/1GyO0Dsl0nUwuMdLp0t8YMapRICNJB4Z7/view?usp=sharing

## Application and work flow

- Have done API analysis, Requirement/Feature understanding, UI plan, Coding, Testcases for Planets API
- Have shown listing of all 6 types possible data in [StarWars API](https://swapi.dev/documentation) 
- Have implemented Planets API to show first page's 10 records(In Listing screen) along with it's related films & residents records(In detail screen)
- Have taken care of Scalability, Reusability, Maintainability, Modularity while implementations - 
- Used MVVM app architecture, protocol based approach, Generics based classes to be done for all 6 types
- Have followed coding standard, naming convensions and used SwiftLint tool for clean and warnings less code
- Have implemented UI tests and Unit test cases for API, ViewModels, Network, Mocked responses etc
- Have tried to manage CI/CD pipelines through [Git Hub actions](https://github.com/ShuklaDevashree963/StarWars/actions/runs/1761776083/workflow) and shown status badge above
- Have useed Async concurrent tasks to fetch nested records (films/residents) : Yet to make it generics to support any 6 types
- Supported offline storage using core data : Yet to fix an issue in saving transformable objects(for nested objects)
- Project implemented fully in [Swift](https://www.swift.org/documentation/), [UIKit](https://developer.apple.com/documentation/uikit) and No third parties used
- Used Github and Github desktop for code hosting and code management 


## Modules

1. [Planets](https://swapi.dev/documentation#planets)
2. [People/Residents/Characters/Pilots](https://swapi.dev/documentation#people)
3. [Films](https://swapi.dev/documentation#films)
4. [Starships](https://swapi.dev/documentation#starships)
5. [Spices](https://swapi.dev/documentation#species)
6. [Vehicles](https://swapi.dev/documentation#vehicles)

## Main Features

- Features listing can be found here : [Features](https://github.com/ShuklaDevashree963/StarWars/blob/main/Features.md)

## Architecture

Have choosen MVVM over any other options as it's faster for developement for such medium scale app. Also, enabled reusability, scalability, modularity, cleanness, code sepration. It's more better going forward when to support other type using generics, enums, extension. In this, core ViewModel helps as it's totally UIKit independent. ViewModel is at core handling all tasks and coordinating between views/viewcontrollers effectively. 

![IMG_C723FAD3720B-1](https://user-images.githubusercontent.com/38584944/151563142-e54a5f8e-ade0-4f6d-a551-4029237e09fd.jpeg)


## Entity relationship and core data

- Many Plantes relates to Many Films/People
- Many People relates to Many /Films/Starships/Spices/Vehicles
- Many Film relates to Many Planet/People/Starships/Spices/Vehicles
- Many Starships relates to Many Films/People 
- Many Spices relates to Many Films/People
- Mnay Vehicles relates to Many Films/People

- This image shows database design for Root, Planet, Films and People table.

<img width="1355" alt="Screenshot 2022-01-23 at 11 21 43 AM" src="https://user-images.githubusercontent.com/38584944/150696950-9e09ac39-b626-49d4-8111-a9d2ebe8d5f5.png">


- This image shows database design for all table. Also added relationships between records, delete rules, one/many relationships among all.

<img width="1628" alt="Screenshot 2022-01-24 at 2 17 07 AM" src="https://user-images.githubusercontent.com/38584944/150697420-9efbc571-5471-4a7c-b47d-1812db18bc60.png">


    
## Folder structure

- Network : Contains all files required to make API calls
- Resoures : Contains image/color/any other resources
- Architecture : MVVM 
    - Model : Contains all models for parsing request/response and some common models to handle 6 types of data
    - ViewModel : Contains all view model, it's protocol and helper files for Home/List/Detail screen
    - View : Contains all view controllers and table view cell files for Home/List/Detail screen
- App Specific : Contains all unique app level files 
- Data Store : Contains core database and it's models and helper method
- Helpers : Contains helpers for coredata, network reachability, extensions, constants


## Testing Approach 

- For Unit tests focused for ViewModels, Network classes, Mocks responses
- UI tests for all views and controllers for Home/List/Detail screens

It is very important how user is going to interact with your application. Writing test cases gives assurance that application is stable and safe for your user. It allows you to refactor code easily. It captures business requirements in form of test cases.

<img width="452" alt="Screenshot 2022-01-28 at 8 46 43 PM" src="https://user-images.githubusercontent.com/38584944/151578256-06752551-5d34-4f3c-b07f-934d732b29a9.png">


<img width="459" alt="Screenshot 2022-01-28 at 9 19 29 PM" src="https://user-images.githubusercontent.com/38584944/151578276-d385a49d-90b6-47f2-b268-60b45f2e854f.png">


## CI/CD

- [Simple workflow added for Swift project](https://github.com/ShuklaDevashree963/StarWars/blob/main/.github/workflows/swift.yml)


## Swift Lint 

- Issues are fixed using Swift lint tool. Removed all warnings to keep the code clean.

- Added below script in Build Phases. (Can be removed and add on need basis)

<img width="909" alt="Screenshot 2022-01-27 at 10 20 19 AM" src="https://user-images.githubusercontent.com/38584944/151294259-cfd3ed93-4abb-4a64-aa39-01c7a2adfcc9.png">

- Enabled auto correct as below commands in terminal :
    - cd /Users/devashreeks/Desktop/(PROJECT_DIRECTORY)
    - swiftlint autocorrect
    
- Above steps to be executed before any push request to succeed CI/CD pipelines
