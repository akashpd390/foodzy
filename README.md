Foodzy

Foodzy is a Flutter-based mobile application project. This repository contains all the necessary files and directories to build, test, and run the Foodzy app on multiple platforms including Android, iOS, web, Windows, macOS, and Linux.

## Features

- Cross-platform Flutter application
- State management with `flutter_bloc`
- HTTP networking with `http`
- Custom fonts and assets support

## Getting Started


1. **Install dependencies:**
   ```sh
   flutter pub get
   ```

2. **Run the app:**
   ```sh
   flutter run
   ```


## Directory Structure

```
.
├── android/           # Android native project files
├── assets/            # App images and other assets
├── build/             # Generated build outputs (ignored in VCS)
├── fonts/             # Custom font files
├── ios/               # iOS native project files
├── lib/               # Main Dart source code
├── linux/             # Linux desktop project files
├── macos/             # macOS desktop project files
├── test/              # Unit and widget tests
├── web/               # Web platform files
├── windows/           # Windows desktop project files
├── .dart_tool/        # Dart and Flutter tool files (ignored in VCS)
├── .gitignore         # Git ignore rules
├── analysis_options.yaml # Linting rules
├── pubspec.yaml       # Project metadata and dependencies
├── pubspec.lock       # Locked dependency versions
└── README.md          # Project documentation
```


## Dependencies

- [flutter_bloc 9.1.1](https://pub.dev/packages/flutter_bloc)
- [http ](https://pub.dev/packages/http)
- [Flutter 3.19.5](https://flutter.dev)

## Assets

- Images: `assets/header_image.jpg`
- Fonts: `fonts/ProductSans-Bold.ttf`, `fonts/ProductSans-Regular.ttf`

## Lib Structure

```
lib/
├── core/                       # this contains all the confogurations 
    ├── app_config.dart         # app configuration like apiurl, asserts etc

├── data/                       # Data layer to communcate with severs
    ├──categories_vend_screen/
        ├──model/
        ├──repo/
        ├──usecase/
    ├──vendors_screen/
        ├──model/
        ├──repo/
        ├──usecase/

├── domain/                     # Domain layer acts as bridge bw ui and data
    ├──categories_vend_screen/
        ├──datasource/
        ├──repo_impl/
    ├──vendors_screen/
        ├──datasource/
        ├──repo_impl/
├── persentation/               # Ui or Veiw layer for user interaction
    ├──categories_vend_screen/
        ├──bloc/                # state
        ├──pages/               # pages
        ├──widgets/             # reusable components
    ├──vendors_screen/
        ├──bloc/
        ├──pages/
        ├──widgets/

├── main.dart          # App entry point
```


### Notes

I have done my best to replicate the app as closely as possible to the original. While the result may not fully match what was demonstrated, this reflects my current understanding and effort. I've learned a lot through this process, and I’m aware there’s still more to improve and explore. I look forward to growing further and refining my skills.

Thank you for the opportunity.

Akash
