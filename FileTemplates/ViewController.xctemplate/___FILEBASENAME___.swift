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

class ___FILEBASENAME___ : BaseViewController {
    
    override func configuredData() {
        /* all the layout logic */
    }
    
    override func setupInterface() {
        /* add all the subviews */
    }
    
    override func styleInterface() {
        /* set fonts, color, text */
    }
    
    override func layoutInterface() {
        /* Add all the layout logic */
    }
}
