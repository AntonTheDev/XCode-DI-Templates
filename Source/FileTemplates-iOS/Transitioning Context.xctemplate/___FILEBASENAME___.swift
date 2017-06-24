//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//
"Transitioning Context.xctemplate"
import Foundation
import UIKit

public class ___FILEBASENAME___: : NSObject, UIViewControllerContextTransitioning {

    private var animatingControllers = [UITransitionContextViewControllerKey : UIViewController]()
    private var appearingToRect : CGRect?
    private var disappearingToRect : CGRect?
    private var disappearingFromRect : CGRect?
    private var appearingFromRect : CGRect?
    private var completionBlock : ((_ complete : Bool) -> Void)?

    public var containerView: UIView
    public var presentationStyle : UIModalPresentationStyle = .custom

    public var isAnimated: Bool = false
    public var isInteractive: Bool = false
    public var transitionWasCancelled: Bool  = false

    public var targetTransform: CGAffineTransform {
        get {  return CGAffineTransform.identity }
    }

    required public init(withFromViewController fromVC : UIViewController,
                         toViewController toVC : UIViewController,
                         rightDirection : Bool) {

        containerView = fromVC.view.superview!

        animatingControllers = [
            UITransitionContextViewControllerKey.from:fromVC,
            UITransitionContextViewControllerKey.to:toVC,
        ]

        let travelDistance = (rightDirection ? -self.containerView.bounds.size.width : self.containerView.bounds.size.width);

        disappearingFromRect = containerView.bounds
        appearingToRect = containerView.bounds
        disappearingToRect = containerView.bounds.offsetBy (dx: travelDistance, dy: 0);
        disappearingFromRect = containerView.bounds.offsetBy (dx: -travelDistance, dy: 0);

        super.init()
    }

    public func setCompletion(completion : @escaping (_ complete : Bool) -> Void ) {
        completionBlock = completion
    }

    public func completeTransition(_ didComplete: Bool) {
        completionBlock?(didComplete)
    }

    public func viewController(forKey key: UITransitionContextViewControllerKey) -> UIViewController? {
        return animatingControllers[key]
    }

    public func initialFrame(for vc: UIViewController) -> CGRect {
        if vc == viewController(forKey: UITransitionContextViewControllerKey.from)! {
            return disappearingFromRect!
        } else {
            return appearingFromRect!
        }
    }

    public func finalFrame(for vc: UIViewController) -> CGRect {
        if vc == viewController(forKey: UITransitionContextViewControllerKey.from)! {
            return disappearingToRect!
        } else {
            return appearingToRect!
        }
    }

    public func view(forKey key: UITransitionContextViewKey) -> UIView? { return nil }
    public func updateInteractiveTransition(_ percentComplete: CGFloat) { }
    public func finishInteractiveTransition() { }
    public func cancelInteractiveTransition() { }
    public func pauseInteractiveTransition() {  }
}
