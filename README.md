## Quran Flutter App
 
This is a Quran Flutter app that allows users to read and search for verses from the Quran. The app utilizes an API to fetch data and uses the `BLoC` architecture to manage state. `DIO` is used to communicate with the API.

# Features
Browse the Quran by Surah.
Search for verses by keyword.
Bookmark verses for quick access.
 
# Installation
Clone the repository to your local machine.
Open the project in your preferred code editor.
Run flutter pub get to install the required packages.
Run flutter run to start the app on your emulator or device.
# Dependencies
 dio: ^0.13.4
flutter_bloc: ^7.3.1
equatable: ^2.0.3
flutter_html: ^2.1.5
shared_preferences: ^2.0.8

# API
This app utilizes the Quran API to fetch data. The API provides various endpoints for fetching Quranic text and translations. To use the API, you'll need to obtain an API key from the website and replace the apiKey variable in the quran_repository.dart file with your key.

# BLoC Architecture
This app uses the BLoC architecture to manage state. There are three main components of the BLoC pattern: the Bloc, the Event, and the State. The quran_bloc.dart file contains the BLoC class, which manages the app's state. The quran_event.dart file defines the events that can trigger state changes, and the quran_state.dart file defines the different states that the app can be in.

#  Dio
This app uses the  Dio package to communicate with the Quran API. The quran_repository.dart file contains methods for fetching Quranic text and translations from the API using  Dio GET requests.

Conclusion
This Quran Flutter app demonstrates the use of an API, the BLoC architecture, and HTTP in a mobile app. Feel free to modify and customize this app to fit your specific needs. Happy coding!





