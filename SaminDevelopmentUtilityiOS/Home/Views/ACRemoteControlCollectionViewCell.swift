//
//  ACRemoteControlCollectionViewCell.swift
//  SaminDevelopmentUtilityiOS
//
//  Created by Mohtasim Abrar Samin on 31/5/22.
//

import UIKit

class ACRemoteControlCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "ACRemoteControlCollectionViewCell"
    
    let modes = [("Cool","snowflake"), ("Heat","sun.max"), ("Fan","fanblades"), ("Auto","bolt.badge.a")]
    
    lazy var scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        $0.showsVerticalScrollIndicator = false
        
        return $0
    }(UIScrollView())
    
    var scrollContentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIView())
    
    var tempLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 28, weight: .light)
        $0.textColor = UIColor(hex: "#5b4684")
        
        return $0
    }(UILabel())
    
    var circularSliderView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIView())
    
    lazy var circularSlider: GradientCircularSlider = {
        $0.addTarget(self, action: #selector(ACRemoteControlCollectionViewCell.valueChanged(_:)), for: UIControl.Event.valueChanged)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.maximumAngle = 270.0
        $0.unfilledArcLineCap = .round
        $0.filledArcLineCap = .round
        $0.currentValue = 9
        $0.lineWidth = 12
        $0.labelDisplacement = -10
        $0.labelColor = UIColor(hex: "6B78B9")
        $0.innerMarkingLabels = ["•", "•", "•", "•", "•", "•", "•", "•", "•", "•", "•", "•", "•", "•", "•"]
        $0.unfilledGradientColors = [UIColor(hex: "e85dbc"), UIColor(hex: "f995ad")]
        $0.handleType = .bigCircle
        $0.handleColor = UIColor(hex: "6B78B9")
        
        return $0
    }(GradientCircularSlider(frame: CGRect(x: 0, y: 0, width: circularSliderView.frame.height, height: circularSliderView.frame.height)))
    
    lazy var plusButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(incrementValue), for: .touchUpInside)
        $0.tintColor = UIColor(hex: "6B78B9")
        $0.imageView?.contentMode = .scaleAspectFill
        $0.configuration?.imagePadding = 0
        $0.configuration?.buttonSize = .large
        
        return $0
    }(UIButton())
    
    lazy var minusButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "minus")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(decrementValue), for: .touchUpInside)
        $0.tintColor = UIColor(hex: "6B78B9")
        $0.imageView?.contentMode = .scaleAspectFit
        
        return $0
    }(UIButton())
    
    var humidityStackView: UIStackView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: "drop.fill")?.withRenderingMode(.alwaysTemplate)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = UIColor(hex: "6B78B9")
        
        let textLabel = UILabel()
        textLabel.text = "74%"
        textLabel.font = .systemFont(ofSize: 14, weight: .light)
        textLabel.textColor = .gray
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        $0.addArrangedSubview(iconImageView)
        $0.addArrangedSubview(textLabel)
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 3
        
        return $0
    }(UIStackView())
    
    var powerButtonView: UIView = {
        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = UIImage(systemName: "power")?.withRenderingMode(.alwaysTemplate)
        iconImageView.tintColor = .white
        iconImageView.contentMode = .scaleAspectFit
        
        $0.backgroundColor = UIColor(hex: "6B78B9")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 19
        
        $0.addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: $0.topAnchor, constant: 7),
            iconImageView.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: -7),
            iconImageView.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 7),
            iconImageView.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: -7)
        ])
        
        return $0
    }(UIView())
    
    var powerLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 14, weight: .light)
        $0.text = "Click to turn off"
        
        return $0
    }(UILabel())
    
    var divider: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.systemGray6
        
        return $0
    }(UIView())
    
    lazy var modeSelectCollectionView: UICollectionView = {
        $0.delegate = self
        $0.dataSource = self
        $0.register(ACModeSelectCollectionViewCell.self, forCellWithReuseIdentifier: ACModeSelectCollectionViewCell.identifier)
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init()))
    
    var sliderView: CustomSliderViewWithSteps = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(CustomSliderViewWithSteps())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [circularSlider, plusButton, minusButton, tempLabel, humidityStackView, powerButtonView, powerLabel].forEach {
            circularSliderView.addSubview($0)
        }
        
        [circularSliderView, divider, modeSelectCollectionView, sliderView].forEach {
            scrollContentView.addSubview($0)
        }
        
        scrollView.addSubview(scrollContentView)
        
        contentView.addSubview(scrollView)
        
        circularSlider.transform = circularSlider.getRotationalTransform()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        modeSelectCollectionView.collectionViewLayout = layout
        
        DispatchQueue.main.async {
            self.modeSelectCollectionView.selectItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, animated: false, scrollPosition: [])
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            scrollContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollContentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
            
            circularSliderView.centerXAnchor.constraint(equalTo: scrollContentView.centerXAnchor),
            circularSliderView.heightAnchor.constraint(equalToConstant: 290),
            circularSliderView.widthAnchor.constraint(equalTo: scrollContentView.widthAnchor),
            circularSliderView.topAnchor.constraint(equalTo: scrollContentView.topAnchor),
            
            circularSlider.centerXAnchor.constraint(equalTo: circularSliderView.centerXAnchor),
            circularSlider.centerYAnchor.constraint(equalTo: circularSliderView.centerYAnchor),
            circularSlider.heightAnchor.constraint(equalToConstant: 250),
            circularSlider.widthAnchor.constraint(equalToConstant: 250),
            
            plusButton.leadingAnchor.constraint(equalTo: circularSlider.trailingAnchor),
            plusButton.trailingAnchor.constraint(equalTo: circularSliderView.trailingAnchor),
            plusButton.heightAnchor.constraint(equalTo: circularSliderView.heightAnchor),
            
            minusButton.leadingAnchor.constraint(equalTo: circularSliderView.leadingAnchor),
            minusButton.trailingAnchor.constraint(equalTo: circularSlider.leadingAnchor),
            minusButton.heightAnchor.constraint(equalTo: circularSliderView.heightAnchor),
            
            tempLabel.centerXAnchor.constraint(equalTo: circularSliderView.centerXAnchor),
            tempLabel.topAnchor.constraint(equalTo: circularSlider.bottomAnchor, constant: -150),
            
            humidityStackView.centerXAnchor.constraint(equalTo: tempLabel.centerXAnchor),
            humidityStackView.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 5),
            humidityStackView.heightAnchor.constraint(equalToConstant: 18),
            
            powerButtonView.topAnchor.constraint(equalTo: circularSlider.bottomAnchor, constant: -50),
            powerButtonView.centerXAnchor.constraint(equalTo: tempLabel.centerXAnchor),
            powerButtonView.heightAnchor.constraint(equalToConstant: 38),
            powerButtonView.widthAnchor.constraint(equalToConstant: 38),
            
            powerLabel.topAnchor.constraint(equalTo: powerButtonView.bottomAnchor, constant: 15),
            powerLabel.centerXAnchor.constraint(equalTo: powerButtonView.centerXAnchor),
            powerLabel.heightAnchor.constraint(equalToConstant: 20),
            
            divider.topAnchor.constraint(equalTo: circularSliderView.bottomAnchor, constant: 20),
            divider.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 2),
            
            modeSelectCollectionView.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 20),
            modeSelectCollectionView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            modeSelectCollectionView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor),
            modeSelectCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            sliderView.topAnchor.constraint(equalTo: modeSelectCollectionView.bottomAnchor),
            sliderView.heightAnchor.constraint(equalToConstant: 180),
            sliderView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            sliderView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor),
            sliderView.bottomAnchor.constraint(equalTo: scrollContentView.bottomAnchor, constant: -20)
        ])
    }
    
    func configure() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func valueChanged(_ slider: CircularSlider) {
        tempLabel.text = "\(Int(slider.currentValue + 16.0))° C"
    }
    
    @objc func incrementValue() {
        if circularSlider.maximumValue >= circularSlider.currentValue + 1 {
            circularSlider.currentValue += 1
        }
    }
    
    @objc func decrementValue() {
        if circularSlider.minimumValue <= circularSlider.currentValue - 1 {
            circularSlider.currentValue -= 1
        }
    }
}


extension ACRemoteControlCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ACModeSelectCollectionViewCell.identifier, for: indexPath) as? ACModeSelectCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(title: modes[indexPath.row].0, icon: modes[indexPath.row].1)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modes.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.contentView.frame.width - 60 - 75
        return CGSize(width: width/4, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
}
