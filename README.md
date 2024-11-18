# User List App


 # Project Description

This is a simple Flutter app that fetches user data from a public API (https://jsonplaceholder.typicode.com/users) and displays the users’ names and email addresses in a list. The app includes a loading indicator, pull-to-refresh functionality, error handling, and a search feature to filter users by name. Tapping a list item navigates to a detail screen that shows more information about the selected user.

 # Features

Loading Indicator: Displays a loading spinner while fetching data from the API.
User List: Displays a list of users with their names and email addresses.
Pull-to-Refresh: Refreshes the user list when pulled down.
Error Handling: Shows error messages if the API request fails.
Search Functionality: Filters the list of users based on the entered search query.
Detail Screen: Displays additional details about a user when an item is tapped.
API Used

The app fetches user data from the public API:

URL: https://jsonplaceholder.typicode.com/users
The response contains the following user fields:

name: The name of the user.
email: The email address of the user.
username: The username of the user.
address: The user's address (used in the detail screen).
Technologies Used

Flutter: Latest stable version
State Management: GetX for state management
UI: Flutter’s Material Design
Error Handling: Display appropriate messages for failed requests


 # Setup Instructions
1. Clone the Repository
git clone https://github.com/yourusername/task_userlist.git
2. Install Dependencies
flutter pub get
3. Run the App
flutter run


 # App Flow

Main Screen:
Displays a search bar to filter users by name.
Shows a list of users with names and email addresses.
Tapping a list item navigates to the detail screen of the selected user.
A pull-to-refresh feature allows the user to refresh the list of users.
A loading spinner appears while fetching data from the API.
Detail Screen:
Displays additional information about the user, including their username and address.

 # Screen shots

![photo_6188119980667683594_y](https://github.com/user-attachments/assets/fab000ee-991e-448a-b4be-3b3ffff18f25)
![photo_6188119980667683593_y](https://github.com/user-attachments/assets/ddbdf019-5d19-49da-937a-3403216978c3)
![photo_6188119980667683595_y](https://github.com/user-attachments/assets/75c5ed39-006c-4887-a97b-1e2290b03eb7)


