//
//  SingleDataViewWithSubtitle.swift
//  SaminDevelopmentUtilityiOS
//
//  Created by Mohtasim Abrar Samin on 24/5/22.
//

import UIKit

class SingleDataViewWithSubtitle: UIView {
    
    var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 25, weight: .semibold)
        $0.textColor = UIColor(hex: "#5b4684")
        
        return $0
    }(UILabel())
    var subtitleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.textColor = UIColor.systemGray
        $0.font = .systemFont(ofSize: 15, weight: .light)
        
        return $0
    }(UILabel())

    init(title: String, subtitle: String) {
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        
        titleLabel.text = title
        subtitleLabel.text = subtitle
        
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -10),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
