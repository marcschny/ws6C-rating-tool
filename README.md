# Rating Tool Flutter Project for ws6C at FHNW Brugg/Windisch

## Team

- Luca Fluri - https://github.com/lucafluri
- Marc Schnydrig - https://github.com/marcschny
- Andreas Ambühl - https://github.com/AndiSwiss



## About

This an app that enables users to search any movie online (which is indexed in https://www.themoviedb.org/), add/removes movies to/from his list of favorites and add/remove ratings to the movies. 

Description of core functionality:

- User can enter a search term in the search view. The user is then presented with a list of movie posters where available or the title of the movies.
- A user can click a movie to show its detail view. There, a user can do the following actions:
  - Mark/unmark a movie as favorite
  - Rate the movie with various parameters
  - Open a fullscreen view of the movie poster
  - Note 1: Movies get automatically added to the list of favorites, when the favorite icon is toggled accordingly. 
  - Note 2: Movies get automatically added to the list of rated movies, when a user changes at least one of the possible rating sliders for a movie
- A user can look at his list of already rated movies. The user can either swipe the movie to delete its ratings and remove it from the list of rated movies. Or the user can open a movie to show its details and alter its ratings and/or favorite status.
- A user can look at his list of favorite movies. The user can either swipe the movie to unmark its favorite status and remove it from the list of favorite movies. Or the user can open a movie to show its details and alter its ratings and/or favorite status.
- All actions are saved in a persistent database on the users device.



## Framework

We use Flutter as Framework, which enables development of fast apps for Android and iOS mobile devices. Flutter uses Dart as the main programming language. For more information, consult their corresponding websites:

https://flutter.dev/

https://dart.dev/



## Dependencies

We use the following depencies which allowed us to implement the appropriate functionalities:

- sqflite
  - For database-functionality, persistently storing data on the users device
  - https://pub.dev/packages/sqflite
- provider
  - Simplifying allocation of resources
  - https://pub.dev/packages/provider
- google_fonts
  - A package for integration of google fonts
  - https://pub.dev/packages/google_fonts
- cached_network_image
  - A plugin to show imapges from the web and keep them in a cache directory
  - https://pub.dev/packages/cached_network_image

We used some additional minor plugins/dependencies. See ../rating_tool/pubspec.yaml in the section 'dependencies' and their corresponding https://pub.dev - pages for more information.



## Directory Structure

Most directories are automatically generated by flutter - the UI framework this app uses. Other directories were created according to common flutter standards.


## How to set up your IDE to run this Flutter applicaton

1. Download and install Flutter:
    1. Download:
        1. Mac: https://flutter.dev/docs/get-started/install/macos
        2. Windows: https://flutter.dev/docs/get-started/install/windows
    2. Extract Zip-File to a folder
        1. Mac: e.g.:  ~/development/flutter
        2. Windows: e.g.:   c:\src\Flutter
    3. The other installation steps for Flutter are NOT necessary
2. Install Android Studio:

   Best (and easiest) via the JetBrains Toolbox → very easy to update! https://www.jetbrains.com/toolbox-app/
   
3. Install the Flutter Plugin for Android Studio:

   Go to "Preferences..." > "Plugins" > "Marketplace" > Search for "Flutter" > install and restart
   
4. To create a NEW Flutter App:
    1. After Installation of the Flutter Plugin, you can choose "File" > "New Flutter App..."
    
    2. "Flutter Application"
    
    3. In "Flutter SDK path", click on "Install SDK..."
    
        Select the unzipped folder of your downloaded flutter installation (from step 1)
    
    4. Now, it will download automatically more dependencies (like Android SDK's, iOS-stuff, ....) → This can take some minutes to finish!
    
    5. And you're done!



### Possible problems and their solutions with the installation

### Problem with "idevice_id" in macOS Catalina:

macOS Catalina (10.15): When starting the iOS Simulator from Android Studio (or even starting Android Studio), the
following message may appear (and the iOS Simulator won't work!):
!["idevice_id" error message](https://imgur.com/a/nQW6D2n "idevice_id kann nicht geöffnet werden, da der Entwickler nicht verifiziert werden kann. macOs kann nicht verifizieren, dass diese App keine Malware enthält.")

### Solution for the "idevice_id" problem in macOS Catalina:
Don't click on anything (otherwise, you might have to reinstall some components). Instead: Open "System Preferences" (System-Einstellungen) > Security > General  → on the bottom, the blocked application should show up, and you simply can allow it. Then you can click on cancel on the PopUp and try again starting the iOS Simulator. The next time, you will have the option to open the app, and then it will run.
### Problem with adding flutter to the system $PATH in macOS Catalina:
* In https://flutter.dev/docs/get-started/install/macos#update-your-path, it is described that you should add the $PATH-entry to one of the following files:
  * ~/.bashrc
  * ~/.zshrc
* Both approaches don't work in macOS Catalina.
### Solution for the path prblem in macOS Catalina
* Add the $PATH-line to  ~/.bash_profile. With the following command:

   `nano ~/.bash_profile`
   
* If you have installed flutter in   ~/development/flutter, then you should add the following line in this file:
  * export PATH="$HOME/development/flutter/bin:$PATH"
  * Otherwise, change your path accordingly
  * Quit and save (with "ctrl"+"x")
  
* Close and reopen your Terminal-window. Now, the following command should work and show your flutter version:

   `flutter --version`



## Most important flutter commands

* `flutter doctor` provides all kinds of information about the current installation of flutter.
* `flutter --version` is self-explanatory.
* `flutter upgrade` is self-explanatory.
* `flutter analyze` analyzes the code style of the entire project.
* `flutter test` executes unit and widget tests (which we don't really have).
* `flutter run` starts the app on an emulator that has to be running or a connected device.
