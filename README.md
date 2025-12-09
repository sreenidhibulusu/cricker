# Cricker

Criminal attendance tracking app built for the Vizianagaram Police Station using Flutter, Firebase, and TensorFlow. The app captures geo-tagged check-ins, supports biometric verification, and lets field officers record and review criminal details from the field.

## Features
- Firebase initialization out of the box via `firebase_options.dart`.
- Navigation flow covering login/register, sheet selection (`buttons.dart`/`SecondScreen.dart`), record entry (`details.dart` → Firestore `criminals` collection), record listing (`display.dart`), and verification utilities (`image.dart`, `verification.dart` + `camera_page.dart`).
- Geo-mapped evidence: camera capture with live location lookup (latitude/longitude shown on capture).
- Biometric verification hook: camera feed ready for TensorFlow-based identity checks.
- Image upload from gallery to Firebase Storage with a progress dialog.

## Requirements
- Flutter SDK 3.24+ (Dart 3.9+) and a connected device/emulator with camera + location permissions enabled.
- Firebase project with Firestore and Storage enabled. Place your config files (`android/app/google-services.json` and `ios/Runner/GoogleService-Info.plist`) and regenerate `lib/firebase_options.dart` if your Firebase project changes (`flutterfire configure`).

## Getting started
1) Install dependencies:
```bash
flutter pub get
```
2) Confirm platform configs:
   - Android: ensure `minSdkVersion` matches the `geolocator`/`camera` requirements and that location/camera permissions exist in `AndroidManifest.xml`.
   - iOS: add camera/location usage descriptions in `ios/Runner/Info.plist`.
3) Run the app:
```bash
flutter run
```

## Data model
Firestore collection `criminals` is written in `details.dart` with fields:
- `criminalid` (string), `name` (string), `age` (int), `district`, `address`, `category`, `shift`, and generated `id`.

## Key entry points
- `main.dart` initializes Firebase and launches the app.
- UI flows: `login.dart`, `register.dart`, `buttons.dart`, `SecondScreen.dart`.
- CRUD + listings: `details.dart`, `display.dart`, `read data/get_user_name.dart`.
- Media + verification: `image.dart`, `upload/storage.dart`, `verification.dart`, `camera_page.dart`.
