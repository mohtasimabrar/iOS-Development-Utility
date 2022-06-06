//
//  OverviewSegmentTableViewCell.swift
//  SaminDevelopmentUtilityiOS
//
//  Created by Mohtasim Abrar Samin on 24/5/22.
//

import UIKit

class OverviewSegmentTableViewCell: UITableViewCell {
    
    static let identifier = "OverviewSegmentCell"
    
    var vStack: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.alignment = .fill
        $0.backgroundColor = UIColor.systemGray5
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 1
        
        return $0
    }(UIStackView())
    
    var topHorizontalStack: UIStackView = {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 1
        $0.addArrangedSubview(SingleDataViewWithSubtitle(title: "24° C", subtitle: "avg house temp"))
        $0.addArrangedSubview(SingleDataViewWithSubtitle(title: "69%", subtitle: "humidity"))
        
        return $0
    }(UIStackView())
    
    var bottomHorizontalStack: UIStackView = {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 1
        
        $0.addArrangedSubview(SingleDataViewWithSubtitle(title: "36° C", subtitle: "outside temp"))
        $0.addArrangedSubview(SingleDataViewWithSubtitle(title: "8", subtitle: "devices on"))
        
        return $0
    }(UIStackView())
    
    var containerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIView())
    
    var shadowView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIView())
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        vStack.addArrangedSubview(topHorizontalStack)
        vStack.addArrangedSubview(bottomHorizontalStack)
        
        containerView.addSubview(vStack)
        
        shadowView.addSubview(containerView)
        
        self.contentView.addSubview(shadowView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            
            shadowView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            shadowView.topAnchor.constraint(equalTo: containerView.topAnchor),
            shadowView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            vStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            vStack.topAnchor.constraint(equalTo: containerView.topAnchor),
            vStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    func cellConfiguration() {
        
        self.backgroundColor = .clear
        containerView.clipsToBounds = true
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 20
        
        shadowView.clipsToBounds = false
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.1
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shouldRasterize = true
        shadowView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
