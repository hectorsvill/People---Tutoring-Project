# People – iOS Tutoring Project

A hands-on iOS app built incrementally across tutoring sessions to teach Swift and UIKit fundamentals. The app fetches random user profiles from the [Random User API](https://randomuser.me/), displays them in a table view, and lets users mark favorites.

---

## About

This project was used to tutor students in iOS development. Each lesson introduced new concepts and was applied directly to this app, so learners could see how real-world features are built step by step.

**Tech stack:** Swift · UIKit · MVC · URLSession · Codable

---

## App Features

- Fetches 5 random people from the [Random User API](https://randomuser.me/api/?results=5)
- Displays people in a `UITableView` with a custom cell showing name and favorite status
- Tap a person to open a detail view with their full name
- Toggle a favorite (heart) button on the list and detail views using SF Symbols (`heart` / `heart.fill`)
- Delegate pattern used to keep the table in sync with the detail view

---

## Project Structure

```
People/
├── Life Cycle/
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── Model/
│   ├── Person.swift          # Core data model
│   └── Person_Rep.swift      # Decodable representation of the API response
├── ModelController/
│   └── PeopleController.swift  # Networking & data management
├── View Controllers/
│   ├── PeopleTableViewController.swift
│   ├── PersonDetailViewController.swift
│   └── Views/
│       └── PersonTableViewCell.swift
└── Extension/
    └── UIImage+configureFavoriteImage.swift
```

---

## Lessons

### Lesson 1 – Foundations
- [Managing Your App's Life Cycle](https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle)
- [MVC Architecture](https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html)
  - Models, Model Controllers, and Views
- Build a basic app with a `UITableView` and a standard cell

### Lesson 2 – Navigation & Patterns
- Navigating to a detail view using `prepare(for:sender:)`
- Using SF Symbols (system images)
- Toggling a boolean with `.toggle()` — [Bool Documentation](https://developer.apple.com/documentation/swift/bool)
- [Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html): defining blueprints for methods and properties
- **Delegate Pattern**: how to use delegate protocols to allow objects to communicate back to their owner in a decoupled way

### Lesson 3 – Custom Views & Swift Features
- Creating a custom `UITableViewCell` subclass
- `didSet` property observers
- Extensions
- Using `fatalError()` for unrecoverable states
- Computed Properties

---

## Requirements

- Xcode 12+
- iOS 14+
- Swift 5

## Getting Started

1. Clone the repository
2. Open `People.xcodeproj` in Xcode
3. Select a simulator (iPhone 12 or later recommended)
4. Build and run (`⌘R`)

> The app fetches data from `https://randomuser.me/api/?results=5` on launch — an internet connection is required. 
