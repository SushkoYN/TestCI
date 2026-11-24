//
//  TodoAnalyzer.swift
//  TestCI
//

import Algorithms // Swift Package: apple/swift-algorithms
import Foundation

/// Pure functions over `TodoItem`. Every function leans on swift-algorithms,
/// so a broken/missing SPM resolution fails the CI build.
nonisolated enum TodoAnalyzer {

    /// Titles without case-insensitive duplicates, original order preserved.
    /// Uses `uniqued(on:)`.
    static func uniqueTitles(_ items: [TodoItem]) -> [String] {
        items
            .uniqued(on: { $0.title.lowercased() })
            .map(\.title)
    }

    /// Splits items into pages of at most `size` elements.
    /// Uses `chunks(ofCount:)`. Returns no pages for `size <= 0`.
    static func pages(_ items: [TodoItem], size: Int) -> [[TodoItem]] {
        guard size > 0 else { return [] }
        return items.chunks(ofCount: size).map(Array.init)
    }

    /// Lowest- and highest-priority items, or `nil` for an empty list.
    /// Uses `minAndMax(by:)`.
    static func priorityExtremes(_ items: [TodoItem]) -> (lowest: TodoItem, highest: TodoItem)? {
        guard let result = items.minAndMax(by: { $0.priority < $1.priority }) else { return nil }
        return (result.min, result.max)
    }

    /// Share of finished items in `0...1`. Empty list gives `0`.
    static func completionRate(_ items: [TodoItem]) -> Double {
        guard !items.isEmpty else { return 0 }
        return Double(items.filter(\.isDone).count) / Double(items.count)
    }

    /// One-line summary shown on the main screen.
    static func summary(_ items: [TodoItem]) -> String {
        let percent = Int((completionRate(items) * 100).rounded())
        return "\(uniqueTitles(items).count) unique tasks, \(percent)% done"
    }
}
