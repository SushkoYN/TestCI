//
//  SampleData.swift
//  TestCI
//

import Foundation

/// Hard-coded mock data. Replace with a real store when the app grows.
nonisolated enum SampleData {
    static let todos: [TodoItem] = [
        TodoItem(title: "Set up Fastlane", isDone: true, priority: .high),
        TodoItem(title: "Write GitHub Actions workflow", isDone: true, priority: .high),
        TodoItem(title: "Add SwiftLint", isDone: false, priority: .medium),
        TodoItem(title: "add swiftlint", isDone: false, priority: .low), // duplicate on purpose
        TodoItem(title: "Enable branch protection", isDone: false, priority: .high),
        TodoItem(title: "Create App Store Connect API key", isDone: false, priority: .medium),
        TodoItem(title: "Configure match", isDone: false, priority: .medium),
        TodoItem(title: "Upload to TestFlight", isDone: false, priority: .low)
    ]
}
