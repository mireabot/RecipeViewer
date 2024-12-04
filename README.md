### Steps to Run the App
- Download the project
- Select **RecipeViewer** scheme
- To run different cases you can change API type in 'RecipeViewerApp'
  - **API.primary** for displaying all recipes
  - **API.emptyData** for displaying empty data
  - **API.invalidData** for displaying invalid data

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
- **Architecture** I'm using modular approach for most my projects because this is a gateway to scale it in the future, so it's good to set things in the ealy stage rathen than building tech debt, instead of MVVM pattern I utilized MV approach reducing dependencies and extra files
- **UI/UX** Eventually I came to iOS development because of compact desing (like only screen size) and challenge to fit most data in small views. Even this project is a one screen app, I tried to make it oragnized and compatible with dark theme

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
- Around 4 hours as was expected
- First of all I made an outline what I want to see in the app, how to manage business logic and which approach is better for me, then made a network service and finally tied with UI and other extra logic like refreshing, empty states handling
- Last I did my best to add some tests

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
- Not too much, but I think that current approach isn't so scalable because network service is tightly connected with manager
- I also used ScrollView with LazyVStack instead of List because of memory usage (list used more space and also for my solution it caused some logical bugs)

### Weakest Part of the Project: What do you think is the weakest part of your project?
- I think Unit tests, they aren't very comprehensive but carries essential checks for API

### External Code and Dependencies: Did you use any external code, libraries, or dependencies?
- Alamofire for clean network calls
- Kingsfisher for image caching and async handling
