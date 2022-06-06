//
//  ProfileNavigationView.swift
//  SaminDevelopmentUtilityiOS
//
//  Created by Mohtasim Abrar Samin on 23/5/22.
//

import UIKit

class ProfileNavigationView: UIView {
    
    var profileImageView: UIImageView = {
        $0.image = UIImage(named: "profilePicture")
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 20
        
        return $0
    }(UIImageView())
    
    var nameLabel: UILabel = {
        $0.font = .systemFont(ofSize: 25, weight: .regular)
        $0.textColor = .white
        
        return $0
    }(UILabel())
    
    var stackView: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 16
        $0.alignment = .center
        $0.distribution = .equalSpacing
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIStackView())
    
    init(text: String){
        super.init(frame: .zero)
        self.backgroundColor = .clear
        
        nameLabel.text = text
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(profileImageView)
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            profileImageView.heightAnchor.constraint(equalToConstant: 40.0),
            profileImageView.widthAnchor.constraint(equalToConstant: 40.0),
            
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 60.0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
