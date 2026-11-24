//
//  ViewController.swift
//  TestCI
//
//  Created by Yurii Sushko on 24.11.2026.
//

import UIKit

class ViewController: UIViewController {

    private let summaryLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSummaryLabel()
        summaryLabel.text = TodoAnalyzer.summary(SampleData.todos)
    }

    private func setUpSummaryLabel() {
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.numberOfLines = 0
        summaryLabel.textAlignment = .center
        summaryLabel.font = .preferredFont(forTextStyle: .title3)
        summaryLabel.accessibilityIdentifier = "summaryLabel"
        view.addSubview(summaryLabel)

        NSLayoutConstraint.activate([
            summaryLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            summaryLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            summaryLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
}
