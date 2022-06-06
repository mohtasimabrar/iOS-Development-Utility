//
//  GradientCircularSlider.swift
//
//  Created by Christopher Olsen on 03/03/16.
//  Copyright © 2016 Christopher Olsen. All rights reserved.
//

import UIKit

class GradientCircularSlider: CircularSlider {
    // Array with two colors to create gradation between
    var unfilledGradientColors: [UIColor] = [.black, .white] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func drawLine(_ ctx: CGContext) {
        //For filled area
        if unfilledGradientColors.count == 2 {
            CircularTrig.drawUnfilledGradientArcInContext(ctx, center: centerPoint, radius: computedRadius, lineWidth: CGFloat(lineWidth), minimumAngle: 0.0 ,maximumAngle: CGFloat(angleFromNorth) , colors: unfilledGradientColors, lineCap: unfilledArcLineCap)
        }
        //For unfilled area
        let colors: [UIColor] = [.systemGray6, .systemGray6]
        CircularTrig.drawUnfilledGradientArcInContext(ctx, center: centerPoint, radius: computedRadius, lineWidth: CGFloat(lineWidth), minimumAngle: CGFloat(angleFromNorth), maximumAngle: maximumAngle , colors: colors, lineCap: unfilledArcLineCap)
    }
}
