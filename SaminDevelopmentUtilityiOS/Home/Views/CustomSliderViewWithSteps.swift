//
//  CustomSliderViewWithSteps.swift
//  SaminDevelopmentUtilityiOS
//
//  Created by Mohtasim Abrar Samin on 2/6/22.
//

import UIKit

class CustomSliderViewWithSteps: UIView {
    
    var containerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        
        return $0
    }(UIView())
    
    var shadowView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIView())
    
    var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Fan Speed"
        $0.textColor = UIColor(hex: "6B78B9")
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        
        return $0
    }(UILabel())
    
    lazy var slider: UISlider = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.minimumValue = 0
        $0.maximumValue = 100
        $0.value = 50
        $0.tintColor = UIColor(hex: "6B78B9")
        $0.addTarget(self, action: #selector(sliderValueDidChange(_ :)), for: .valueChanged)
        $0.isContinuous = false
        
        return $0
    }(UISlider())
    
    var fanSpeedLabels: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 1
        
        let lowLabel = UILabel()
        lowLabel.translatesAutoresizingMaskIntoConstraints = false
        lowLabel.font = .systemFont(ofSize: 14, weight: .regular)
        lowLabel.textColor = .systemGray2
        lowLabel.text = "Low"
        
        let midLabel = UILabel()
        midLabel.translatesAutoresizingMaskIntoConstraints = false
        midLabel.textAlignment = .center
        midLabel.font = .systemFont(ofSize: 14, weight: .regular)
        midLabel.textColor = .systemGray2
        midLabel.text = "Mid"
        
        let highLabel = UILabel()
        highLabel.translatesAutoresizingMaskIntoConstraints = false
        highLabel.textAlignment = .right
        highLabel.font = .systemFont(ofSize: 14, weight: .regular)
        highLabel.textColor = .systemGray2
        highLabel.text = "High"
        
        $0.addArrangedSubview(lowLabel)
        $0.addArrangedSubview(midLabel)
        $0.addArrangedSubview(highLabel)
        
        return $0
    }(UIStackView())

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(slider)
        containerView.addSubview(fanSpeedLabels)
        
        shadowView.addSubview(containerView)
        
        self.addSubview(shadowView)
        
        NSLayoutConstraint.activate([
            shadowView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            shadowView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            shadowView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            shadowView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            containerView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: shadowView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            slider.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            slider.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            slider.heightAnchor.constraint(equalToConstant: 40),
            
            fanSpeedLabels.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 10),
            fanSpeedLabels.leadingAnchor.constraint(equalTo: slider.leadingAnchor),
            fanSpeedLabels.trailingAnchor.constraint(equalTo: slider.trailingAnchor),
            fanSpeedLabels.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
        
        viewConfigure()
    }
    
    func viewConfigure() {
        
        self.backgroundColor = .clear
        containerView.clipsToBounds = true
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 20
        
        shadowView.clipsToBounds = false
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.05
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shouldRasterize = true
        shadowView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    @objc func sliderValueDidChange(_ sender: UISlider!) {
        if sender.value >= 0 && sender.value <= 50 {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.5) {
                    self.slider.setValue(sender.value >= 25 ? 50.0 : 0.0, animated: true)
                }
            }
        } else {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.5) {
                    self.slider.setValue(sender.value >= 75 ? 100.0 : 50.0, animated: true)
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
