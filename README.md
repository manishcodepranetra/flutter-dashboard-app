# Flutter Dashboard App

A simple and responsive Flutter Dashboard application built using Flutter and Dart.

The application provides task management functionality with status filtering, dynamic task creation, and pull-to-refresh support.

## Features

### 1. Dashboard UI

- Clean and modern dashboard interface.
- App bar with menu icon and profile avatar.
- Greeting section.
- Task cards with rounded corners and shadows.
- Bottom navigation bar.

### 2. Add New Tasks

- Click the Refresh button to add a new task.
- Task titles increment automatically (Task 4, Task 5, Task 6, etc.).
- Subtitles increment automatically (Subtitle 4, Subtitle 5, Subtitle 6, etc.).
- Each new task receives a randomly selected status:
  - Active
  - Pending
  - Done

### 3. Status Filter

Users can filter tasks using the following options:

- All: Displays all available tasks.
- Active: Displays only active tasks.
- Pending: Displays only pending tasks.
- Done: Displays only completed tasks.

An empty-state message, "No tasks available", is displayed when no tasks match the selected filter.

### 4. Pull to Refresh

- Pull down on the task list to reset the dashboard.
- Removes all dynamically added tasks.
- Restores the initial three tasks.
- Resets task numbering to Task 4.
- Resets the selected filter to All.

### 5. Task Status Colors

| Status  | Color |
| ------- | ----- |
| Active  | Green |
| Pending | Blue  |
| Done    | Grey  |

## Project Structure

```text
flutter-dashboard-app/
│
├── android/
├── ios/
├── lib/
│   │
│   ├── main.dart
│   │
│   ├── models/
│   │   └── task_model.dart
│   │
│   ├── screens/
│   │   └── dashboard_screen.dart
│   │
│   └── widgets/
│       └── dashboard_card.dart
│
├── test/
├── pubspec.yaml
└── README.md
```

## Technologies Used

- Flutter
- Dart
- Material Design

## Requirements

Before running the project, make sure you have:

- Flutter SDK installed.
- Dart SDK installed (included with Flutter).
- Visual Studio Code or Android Studio.
- Android emulator or physical Android device.
- Git installed.

## Installation and Setup

### 1. Clone the Repository

```bash
git clone https://github.com/techquriousclick/flutter-dashboard-app.git
```

### 2. Navigate to Project Directory

```bash
cd flutter-dashboard-app
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Check Flutter Configuration

```bash
flutter doctor
```

### 5. Check Connected Devices

```bash
flutter devices
```

### 6. Run the Application

```bash
flutter run
```

## Application Workflow

1. Launch the application to view the initial dashboard.
2. Use the status filters to view specific tasks.
3. Click the Refresh button to add new tasks.
4. Each new task receives an incrementing title and subtitle.
5. Pull down on the task list to remove dynamically added tasks and restore the initial three tasks.

## Code Organization

- **Models:** Defines the task data structure.
- **Screens:** Contains the dashboard screen and its state management.
- **Widgets:** Contains reusable UI components such as task cards.
- **Main:** Initializes the Flutter application.

## Future Improvements

- Connect tasks to a backend API.
- Add, edit, and delete task functionality.
- Persist tasks using local storage.
- Implement functional navigation for all bottom navigation tabs.
- Add unit and widget tests.

## License

This project is intended for learning and demonstration purposes.
