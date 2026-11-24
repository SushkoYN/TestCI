//
//  TodoItem.swift
//  TestCI
//

import Foundation

/// Mock domain model used to exercise CI (build, tests, SPM).
nonisolated struct TodoItem: Identifiable, Equatable, Sendable {
    enum Priority: Int, Comparable, Sendable {
        case low = 1
        case medium = 2
        case high = 3

        static func < (lhs: Priority, rhs: Priority) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }

    let id: UUID
    var title: String
    var isDone: Bool
    var priority: Priority

    init(id: UUID = UUID(), title: String, isDone: Bool = false, priority: Priority = .medium) {
        self.id = id
        self.title = title
        self.isDone = isDone
        self.priority = priority
    }
}
