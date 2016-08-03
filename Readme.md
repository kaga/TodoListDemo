
[![Build Status](https://travis-ci.org/kaga/TodoListDemo.svg?branch=master)](https://travis-ci.org/kaga/TodoListDemo)
[![codecov](https://codecov.io/gh/kaga/TodoListDemo/branch/master/graph/badge.svg)](https://codecov.io/gh/kaga/TodoListDemo)

![Application Screenshot](./screenshots/1_1_Application_Created.png)

This repository is a simple todo list application for iOS. It was written to demonstrate how taken away unnecessary responsibility of a view controller can enable us to 

1. Write unit test about the core business logic ( enable us to do TDD )
2. Write UI test that does not require re-construct the whole UI state
3. Reuse the business logic code on Today Extension and WatchOS as a framework
4. Easily test the application state such as network connection failure 

Please see the repo history for step by step notes

*Notes for creating a shared iOS/WatchOS framework*
Step 1 
![Duplicate the product](./screenshots/3_1_Reuse_Code_WatchOS.png)

Step 2 
![Set baseSDK to latest WatchOS](./screenshots/3_2_Reuse_Code_WatchOS_2.png)

Step 3 
![Set product name to be the same name on iOS](./screenshots/3_3_Reuse_Code_WatchOS_3.png)

Step 4 
![Add Framework to WatchOS Extension](./screenshots/3_4_Reuse_Code_WatchOS_4.png)
