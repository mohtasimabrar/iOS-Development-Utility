//
//  SegmentBannerView.swift
//  SaminDevelopmentUtilityiOS
//
//  Created by Mohtasim Abrar Samin on 25/5/22.
//

import UIKit

class SegmentBannerView: UIView {

    var titleLabel: UILabel = {
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        
        return $0
    }(UILabel())
    
    var button: UIButton = {
        $0.setTitle("View all", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        $0.contentHorizontalAlignment = .right
        
        return $0
    }(UIButton())
    
    var hStack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 0
        $0.distribution = .equalSpacing
        $0.alignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIStackView())
    
    init(title: String) {
        super.init(frame: .zero)
        
        titleLabel.text = title
        
        hStack.addArrangedSubview(titleLabel)
        hStack.addArrangedSubview(button)
        
        self.addSubview(hStack)
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 80),
            
            hStack.topAnchor.constraint(equalTo: self.topAnchor),
            hStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hStack.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
