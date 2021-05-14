# SwiftUI Authentication Flow
### Handle authentication easily with a PassthroughSubject

This is a demo to show how you can do a login flow in SwiftUI. Includes how to take into a View after logged in successfully and how to take back to Login View after logging out from the app.

### Used frameworks

-- SwiftUI

-- Combine

### Features

- Login

-- On Success -> go to Home View

-- On Fail -> give an Alert

- Logout

-- Go back to Login View

### Functionality

> `AppManager`
It has the variables to keep track on whether user is Logged In. **IsAuthenticated()** is returning whether user is logged in by checking the Token is available yet. **Authenticated** is used as a PassthroughSubject of Bool type. We can send values (true/false) when ever user is logged or logged out. A Group can listen to its changes. It will be coved below
>

>`ContentView`
All View are embedded in a Group. A group can listen to Publishers such as a **PassthroughSubject** in the **onReceive** performer and do actions.

>`LoginView`
It has two **TextField**s to get inputs (email/passowrd) and binded to Publishers in its ViewModel. On the Button click, it will run the **loginUser()** method in the VM.

>`LoginViewModel`
This has the logic to check whether login credentials are correct in **loginUser()** method. For the demo purpose, credentials are hardcoded. If the login is successful, ``AppManager.Authenticated.send(true)`` is used. This sends a True value to the **PassthroughSubject** declared in the AppManager. So any listner is notified. (ContentView Group is listening for changes on this). Also in this method, a UserDefaults value is created with the key **token**. It is same as the **accessToken** we use in real apps.

>`HomeView`
This is the view shown when user is authenticated. This has a Logout button and triggers **logoutUser()** method in its VM.

>`HomeViewModel`
Once user press on Logout button, **logoutUser()** is called. It removed the token from the UserDefaults and emmits a false value to **AppManager**s **Authenticated** PassthroughSubject. 


### License

Free to modify/use
