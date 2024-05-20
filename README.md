# plarfrom_converter_app

### 1. Platform-Specific Code and Plugins
Platform Channels:

* *Android* : Flutter uses Java/Kotlin for native Android code. Developers can invoke Android-specific APIs and use Android SDK functionalities through platform channels.
* *iOS* : Flutter uses Objective-C/Swift for native iOS code. Similarly, developers can call iOS-specific APIs using platform channels.
* *Plugins* :Plugins might have different implementations for Android and iOS. When integrating a plugin, you might notice separate setup steps and configuration for each platform.
### 2. UI and Design Guidelines
Material Design vs. Cupertino:

* *Android*: Typically follows Material Design guidelines, which is Google's design language for Android apps. Flutter provides a rich set of Material widgets.
* *iOS*: Uses Cupertino widgets that mimic Apple's iOS design guidelines, ensuring the app feels native on iOS devices.

Scaffolding:

* *Android*: Uses Scaffold widget to implement basic Material Design layout structure.
* *iOS*: Uses CupertinoPageScaffold for creating basic layout structure in accordance with Cupertino design.

### 3. Build and Deployment
Build Process:

* *Android*: Builds with Gradle, and the output is an APK (Android Package) or AAB (Android App Bundle).
* *iOS*: Uses Xcode and outputs an IPA (iOS App Archive). This process requires a macOS environment for development and deployment due to Xcode dependency.

Deployment:

* *Android*: Apps are distributed through Google Play Store or directly as APKs/AABs.
* *iOS*: Apps are distributed through the Apple App Store, requiring a review process and adherence to Apple's guidelines.

### 4. Development and Testing
Emulators and Simulators:

* *Android*: Android Studio provides an Android Emulator with various device configurations.
* *iOS*: Xcode provides an iOS Simulator for testing on different iPhone and iPad models.

Hot Reload and Hot Restart:
* Both platforms support Flutter’s hot reload and hot restart features, but the speed and performance might slightly vary due to differences in the underlying systems.

### 5. Platform-Specific Features and Permissions
Permissions:

* *Android*: Permissions are managed in the AndroidManifest.xml file. Runtime permissions also need to be handled in code for versions Marshmallow (API level 23) and above.
* *iOS*: Permissions are managed in the Info.plist file, and you need to provide usage descriptions for accessing certain features like the camera, location, etc.

Background Services:

* *Android*: More flexibility with background services and jobs, but requires careful handling of battery optimization and Doze mode.
* *iOS*: More restrictive with background tasks, and specific modes need to be enabled for background processing (like background fetch, push notifications).

### 6. User Interaction and Navigation
Back Navigation:

* *Android*: Physical back button handling needs to be managed, as Android devices typically have a dedicated back button.
* *iOS*: Navigation is usually managed through the navigation bar, with no physical back button. Swipe gestures are also common for back navigation.

Gestures:

* Android and iOS: Flutter provides a unified way to handle gestures, but certain platform-specific gestures might need custom handling.

### 7. Platform-Specific APIs and SDKs
* *Android*:Provides APIs for features like Google Play Services, Android-specific hardware interactions, etc.
* *iOS*:Provides APIs for iOS-specific features like ARKit, iCloud, and integration with other Apple services.

## Android Platfrom


### Light Mode

<p align = 'center'>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/b296d284-12ed-4b3e-8eed-b7a22f732c7c' width = 250>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/246b4bb0-9763-475c-970b-bdb3bb9e439f' width = 250>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/bff95c21-6ab5-45d2-8523-bb3f1102cac6' width = 250>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/cbf4fc52-62c9-4dae-b728-e239c90f1ad8' width = 250>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/9384520b-5d16-4711-9360-c6cc0a0ad5a4' width = 250>
</p>

### Dark Mode 
<p align = 'center'>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/4639f8b5-2a6b-4499-a2c9-7394a91c1fd7' width = 250>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/5745e114-7f13-4a42-8b98-067e57464303' width = 250>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/28e49c45-efc8-48a1-a4e9-35c6bb446e34' width = 250>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/b1c24b4e-3126-4d41-813d-5be3bdf5e91c' width = 250>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/0d707f55-bfb1-4959-add1-80d961d99131' width = 250>
</p>

## IOS Platfrom

### Light Mode
<p align = 'center'>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/781db653-d9cb-4451-bb7e-07471cba1fd9' width = 250>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/444482b8-6186-4e1d-89c2-cfc7bd95e3de' width = 250>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/7d303bb9-14e8-40da-91e9-23ae09e76c36' width = 250>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/7765b38d-797c-40f7-a04f-0296e8ec3cca' width = 250>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/28743a82-a1bc-4812-8500-d5d5c4f69d9c' width = 250>
</p>

### Dark Mode 
<p align = 'center'>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/1aa21d33-f92a-46c0-80ee-42efb3e327f0' width = 250>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/30a95ef4-25ae-4f9a-9964-a3844b651675' width = 250>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/2293fec9-aa79-4e94-ae7d-fba2d05e90e4' width = 250>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/02d5f0ed-4188-438c-a0ed-dbcd1fa5838c' width = 250>
  <img src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/c027faab-e30f-4cb8-a7be-5620c8bf4fa6' width = 250>
</p>
<a href='https://github.com/Aksharpatel06/plarfrom_converter_app/tree/master/lib' align = 'center'>👉 📚 Go to dart file 📚 👈</a>
## Video
<video src='https://github.com/Aksharpatel06/plarfrom_converter_app/assets/143181114/3de7b1fc-5656-41fe-a437-a2754e441c75' align = 'center'>
