//
//  DetailViewNavBar.swift
//  SaminDevelopmentUtilityiOS
//
//  Created by Mohtasim Abrar Samin on 30/5/22.
//

import UIKit

class DetailViewNavBar: UIView {

    var rightButton: UIButton = {
        $0.setTitle("Edit", for: .normal)
        $0.setTitleColor(UIColor.systemGray, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        return $0
    }(UIButton())
    
    var titleLabel: UILabel = {
        $0.font = .systemFont(ofSize: 25, weight: .semibold)
        $0.textColor = UIColor(hex: "6B78B9")
        
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
        
        titleLabel.text = text
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(rightButton)
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            rightButton.heightAnchor.constraint(equalToConstant: 25.0),
            rightButton.widthAnchor.constraint(equalToConstant: 40.0),
            
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 40.0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

