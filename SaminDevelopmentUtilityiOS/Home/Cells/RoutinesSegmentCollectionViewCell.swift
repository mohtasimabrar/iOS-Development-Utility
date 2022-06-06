//
//  RoutinesSegmentCollectionViewCell.swift
//  SaminDevelopmentUtilityiOS
//
//  Created by Mohtasim Abrar Samin on 25/5/22.
//

import UIKit

class RoutinesSegmentCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RoutinesSegmentCollectionViewCell"
    
    var currentlySelected: Bool = false
    
    var titleLabel: UILabel = {
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.text = "Placeholder"
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UILabel())
    
    var iconImageView: UIImageView = {
        $0.image = UIImage(systemName: "photo")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        
        return $0
    }(UIImageView())
    
    var containerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIView())
    
    var shadowView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIView())
    
    lazy var gradientLayer: CAGradientLayer = {
        $0.frame = containerView.bounds
        $0.colors = [UIColor(hex: "e85dbc").cgColor, UIColor(hex: "f995ad").cgColor]
        $0.startPoint = CGPoint(x: 0, y: 0)
        $0.endPoint = CGPoint(x: 1, y: 0)
        
        return $0
    }(CAGradientLayer())
    
    override var isSelected: Bool {
        didSet {
            isSelected ? self.containerView.layer.insertSublayer(gradientLayer, at: 0) : containerView.layer.sublayers?.filter{ $0 is CAGradientLayer }.forEach{ $0.removeFromSuperlayer() }
            self.iconImageView.tintColor = isSelected ? .white : UIColor(hex: "6B78B9")
            self.titleLabel.textColor = isSelected ? .white : .darkGray
            currentlySelected = isSelected
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        containerView.addSubview(iconImageView)
        containerView.addSubview(titleLabel)
        
        shadowView.addSubview(containerView)
        
        self.contentView.addSubview(shadowView)
        
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            shadowView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            shadowView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            iconImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            iconImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: -5),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configure(title: String, icon: String){
        titleLabel.text = title
        iconImageView.image = UIImage(systemName: "\(icon)")?.withRenderingMode(.alwaysTemplate)
        iconImageView.tintColor = currentlySelected ? .white : UIColor(hex: "6B78B9")
        
        containerView.clipsToBounds = true
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 15
        containerView.backgroundColor = .white
        
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
