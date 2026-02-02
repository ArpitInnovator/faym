# Faym

A Flutter application that displays a list of product collections using an **accordion-style UI**, where each collection can be expanded or collapsed to reveal product images with smooth animations.


## ✨ Features

- 📋 Scrollable list of collection cards  
- 🪗 Accordion-style expand & collapse behavior  
- 🔽 Only **one collection expanded at a time**


## 📁 Project Structure

```text
lib/
├── main.dart
├── collections_list.dart
├── models/
│   └── collection_model.dart
├── screens/
│   └── collection_screen.dart
└── widgets/
    └── collection_card.dart
```

## 🪗 Accordion Logic

The screen follows an **accordion-style UI**, where only **one collection card** can be expanded at a time.

### State Management
An integer variable is used to track the currently expanded collection:

```dart

//Toggle logic
int expandedIndex = -1;

onTap: () {
  setState(() {
    expandedIndex =
        expandedIndex == index ? -1 : index;
  });
}

//UI rendering logic
final bool isExpanded = expandedIndex == index;


```

## 🖼 App Screenshots

### Collapsed State
![WhatsApp Image 2026-02-03 at 02 57 31](https://github.com/user-attachments/assets/b9549800-4f24-47cf-9a44-44d22e4bb357)

### Expanded State
![WhatsApp Image 2026-02-03 at 02 24 03](https://github.com/user-attachments/assets/6906911e-4ac8-4d4f-8dd7-c11253b76747)


## 📽 Demo Video

👉 [Click here to watch the demo video](https://drive.google.com/file/d/1KZXUcZ3Hm4wsx0dNbSCWVeOe1EZ7DbtF/view?usp=drive_link)

## 📦 APK Download

👉 [Download APK](https://drive.google.com/file/d/1dNLgybI8ZkLUTCOfmaGR1B-JrPfH6Pfa/view?usp=drive_link)


## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed
- Android Studio or VS Code
- Emulator or physical device

### Installation & Run

```bash
flutter pub get
flutter run




