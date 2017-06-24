//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation

struct ___FILEBASENAME___Config {
    static let toContext           = UITransitionContextViewControllerKey.to
    static let fromContext         = UITransitionContextViewControllerKey.from
    static let animationTiming     = 0.32
}

class ___FILEBASENAME___ : NSObject, UIViewControllerAnimatedTransitioning {

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        guard let fromView = transitionContext.viewController(forKey: ___FILEBASENAME___Config.fromContext)?.view,
              let toView = transitionContext.viewController(forKey: ___FILEBASENAME___Config.toContext)?.view  else {

            transitionContext.completeTransition(true)
            return
        }

        toView.alpha = 0.0

        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
        containerView.addSubview(fromView)

        UIView.animate(withDuration: ___FILEBASENAME___Config.animationTiming,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseOut,
                       animations: { () -> Void in

                        fromView.alpha = 0.0
                        toView.alpha = 1.0

        }, completion: { (complete) in

            fromView.alpha = 0.0
            toView.alpha = 1.0
            fromView.removeFromSuperview()
            transitionContext.completeTransition(true)

        })
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return ___FILEBASENAME___Config.animationTiming
    }
}
