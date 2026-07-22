# Mini Course Player App

A Flutter application that allows users to browse courses, watch videos, and automatically resume playback from the last watched position.

---
🎥 **Demo Video:**  
[Watch the demo here](YOUR_VIDEO_LINK)

---

## Features

- Browse available courses
- Video playback using Chewie & Video Player
- Resume playback after reopening the app
- Course progress tracking
- No internet and video error handling with retry support
- Image loading and fallback UI
- Unit and Widget tests

---

## Tech Stack

- Flutter
- Flutter Bloc (Cubit)
- Chewie
- Video Player
- SharedPreferences

---

## Project Structure

- Course List Screen
- Course Detail Screen
- Playback Service
- Shared Preferences persistence

---

## Getting Started

```bash
flutter pub get
flutter run
```

---

## Running Tests

```bash
flutter test
```

---

## Tests Included

- Unit Test for PlaybackService
- Widget Test for ErrorStateWidget

For implementation details, see:

- RATIONALE.md
- AI_DISCLOSURE.md
