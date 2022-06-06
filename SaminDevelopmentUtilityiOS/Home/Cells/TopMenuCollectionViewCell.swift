//
//  TopMenuCollectionViewCell.swift
//  SaminDevelopmentUtilityiOS
//
//  Created by Mohtasim Abrar Samin on 30/5/22.
//

import UIKit

class TopMenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TopMenuCollectionViewCell"
    
    var currentlySelected = false
    
    var imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .systemGray4
        
        return $0
    }(UIImageView())
    
    var selectionBar: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(hex: "6B78B9")
        
        return $0
    }(UIView())
    
    override var isSelected: Bool {
        didSet {
            selectionBar.isHidden = !isSelected
            imageView.tintColor = isSelected ? UIColor(hex: "6B78B9") : UIColor.systemGray4
            currentlySelected = isSelected
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        selectionBar.isHidden = !currentlySelected
        
        contentView.addSubview(imageView)
        contentView.addSubview(selectionBar)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            selectionBar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            selectionBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            selectionBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            selectionBar.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    
    func configure(image: String) {
        imageView.image = UIImage(systemName: "\(image)")?.withTintColor(UIColor.systemGray4)
        selectionBar.isHidden = !currentlySelected
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
