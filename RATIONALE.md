# Project Rationale

## State Management

I chose Flutter Bloc (Cubit) because it provides a clean separation between business logic and UI while keeping the implementation simple and maintainable. Since this application has a small number of screens and straightforward state transitions, Cubit was sufficient without the additional complexity of full Bloc events.

## Resume Playback

Resume playback is implemented using SharedPreferences. The playback position is automatically saved every second while the video is playing using the course ID as the storage key. When the user opens the course again, the saved position is retrieved and playback resumes from where it was left. Once the video finishes, the saved position is cleared so the course starts from the beginning next time.

### Trade-offs

SharedPreferences is lightweight and works well for storing simple values such as playback positions. For a larger production application, I would use a local database such as Hive or SQLite, or synchronize progress with a backend service.

## What I would improve with more time

- Automatically update the course list progress while the user is watching a video.
- Mark completed courses with a "Completed" badge.
- Increase test coverage with additional widget and integration tests.
- Support subtitles and multiple video quality options.