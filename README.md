# LinkedIn Clone App
Welcome to the LinkedIn Clone App, a Flutter-based application designed to mimic the core features of LinkedIn, including user authentication, profile management, and a basic home interface. This app is built for learning and demonstration purposes, showcasing Flutter development with state management using Provider.

This app replicates key LinkedIn functionalities such as:

- User login and signup with email and password.
- Home Page User Interface
- Profile page User Interface
- Logout functionality integrated into the profile page.
- Responsive design with a custom text field widget for password visibility toggling.

The app uses a simple in-memory authentication service (AuthService) for demonstration. It includes a predefined user for testing and a mock profile view model.

# Setup Instructions
Follow these steps to set up and run the app on your local machine:
## Prerequisites
- Flutter SDK (version 3.0.0 or later)
Dart
- An IDE (e.g., Visual Studio Code or Android Studio) with Flutter plugin
- Android Emulator or iOS Simulator (or a physical device)

## Installation

- Clone the Repository:
git clone https://github.com/your-username/linkedin-clone-app.git
- cd linkedin-clone-app
- Install Dependencies:Run the following command to     install the required packages:
    flutter pub get


Configure the App:

Ensure the Flutter SDK is properly configured in your environment.
No additional API keys or external services are required for this demo, as authentication is simulated.


Run the App:

Connect an emulator or physical device.
- Start the app using:
    flutter run


Alternatively, build an APK for testing:flutter build apk --release


## Verify Setup:

The app should launch on your device/emulator, showing the login screen.

# Credentials for Login
For testing purposes, the app includes a predefined user. Use the following credentials to log in:

- Email: asa@gmail.com
- Password: Otis1234

## Notes

You can also sign up with a new email and password to create a test account.
After logging in, navigate to the profile page and use the "Logout" option in the app bar to return to the login screen.
The back button is disabled on the login and signup screens to prevent unauthorized access to previous states.

##  Usage

- Login:
Enter the provided credentials or sign up with new ones.
Click "Sign In" to access the home page, then navigate to the profile page.


- Profile:
View your profile details, including a header, analytics, about section, and skills.
Click the "more_horiz" icon in the app bar to open a dropdown menu and select "Logout" to sign out.


- Logout:
Confirm the logout action in the dialog to return to the login screen with all previous routes cleared.

