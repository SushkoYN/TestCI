//
//  TestCITests.swift
//  TestCITests
//
//  Created by Yurii Sushko on 24.11.2026.
//

import Testing
@testable import TestCI

struct TodoAnalyzerTests {

    @Test func uniqueTitlesIgnoresCase() {
        let titles = TodoAnalyzer.uniqueTitles(SampleData.todos)
        #expect(titles.count == SampleData.todos.count - 1)
        #expect(titles.filter { $0.lowercased() == "add swiftlint" }.count == 1)
    }

    @Test func pagesSplitsIntoChunks() {
        let pages = TodoAnalyzer.pages(SampleData.todos, size: 3)
        #expect(pages.map(\.count) == [3, 3, 2])
    }

    @Test func pagesWithNonPositiveSizeIsEmpty() {
        #expect(TodoAnalyzer.pages(SampleData.todos, size: 0).isEmpty)
    }

    @Test func priorityExtremesFindsBounds() throws {
        let extremes = try #require(TodoAnalyzer.priorityExtremes(SampleData.todos))
        #expect(extremes.lowest.priority == .low)
        #expect(extremes.highest.priority == .high)
    }

    @Test func priorityExtremesOfEmptyListIsNil() {
        #expect(TodoAnalyzer.priorityExtremes([]) == nil)
    }

    @Test func completionRate() {
        #expect(TodoAnalyzer.completionRate([]) == 0)
        #expect(TodoAnalyzer.completionRate(SampleData.todos) == 0.125)
    }

    @Test func summaryText() {
        #expect(TodoAnalyzer.summary(SampleData.todos) == "7 unique tasks, 25% done")
    }
}
