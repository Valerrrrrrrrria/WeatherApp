//
//  ViewController.swift
//  WeatherApp
//
//  Created by Валерия Новикова on 28/03/2025.
//

import UIKit

class ViewController: UIViewController {
    
    private let scroolView = UIScrollView()
    
    private(set) lazy var navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        let navigationItem = UINavigationItem()
        navigationItem.title = "City Name"
        navigationItem.leftBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(presentSettings), imageResourse: .burgerSvg, withsize: CGSize(width: 34, height: 18))
        navigationItem.rightBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(presentLocationSettings), imageResourse: .locationSvg, withsize: CGSize(width: 20, height: 26))
        navigationBar.tintColor = .black
        navigationBar.barTintColor = .systemBackground
        navigationBar.shadowImage = UIImage()
        navigationBar.setItems([navigationItem], animated: false)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        return navigationBar
    }()
    
    private(set) lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.backgroundColor = .cyan
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()

        override func viewDidLoad() {
            super.viewDidLoad()
            scroolView.delegate = self
            view.backgroundColor = UIColor.systemBackground
            view.addSubview(navigationBar)
            view.addSubview(pageControl)
            view.addSubview(scroolView)
            setUpConstraints()
        }
    
    override func viewDidLayoutSubviews() {
        if scroolView.subviews.count == 2 {
            configureScroolView()
        }
    }

        func setUpConstraints() {
            let navigationBarConstraints = [
                navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                navigationBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                navigationBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ]
            NSLayoutConstraint.activate(navigationBarConstraints)
            
            let pageControlConstraints = [
                pageControl.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 0),
                pageControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                pageControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ]
            NSLayoutConstraint.activate(pageControlConstraints)
            
            scroolView.backgroundColor = .darkGray
            scroolView.translatesAutoresizingMaskIntoConstraints = false
            let scroolViewConstraints = [
                scroolView.topAnchor.constraint(equalTo: pageControl.bottomAnchor),
                scroolView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                scroolView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                scroolView.heightAnchor.constraint(equalToConstant: 300)
            ]
            NSLayoutConstraint.activate(scroolViewConstraints)
        }
    
    @objc func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        scroolView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.width, y: 0 ), animated: true)
    }
    
    func configureScroolView() {
        scroolView.contentSize = CGSize(width: view.frame.width * 5, height: scroolView.frame.height)
        scroolView.isPagingEnabled = true
        
        let colors: [UIColor] = [
            .red,
            .black,
            .blue,
            .cyan,
            .green
        ]
        
        for i in 0..<5 {
            let page = UIView(frame: CGRect(x: CGFloat(i) * view.frame.width, y: 0, width: view.frame.width, height: scroolView.frame.height))
            page.backgroundColor = colors[i]
            scroolView.addSubview(page)
        }
    }
    
    @objc func presentSettings() {
        
    }  
    
    @objc func presentLocationSettings() {
        let onboardingViewController = OnboardingViewController()
        onboardingViewController.modalPresentationStyle = .fullScreen
        present(onboardingViewController, animated: false)
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

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scroolView.contentOffset.x) / Float(scroolView.frame.width)))
    }
}
