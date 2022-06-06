//
//  RoomViewController.swift
//  SaminDevelopmentUtilityiOS
//
//  Created by Mohtasim Abrar Samin on 30/5/22.
//

import UIKit

class RoomViewController: UIViewController {
    
    let menuItems = ["airport.extreme", "lightbulb", "tv", "speaker", "printer", "homepodmini", "thermometer"]
    
    var navBar: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(DetailViewNavBar(text: "Living room"))
    
    lazy var topMenuCollectionView: UICollectionView = {
        $0.delegate = self
        $0.dataSource = self
        $0.register(TopMenuCollectionViewCell.self, forCellWithReuseIdentifier: TopMenuCollectionViewCell.identifier)
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init()))
    
    var selectionBarShade: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.systemGray6
        
        return $0
    }(UIView())
    
    lazy var controlCollectionView: UICollectionView = {
        $0.delegate = self
        $0.dataSource = self
        $0.register(ACRemoteControlCollectionViewCell.self, forCellWithReuseIdentifier: ACRemoteControlCollectionViewCell.identifier)
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isPagingEnabled = true
        
        return $0
    }(UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "#fbfdff")
        
        let topBarCollectionViewLayout = UICollectionViewFlowLayout()
        topBarCollectionViewLayout.scrollDirection = .horizontal
        topMenuCollectionView.collectionViewLayout = topBarCollectionViewLayout
        
        let controlCollectionViewLayout = UICollectionViewFlowLayout()
        controlCollectionViewLayout.scrollDirection = .horizontal
        controlCollectionView.collectionViewLayout = controlCollectionViewLayout
        
        view.addSubview(navBar)
        view.addSubview(selectionBarShade)
        view.addSubview(topMenuCollectionView)
        view.addSubview(controlCollectionView)
        
        
        DispatchQueue.main.async {
            self.topMenuCollectionView.selectItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, animated: false, scrollPosition: [])
        }
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            navBar.heightAnchor.constraint(equalToConstant: 40.0),
            
            topMenuCollectionView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            topMenuCollectionView.leadingAnchor.constraint(equalTo: navBar.leadingAnchor),
            topMenuCollectionView.trailingAnchor.constraint(equalTo: navBar.trailingAnchor),
            topMenuCollectionView.heightAnchor.constraint(equalToConstant: 60),
            
            selectionBarShade.topAnchor.constraint(equalTo: topMenuCollectionView.bottomAnchor, constant: -2),
            selectionBarShade.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectionBarShade.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectionBarShade.heightAnchor.constraint(equalToConstant: 2),
            
            controlCollectionView.topAnchor.constraint(equalTo: topMenuCollectionView.bottomAnchor, constant: 5),
            controlCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controlCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controlCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension RoomViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topMenuCollectionView {
            return menuItems.count
        } else {
            return menuItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topMenuCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopMenuCollectionViewCell.identifier, for: indexPath) as? TopMenuCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(image: menuItems[indexPath.row])
            
            return cell
        } else if collectionView == controlCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ACRemoteControlCollectionViewCell.identifier, for: indexPath) as? ACRemoteControlCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure()
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == topMenuCollectionView {
            DispatchQueue.main.async {
                self.topMenuCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                self.controlCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topMenuCollectionView {
            return CGSize(width: 60, height: 60)
        } else if collectionView == controlCollectionView {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == topMenuCollectionView {
            return 20
        } else if collectionView == controlCollectionView {
            return 0
        } else {
            return 0
        }
    }
    
}

extension RoomViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard scrollView != topMenuCollectionView else { return }
        
        for cell in controlCollectionView.fullyVisibleCouponCells {
            guard let indexPath = controlCollectionView.indexPath(for: cell) else { return }
            DispatchQueue.main.async {
                self.topMenuCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                self.topMenuCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
            }
        }
    }
}
