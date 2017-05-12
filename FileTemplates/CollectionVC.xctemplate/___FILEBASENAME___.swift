//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation
import UIKit

/*
    Add the following in the registerViewControllers() method of the
    Services class.

        viewControllerContainer.register(___FILEBASENAME___.self) { _ in ___FILEBASENAME___(container: self.viewControllerContainer) }
            .initCompleted { (r, controller) in
                // Rersolve Services as needed
        }
*/

struct ___FILEBASENAME___Config {
    
    static let cellSize                                 = CGSize(width: UIScreen.main.bounds.width, height: 167)
    static let minimumLineSpacing                       = CGFloat(15.0)
    static let sectionInsets                            = UIEdgeInsets.zero
    
    static let collectionViewBackgroundColor            = UIColor.white
    static let collectionViewShowVerticalIndicator      = false
    static let collectionViewShowHorizontalIndicator    = false
    static let collectionViewClipsToBounds              = false
    static let collectionViewAlwaysBounceVertical       = true
}


class ___FILEBASENAME___ : BaseViewController {
    
    override func configuredData() {
        
    }
    
    override func setupInterface() {
        view.addSubview(collectionView)
        registerCells()
    }
    
    override func styleInterface() {
        view.backgroundColor = UIColor.clear
    }
    
    override func layoutInterface() {
        collectionView.alignWithSize(CGSize(width:view.bounds.width, height: view.bounds.height),
                                     toFrame: view.bounds,
                                     horizontal: .center,
                                     vertical: .top)
    }
    
    // Lazy Loaded Views
    
    lazy var collectionView : UICollectionView = {
        [unowned self] in
        
        var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout : UICollectionViewFlowLayout())
        collectionView.clipsToBounds = ___FILEBASENAME___Config.collectionViewClipsToBounds
        collectionView.showsVerticalScrollIndicator = ___FILEBASENAME___Config.collectionViewShowVerticalIndicator
        collectionView.showsHorizontalScrollIndicator = ___FILEBASENAME___Config.collectionViewShowHorizontalIndicator
        collectionView.backgroundColor = ___FILEBASENAME___Config.collectionViewBackgroundColor
        collectionView.alwaysBounceVertical = ___FILEBASENAME___Config.collectionViewAlwaysBounceVertical
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
        }()
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension ___FILEBASENAME___ : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func registerCells() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return ___FILEBASENAME___Config.cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return ___FILEBASENAME___Config.sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return ___FILEBASENAME___Config.minimumLineSpacing
    }
}
