//
//  RoomsSegmentCollectionViewCell.swift
//  SaminDevelopmentUtilityiOS
//
//  Created by Mohtasim Abrar Samin on 26/5/22.
//

import UIKit

class RoomsSegmentCollectionViewCell: UICollectionViewCell {

    static let identifier = "RoomsSegmentCollectionViewCell"
        
    var titleLabel: UILabel = {
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.text = "Placeholder"
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UILabel())
    
    var iconImage: UIImageView = {
        $0.image = UIImage(systemName: "photo")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        
        return $0
    }(UIImageView())
    
    lazy var iconImageView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(hex: "6B78B9")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.addSubview(iconImage)
        
        return $0
    }(UIImageView())
    
    var tempImageView: UIImageView = {
        $0.image = UIImage(systemName: "thermometer")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = UIColor(hex: "6B78B9")
        $0.contentMode = .scaleAspectFit
        
        return $0
    }(UIImageView())
    
    var humImageView: UIImageView = {
        $0.image = UIImage(systemName: "drop.fill")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = UIColor(hex: "6B78B9")
        $0.contentMode = .scaleAspectFit
        
        return $0
    }(UIImageView())
    
    var tempLabel: UILabel = {
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "00° C"
        
        return $0
    }(UILabel())
    
    var humLabel: UILabel = {
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "00%"
        
        return $0
    }(UILabel())
    
    var containerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIView())
    
    var shadowView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIView())
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        [iconImageView, titleLabel, tempImageView, tempLabel, humImageView, humLabel].forEach { vw in
            containerView.addSubview(vw)
        }
        
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
            
            iconImage.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: 9),
            iconImage.bottomAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: -9),
            iconImage.leadingAnchor.constraint(equalTo: iconImageView.leadingAnchor, constant: 5),
            iconImage.trailingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: -5),
            
            iconImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            iconImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 18),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            tempImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            tempImageView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            tempImageView.heightAnchor.constraint(equalToConstant: 15),
            
            tempLabel.leadingAnchor.constraint(equalTo: tempImageView.trailingAnchor, constant: 2),
            tempLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            tempLabel.heightAnchor.constraint(equalToConstant: 15),
            
            humImageView.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor, constant: 10),
            humImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            humImageView.heightAnchor.constraint(equalToConstant: 15),
            
            humLabel.leadingAnchor.constraint(equalTo: humImageView.trailingAnchor, constant: 2),
            humLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            humLabel.heightAnchor.constraint(equalToConstant: 15)
            
        ])
    }
    
    func configure(title: String, icon: String, temp: String, hum: String){
        titleLabel.text = title
        tempLabel.text = temp
        humLabel.text = hum
        iconImage.image = UIImage(systemName: "\(icon)")?.withRenderingMode(.alwaysTemplate)
        iconImage.tintColor = .white
        
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
