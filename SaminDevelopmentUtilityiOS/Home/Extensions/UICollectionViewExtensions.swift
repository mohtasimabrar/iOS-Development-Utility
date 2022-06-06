//
//  UICollectionViewExtensions.swift
//  SaminDevelopmentUtilityiOS
//
//  Created by Mohtasim Abrar Samin on 31/5/22.
//

import Foundation
import UIKit

extension UICollectionView {
    var fullyVisibleCouponCells : [UICollectionViewCell] {
        return self.visibleCells.filter { cell in
            let cellRect = self.convert(cell.frame, to: self.superview)
            let intersection = CGRect(origin: CGPoint(x: abs(cellRect.origin.x), y: cellRect.origin.y), size: CGSize(width: cellRect.width, height: cellRect.height))
            return self.frame.contains(intersection) }
    }
}
