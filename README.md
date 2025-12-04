# AppDrop — Dynamic Widget Rendering Engine

This repository contains a compact Flutter application that renders a mobile page purely from JSON. It's built to be
clean, modular, and easy to extend. The codebase is intentionally pragmatic and "human-friendly": variable names are
clear, the architecture is straightforward, and components are small and readable.

## What this app does
- Loads a page description from `assets/sample.json`.
- Parses the JSON into simple Dart models.
- Uses a factory approach to render components (banner, carousel, grid, video, text).
- Keeps UI responsive and handles missing/invalid fields gracefully.

## Why this design
- **Readability**: The code is organized by responsibility (models, components, services).
- **Extensibility**: Adding a new component is a single-file job + a factory case.
- **Simplicity**: No heavy state-management libraries — a `FutureBuilder` handles JSON loading.

## Project layout (short)
```
lib/
│
├── components/
│   └── textblock_widget.dart            

├── model/
│   ├── component_model.dart
│   └── page_model.dart                
│
├── pages/
│   └── home_page.dart                  
│
├── services/
│   └── jsondata_loader.dart             
│
└── widgets/
    ├── banner_widget.dart
    ├── carousel_widget.dart
    ├── component_factory.dart           
    ├── grid_widget.dart
    ├── page_rendering.dart              
    └── video_widget.dart

```


## How to run (quick)
1. Create a Flutter project: `flutter create appdrop_dynamic`.
2. Replace/add the `lib/` files and `assets/sample.json` from this canvas.
3. Update your `pubspec.yaml` with the dependencies and add the asset entry.
4. Add internet permission in `android/app/src/main/AndroidManifest.xml`.
5. Run:
```bash
flutter pub get
flutter run
```


## Build APK
```bash
flutter build apk --release
# or for debug
flutter build apk
```


## Small developer notes
- Image URLs in `sample_page.json` are public sample images; replace with your own assets or CDN in production.
- The video sample uses a small public mp4 for demonstration; network video can be slower on some devices.
- If you prefer state management later, the code is easy to adapt (wrap JsonLoader as a ChangeNotifier).


---