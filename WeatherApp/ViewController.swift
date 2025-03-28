//
//  ViewController.swift
//  WeatherApp
//
//  Created by Валерия Новикова on 28/03/2025.
//

import UIKit

class ViewController: UIViewController {
    
    private(set) lazy var navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        let navigationItem = UINavigationItem()
        navigationItem.title = "City Name"
        navigationItem.leftBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(presentSettings), imageResourse: .burgerSvg, withsize: CGSize(width: 34, height: 18))
        navigationItem.rightBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(presentLocationSettings), imageResourse: .locationSvg, withsize: CGSize(width: 20, height: 26))
        navigationBar.tintColor = .black
        navigationBar.barTintColor = .systemBackground
        navigationBar.setItems([navigationItem], animated: false)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        return navigationBar
    }()

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = UIColor.systemBackground
            view.addSubview(navigationBar)
            self.setUpConstraints()
        }

        func setUpConstraints() {
            let navigationBarConstraints = [
                navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                navigationBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                navigationBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ]
            NSLayoutConstraint.activate(navigationBarConstraints)
        }
    
    @objc func presentSettings() {
        
    }  
    
    @objc func presentLocationSettings() {
        
    }
}

extension UIBarButtonItem {

    static func menuButton(_ target: Any?, action: Selector, imageResourse: ImageResource, withsize: CGSize) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(resource: imageResourse), for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)

        let menuBarItem = UIBarButtonItem(customView: button)
        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: withsize.height).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: withsize.width).isActive = true

        return menuBarItem
    }
}
