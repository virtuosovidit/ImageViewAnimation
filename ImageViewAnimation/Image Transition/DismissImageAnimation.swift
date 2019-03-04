//
//  DismissImageAnimation.swift
//  LookUp
//
//  Created by Vidit Bhargava on 27/08/18.
//  Copyright © 2018 The Tangible Apps. All rights reserved.
//

import UIKit

class DismissImageAnimation : NSObject, UIViewControllerAnimatedTransitioning {

    var originalFrame: CGRect!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return UIAccessibility.isReduceMotionEnabled ? 0.5 : 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from)! as? ImageViewController else { return }
        guard let toViewController =  transitionContext.viewController(forKey: .to)! as? ViewController else { return }
        
        fromViewController.imageView.clipsToBounds = true
        fromViewController.imageView.contentMode = .scaleAspectFill
        
        
        var springDampeningFactor: CGFloat = 0.6
        var initialSpringVelocity: CGFloat = 0.3
        
        if UIAccessibility.isReduceMotionEnabled {
            springDampeningFactor = 1
            initialSpringVelocity = 0
        }
        
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0,
                       usingSpringWithDamping: springDampeningFactor,
                       initialSpringVelocity: initialSpringVelocity,
                       options: .curveEaseInOut,
                       animations: {
                        
                        fromViewController.imageView.frame = toViewController.imageView.frame
            
        }) { finished in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
