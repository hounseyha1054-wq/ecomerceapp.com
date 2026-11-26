# Ecommerce App

A cross-platform Flutter ecommerce application for browsing products, viewing details, searching items, managing an order flow, and completing checkout.

## Features

- Featured product catalogue with banner images
- Popular product listings
- Product search and product-detail screens
- Shopping cart and order flow
- Checkout and checkout confirmation screens
- Profile and settings screens
- Responsive Material UI layout
- Android, iOS, web, Windows, macOS, and Linux support

## Tech Stack

- **Flutter** with **Dart**
- **Material 3** UI components
- `buttons_tabbar` for tab navigation
- `http` for HTTP/network functionality
- Local sample product data stored in `lib/DataApi/DataApi.dart`
- Flutter test and `flutter_lints`

## Project Structure

```text
lib/
├── main.dart                         # Application entry point
├── AppPage/                          # UI screens and navigation
│   ├── Homepage.dart
│   ├── MainPageController.dart
│   ├── SearchPage.dart
│   ├── ShoppingPage.dart
│   ├── ProductDetails.dart
│   ├── CheckOutPageDetails.dart
│   ├── ProccessCheckout.dart
│   ├── Order.dart
│   ├── ProfilePage.dart
│   ├── SettingDetail.dart
│   └── SeeAllProductFeature.dart
├── DataApi/
│   └── DataApi.dart                 # Product, banner, and popular-item data
└── Model/
    └── model.dart                    # Application data model

test/
└── widget_test.dart                  # Flutter widget test
```

## Prerequisites

- Flutter SDK 3.x with Dart SDK `^3.9.2`
- Flutter-compatible platform tools for the targets you want to run
- A device or emulator, or a supported browser

Verify your environment:

```bash
flutter doctor
```

## Getting Started

```bash
# Clone the repository
git clone https://github.com/hounseyha1054-wq/ecomerceapp.com.git
cd ecomerceapp.com

# Install dependencies
flutter pub get

# Run the application
flutter run
```

## Platform-Specific Commands

```bash
# Android
flutter run -d android

# iOS (macOS only)
flutter run -d ios

# Web
flutter run -d chrome

# Windows
flutter run -d windows

# macOS
flutter run -d macos

# Linux
flutter run -d linux
```

## Testing

Run the existing widget test suite with:

```bash
flutter test
```

Analyze the source code with:

```bash
dart analyze
```

## Build

```bash
# Android APK
flutter build apk

# Web
flutter build web

# Windows
flutter build windows

# macOS
flutter build macos

# Linux
flutter build linux
```

## Configuration

The application currently uses local sample catalogue data and remote Unsplash/commerce image URLs. Backend API configuration and persistent cart, authentication, and order storage are not included in the current implementation.

## Development Notes

- The package name is `ecommerce_app`.
- The app entry point is `lib/main.dart`.
- The project has generated platform directories for Android, iOS, web, Windows, macOS, and Linux.
- Some public image URLs may require an internet connection.

## License

No license has been specified for this repository. All rights remain with the repository owner unless a license is added.
