//
//  RoomsSegmentTableViewCell.swift
//  SaminDevelopmentUtilityiOS
//
//  Created by Mohtasim Abrar Samin on 25/5/22.
//

import UIKit

protocol RoomsSegmentTableViewCellDelegate: AnyObject {
    func didSelectItem()
}

class RoomsSegmentTableViewCell: UITableViewCell {

    static let identifier = "RoomsSegmentCell"
    
    static weak var delegate: RoomsSegmentTableViewCellDelegate?
    
    let routines = [("Living Room","house.fill", "23° C", "74%"), ("Bedroom","bed.double.fill", "26° C", "67%"), ("Guest Room","person.2.fill", "28° C", "75%")]

    var bannerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(SegmentBannerView(title: "Rooms"))
    
    lazy var collectionView: UICollectionView = {
        $0.delegate = self
        $0.dataSource = self
        $0.register(RoomsSegmentCollectionViewCell.self, forCellWithReuseIdentifier: RoomsSegmentCollectionViewCell.identifier)
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init()))
    
    var containerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        self.backgroundColor = .clear
        
        containerView.addSubview(bannerView)
        containerView.addSubview(collectionView)
        
        self.contentView.addSubview(containerView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            bannerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 22),
            bannerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -22),
            bannerView.heightAnchor.constraint(equalToConstant: 30),
            
            collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: -10),
            collectionView.heightAnchor.constraint(equalToConstant: 120),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension RoomsSegmentTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoomsSegmentCollectionViewCell.identifier, for: indexPath) as? RoomsSegmentCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(title: routines[indexPath.row].0, icon: routines[indexPath.row].1, temp: routines[indexPath.row].2, hum: routines[indexPath.row].3)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return routines.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        RoomsSegmentTableViewCell.delegate?.didSelectItem()
    }
}
