//
//  HomeViewController.swift
//  SaminDevelopmentUtilityiOS
//
//  Created by Mohtasim Abrar Samin on 21/4/22.
//

import UIKit

enum HomeViewSections: Int, CaseIterable {
    case overview
    case routines
    case rooms
    case usedDevices
}

class HomeViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        $0.register(OverviewSegmentTableViewCell.self, forCellReuseIdentifier: OverviewSegmentTableViewCell.identifier)
        $0.register(RoutinesSegmentTableViewCell.self, forCellReuseIdentifier: RoutinesSegmentTableViewCell.identifier)
        $0.register(RoomsSegmentTableViewCell.self, forCellReuseIdentifier: RoomsSegmentTableViewCell.identifier)
        $0.register(UsedDevicesSegmentTableViewCell.self, forCellReuseIdentifier: UsedDevicesSegmentTableViewCell.identifier)
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.delegate = self
        $0.dataSource = self
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UITableView())
    
    var profileNavBar: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(ProfileNavigationView(text: "Abrar's Home"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        view.addSubview(profileNavBar)
        view.addSubview(tableView)
        
        addConstraints()
        assignbackground()
    }
    
    func assignbackground(){
        let background = UIImage(named: "background")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            profileNavBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            profileNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            profileNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            profileNavBar.heightAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: profileNavBar.bottomAnchor, constant: 5),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = HomeViewSections(rawValue: indexPath.row)
        
        switch section {
            case .overview:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: OverviewSegmentTableViewCell.identifier) as? OverviewSegmentTableViewCell else {
                    return UITableViewCell()
                }
                cell.cellConfiguration()
                cell.selectionStyle = .none
            
                return cell

            case .routines:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: RoutinesSegmentTableViewCell.identifier) as? RoutinesSegmentTableViewCell else {
                    return UITableViewCell()
                }
                cell.selectionStyle = .none
            cell.collectionView.reloadData()
            
                return cell
            
            case .rooms:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: RoomsSegmentTableViewCell.identifier) as? RoomsSegmentTableViewCell else {
                    return UITableViewCell()
                }
                cell.selectionStyle = .none
            
                return cell
            
            case .usedDevices:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: UsedDevicesSegmentTableViewCell.identifier) as? UsedDevicesSegmentTableViewCell else {
                    return UITableViewCell()
                }
                cell.selectionStyle = .none
            
                return cell
            
            case .none:
                return UITableViewCell()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeViewSections.allCases.count
    }
}
