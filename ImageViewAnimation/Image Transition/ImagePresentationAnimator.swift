//
//  ImagePresentationAnimator.swift
//  LookUp
//
//  Created by Vidit Bhargava on 01/11/18.
//  Copyright © 2018 The Tangible Apps. All rights reserved.
//

import Foundation
import UIKit

class ImagePresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.75
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromViewController = transitionContext.viewController(forKey: .from) as? ViewController else { return }
        guard let toViewController = transitionContext.viewController(forKey: .to) as? ImageViewController else { return }
        
        let containerView = transitionContext.containerView
        
        toViewController.imageView.clipsToBounds = true
        toViewController.imageView.contentMode = .scaleAspectFill
        toViewController.imageView.frame = fromViewController.imageView.frame
        
        
        containerView.addSubview(toViewController.view)
        
        
        var springDampeningFactor: CGFloat = 0.6
        var initialSpringVelocity: CGFloat = 0.3
        
        if UIAccessibility.isReduceMotionEnabled {
            springDampeningFactor = 1
            initialSpringVelocity = 0
        }
        
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0,
                       usingSpringWithDamping: springDampeningFactor,
                       initialSpringVelocity: initialSpringVelocity,
                       options: .curveEaseInOut,
                       animations: {
            
                        //Setting up the size of the imageView Frame
                        let width = toViewController.view.frame.width
                        let height = width/toViewController.aspectRatio
                        
                        //Centered Vertically
                        let yPosition = (toViewController.view.frame.height - height)/2
                        
                        toViewController.imageView.frame = CGRect(x: 0, y: yPosition,
                                                                  width: width, height: width/toViewController.aspectRatio)
                        
        }, completion: { finished in
            transitionContext.completeTransition(finished)
        })
        
    }
}
