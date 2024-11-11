Flutter To-Do List App
A simple Flutter application for managing a to-do list, using GetX for state management and the MVVM (Model-View-ViewModel) architecture. This app allows users to add new tasks, mark them as complete, and view a list of tasks.

Features
Add New Tasks: Users can add tasks with a title.
Task Completion: Each task has a checkbox to mark it as complete or incomplete.
Dynamic UI: The task list updates automatically whenever tasks are added or their status is toggled.
Project Structure
The app follows the MVVM architecture to separate business logic from the UI for better modularity and maintainability:

Model: Defines the data structure for a to-do item.
View: Contains UI components to display and interact with tasks.
ViewModel: Manages app state and business logic, including adding tasks and toggling their completion status.
Packages
This app uses the GetX package for efficient state management.

Dependencies
Flutter SDK
GetX
Add the following to pubspec.yaml:

yaml
Copy code
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5
Getting Started
Clone the repository:

bash
Copy code
git clone https://github.com/your-username/flutter-todo-app.git
cd flutter-todo-app
Install dependencies:

bash
Copy code
flutter pub get
Run the app:

bash
Copy code
flutter run