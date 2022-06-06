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
        $0.minimumValue = 1
        $0.maximumValue = 3
        $0.value = 2
        $0.addTarget(self, action: #selector(sliderValueDidChange(slider: event:)), for: .valueChanged)
        $0.maximumTrackTintColor = .systemGray5
        $0.minimumTrackTintColor = UIColor(hex: "#f088c7")
        $0.thumbTintColor = UIColor(hex: "6B78B9")
        $0.setThumbImage(UIImage(named: "sliderThumbImage"), for: .normal)
        $0.setThumbImage(UIImage(named: "sliderThumbImage"), for: .application)
        $0.setThumbImage(UIImage(named: "sliderThumbImage"), for: .focused)
        $0.setThumbImage(UIImage(named: "sliderThumbImage"), for: .selected)
        $0.setThumbImage(UIImage(named: "sliderThumbImage"), for: .highlighted)
        $0.isContinuous = true
        
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
    
    lazy var lowerBoundCircle: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(hex: "#f088c7")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 7.5
        
        return $0
    }(UIView())
    
    lazy var middleBoundCircle: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = self.slider.value >= 50 ? UIColor(hex: "#f088c7") : .systemGray5
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 7.5
        
        return $0
    }(UIView())
    
    lazy var higherBoundCircle: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemGray5
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 7.5
        
        return $0
    }(UIView())

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        [titleLabel, fanSpeedLabels, lowerBoundCircle, middleBoundCircle, higherBoundCircle, slider].forEach {
            containerView.addSubview($0)
        }
        
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
            
            lowerBoundCircle.widthAnchor.constraint(equalToConstant: 15),
            lowerBoundCircle.heightAnchor.constraint(equalToConstant: 15),
            lowerBoundCircle.centerYAnchor.constraint(equalTo: slider.centerYAnchor, constant: 1),
            lowerBoundCircle.leadingAnchor.constraint(equalTo: slider.leadingAnchor),
            
            middleBoundCircle.widthAnchor.constraint(equalToConstant: 15),
            middleBoundCircle.heightAnchor.constraint(equalToConstant: 15),
            middleBoundCircle.centerYAnchor.constraint(equalTo: slider.centerYAnchor, constant: 1),
            middleBoundCircle.centerXAnchor.constraint(equalTo: slider.centerXAnchor),
            
            higherBoundCircle.widthAnchor.constraint(equalToConstant: 15),
            higherBoundCircle.heightAnchor.constraint(equalToConstant: 15),
            higherBoundCircle.centerYAnchor.constraint(equalTo: slider.centerYAnchor, constant: 1),
            higherBoundCircle.trailingAnchor.constraint(equalTo: slider.trailingAnchor),
            
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
    
    @objc func sliderValueDidChange(slider: UISlider, event: UIEvent) {
        self.middleBoundCircle.backgroundColor = slider.value >= 2 ? UIColor(hex: "#f088c7") : .systemGray5
        if let touchEvent = event.allTouches?.first {
                switch touchEvent.phase {
                case .began:
                    return
                case .moved:
                    return
                case .ended:
                    self.slider.setValue(roundf(slider.value), animated: true)
                default:
                    break
                }
            }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
