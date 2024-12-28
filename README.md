# Test Assignment LANARS - Option 1

### Login
- **Login functionality to access the app's features.**
  - Validation of the input data.
  - Validation triggers when the login button is pressed or when the input field loses focus.
  - Error state resets when the value changes.
  - After successful login, the user is redirected to the home page.
  - Input fields and button are disabled during the request.
  - User remains logged in until they log out.

### Profile View
- **Profile view functionality to see user information in the drawer.**
    - User avatar is displayed.
    - Full name of the user is shown.
    - User's email is displayed.
    - A tile has been added to open a dialog window to change the theme.

### Photos
- **Photo feed functionality to find the required photos.**
    - Pagination has been implemented.
    - Local sorting by name (ASC).
    - The list is grouped by name.
    - UI does not freeze when sorting/grouping large datasets.

### Update Photo Feed
    - There is an option to refresh the feed.

## Used Packages:
- bloc
- dio  
- retrofit
- auto_route  

Additionally, the following dependencies are used:
- flutter_bloc  
- retrofit_generator  
- auto_route_generator  
- build_runner


## CI/CD for Build and Release Publication
I added CI/CD for publishing APK and iOS builds to the release in GitHub.
So, you can test the app by downloading either the APK or the iOS build from the release (unfortunately, I don’t have a macOS system, so I'm unsure if it will work correctly or even if it will function properly).

## How to Build and Run the Project:

1. Clone the repository:
    ```bash
    git clone https://github.com/yevheniy-hliebov/test_assignment_lanars.git
    ```

2. Navigate to the project directory:
    ```bash
    cd test_assignment_lanars
    ```

3. Install dependencies:
    ```bash
    flutter pub get
    ```

4. Run the app:
    ```bash
    flutter run
    ```
