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
                // controller.setActiveViewController = ....
        }
*/

@objc protocol ___FILEBASENAME___Delegate : class {
    @objc func containerViewController(_ containerViewController : ___FILEBASENAME___,
                                 didSelectViewController : UIViewController)

    @objc optional func containerViewController(_ containerViewController: ___FILEBASENAME___,
                                          animationControllerForTransitionFrom fromVC: UIViewController,
                                          to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
}

class ___FILEBASENAME___ : BaseViewController {

    weak var delegate : ___FILEBASENAME___Delegate?

    fileprivate var activeViewController: BaseViewController? {
        didSet {
            activeViewController?.view.frame = view.bounds
            self.animate(fromVC: oldValue, toVC: activeViewController!)
        }
    }

    func setActiveViewController(viewController : BaseViewController) {
        activeViewController = viewController
    }

    func animate(fromVC : BaseViewController?, toVC : BaseViewController) {

        if fromVC != toVC {
            fromVC?.willMove(toParentViewController: nil)
            addChildViewController(activeViewController!)
        }

        if fromVC == nil {
            view.addSubview(activeViewController!.view)
            activeViewController?.didMove(toParentViewController: self)
            return
        }

        guard let fromVC = fromVC else {
            return
        }

        guard let animator = delegate?.containerViewController!(self, animationControllerForTransitionFrom: fromVC, to: toVC) else {
            view.addSubview(activeViewController!.view)
            activeViewController?.didMove(toParentViewController: self)
            return
        }

        let transitioningContext = ContainerTransitioningContext(withFromViewController: fromVC,
                                                                 toViewController: activeViewController!,
                                                                 rightDirection: true)
        transitioningContext.isAnimated = true
        transitioningContext.isInteractive = false
        transitioningContext.setCompletion {[unowned self] (complete) in
            fromVC.view.removeFromSuperview()
            fromVC.removeFromParentViewController()
            self.activeViewController?.didMove(toParentViewController: self)
            self.delegate = self.activeViewController as? ___FILEBASENAME___Delegate
        }

        animator.animateTransition(using: transitioningContext)
    }
}
