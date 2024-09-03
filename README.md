# MeetX - Zoom Clone

MeetX is a feature-rich video conferencing application developed using Flutter, Firebase, and Jitsi Meet. It offers a seamless and intuitive experience for users to connect with others in real-time.

## Features

- **User Authentication**: Google Sign-In for easy and secure login.
- **Video Conferencing**: Create and join meetings with audio and video controls.
- **Meeting History**: Track and store meeting data in Firebase Firestore.
- **Mute/Unmute Options**: Control audio and video settings during the call.
- **Responsive UI**: Dark-themed UI designed for a seamless user experience.

## Tech Stack

- **Flutter**: Frontend framework for building cross-platform applications.
- **Firebase**: 
  - **Authentication**: Google Sign-In integration.
  - **Firestore**: Real-time database for storing meeting history and user data.
- **Jitsi Meet**: SDK for handling video conferencing.

## Screenshots

| <img src="/screenshots/flutter_01.png" width="200" alt="Login Screen"> | <img src="/screenshots/flutter_02.png" width="200" alt="Google Sign In"> | <img src="/screenshots/flutter_03.png" width="200" alt="HomePage"> | <img src="/screenshots/flutter_04.png" width="200" alt="Meeting History Page"> |
| <img src="/screenshots/flutter_06.png" width="200" alt="Create Meeting"> | <img src="/screenshots/flutter_07.png" width="200" alt="Join Meeting"> | <img src="/screenshots/flutter_08.png" width="200" alt="Meeting"> | <img src="/screenshots/flutter_09.png" width="200" alt="Meeting"> |




## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Firebase Project: Set up a Firebase project and enable Authentication and Firestore.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/meetx.git
   cd meetx
2. Set Up Firebase:

Android:

Download google-services.json from your Firebase project and place it in the android/app directory.
iOS:

Download GoogleService-Info.plist from your Firebase project and place it in the ios/Runner directory.
3. Run the App:

```bash
flutter run
Use code with caution.
```
## Project Structure
lib/
  main.dart
  screens/
    Home.dart
    Login.dart
    VideoCall.dart
  resources/
    authentication.dart
    firestore.dart
    jitsi_meet.dart
  utils/
    constants.dart
    utils.dart
  widgets/
    CustomButton.dart
    CustomTextField.dart
    
## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any features or improvements.
Also Contact me here if required[shubhvora03@gmail.com]

## License
This project is licensed under the MIT License - see the LICENSE file for details.

