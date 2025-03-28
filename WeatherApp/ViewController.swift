//
//  ViewController.swift
//  WeatherApp
//
//  Created by Валерия Новикова on 28/03/2025.
//

import UIKit

class ViewController: UIViewController {

    lazy private var sampleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Hello World!"
            label.textColor = UIColor.black
            return label
        }()

        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = UIColor.white
            self.view.addSubview(self.sampleLabel)
            self.setUpConstraints()
        }

        func setUpConstraints() {
            let sampleLabelConstraints = [
                self.sampleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                self.sampleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ]
            NSLayoutConstraint.activate(sampleLabelConstraints)
        }
}

