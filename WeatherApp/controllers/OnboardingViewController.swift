//
//  OnboardingViewController.swift
//  WeatherApp
//
//  Created by Валерия Новикова on 03/04/2025.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private(set) lazy var onboardingImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(resource: .onboardingSvg))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(resource: .accent)
        
        view.addSubview(onboardingImageView)
        setUpConstraints()
    }
    
    func setUpConstraints() {
        let onboardingImageViewConstraints = [
            onboardingImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardingImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 148),
            onboardingImageView.widthAnchor.constraint(equalToConstant: 180),
            onboardingImageView.heightAnchor.constraint(equalToConstant: 196)
        ]
        NSLayoutConstraint.activate(onboardingImageViewConstraints)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
