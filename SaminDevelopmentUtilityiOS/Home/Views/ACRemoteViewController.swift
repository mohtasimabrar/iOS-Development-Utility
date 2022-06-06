//
//  ACRemoteViewController.swift
//  SaminDevelopmentUtilityiOS
//
//  Created by Mohtasim Abrar Samin on 31/5/22.
//

import UIKit

class ACRemoteViewController: UIViewController {
    
    var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Hello World"
        
        return $0
    }(UILabel())

    override func viewDidLoad() {
        super.viewDidLoad()

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
