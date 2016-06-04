`![Application Screenshot](https://github.com/kaga/TodoListDemo/blob/master/screenshots/1_10_Use_Error_Provider_To_Test.png)`

This repository is a simple todo list application for iOS. It was written to demonstrate how taken away unnecessary responsibility of a view controller can enable us to 

1. Write test about the core business logic ( enable us to do TDD )
2. Write UI test that does not require re-construct the whole UI state
3. Reuse the business logic code on Today Extension and WatchOS as a framework
4. Easily test the application state such as network connection failure 

Please see the repo history for step by step notes

Notes for creating a shared iOS/WatchOS framework
`![Duplicate the product](./screenshots/3_1_Reuse_Code_WatchOS.png)`
`![Set baseSDK to latest WatchOS](./screenshots/3_2_Reuse_Code_WatchOS_2.png)`
`![Set product name to be the same name on iOS](./screenshots/3_3_Reuse_Code_WatchOS_3.png)`
`![Add Framework to WatchOS Extension](./screenshots/3_4_Reuse_Code_WatchOS_4.png)`
