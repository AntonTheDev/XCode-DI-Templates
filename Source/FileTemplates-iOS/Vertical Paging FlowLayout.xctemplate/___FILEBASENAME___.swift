//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation
import UIKit

struct ___FILEBASENAME___FlowLayoutConfig {

    // The width offset threshold percentage from 0 - 1
    static let thresholdOffsetPrecentage : CGFloat = 0.3

    // This is the flick velocity threshold
    static let velocityThreshold : CGFloat = 0.37

    // This is the flick velocity threshold
    static let delayedVelocityThreshold : CGFloat = 1.4
}

public class ___FILEBASENAME___PagingFlowLayout : UICollectionViewFlowLayout
{
    var indexArray = [IndexPath]()
    var visibleIndex : Int = 0
    var boundsSize : CGSize = CGSize.zero

    override init()
    {
        super.init()
        minimumInteritemSpacing = 0.0
        minimumLineSpacing = 0.0
        scrollDirection = .vertical
    }

    required public init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }

    override public func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool
    {
        configuredIndexMapIfNeeded()
        return false
    }

    fileprivate func configuredIndexMapIfNeeded()
    {
        if indexArray.count == 0
        {
            boundsSize = collectionView!.bounds.size

            if  let numberOfSections = self.collectionView?.numberOfSections
            {
                for section in 0..<numberOfSections
                {
                    guard let numberOfRowsInSection = collectionView?.numberOfItems(inSection: section) else {
                        continue
                      }

                      for row in 0..<numberOfRowsInSection {
                        indexArray.append(IndexPath(row: row, section: section))
                      }
                }
            }
        }
    }

    override public func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
                                             withScrollingVelocity velocity: CGPoint) -> CGPoint
    {
        let centeredOffset  = boundsSize.height * CGFloat(visibleIndex)
        let topThreshold    = centeredOffset - (boundsSize.height * ___FILEBASENAME___FlowLayoutConfig.thresholdOffsetPrecentage)
        let bottomThreshold = centeredOffset + (boundsSize.height * ___FILEBASENAME___FlowLayoutConfig.thresholdOffsetPrecentage)

        if collectionView!.contentOffset.y < topThreshold ||  velocity.y < -___FILEBASENAME___FlowLayoutConfig.velocityThreshold
        {
            visibleIndex = max(0 , (visibleIndex - 1))
        }
        else if collectionView!.contentOffset.y > bottomThreshold || velocity.y > ___FILEBASENAME___FlowLayoutConfig.velocityThreshold
        {
            visibleIndex += 1
            visibleIndex = min(indexArray.count - 1, visibleIndex)
        }

        var yOffset = boundsSize.height * CGFloat(visibleIndex)

        if visibleIndex == indexArray.count - 1
        {
            yOffset -= 1.0
        }
        else if visibleIndex == 0
        {
            yOffset = 1.0
        }

        var _proposedContentOffset = proposedContentOffset
        _proposedContentOffset.y = yOffset

        return _proposedContentOffset
    }
}
