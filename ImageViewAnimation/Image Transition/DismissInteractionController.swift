//
//  DismissInteractionController.swift
//  LookUp
//
//  Created by Vidit Bhargava on 27/08/18.
//  Copyright © 2018 The Tangible Apps. All rights reserved.
//

import UIKit

class DismissInteractionController: UIPercentDrivenInteractiveTransition {
    
    var animator : UIDynamicAnimator!
    
    var attachmentBehavior : UIAttachmentBehavior!
    
    private var shouldCompleteTransition = false
    private weak var viewController: ImageViewController!
    
    init(viewController: ImageViewController) {
        super.init()
        self.viewController = viewController
        animator = UIDynamicAnimator(referenceView: viewController.view)
        prepareGestureRecognizer(in: viewController.view)
    }
    
    private func prepareGestureRecognizer(in view: UIView) {
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        view.addGestureRecognizer(gesture)
    }
    
    @objc func handleGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        let translation = sender.translation(in: sender.view!.superview!)
        var progress = (translation.y / 200)
        progress = CGFloat(fminf(fmaxf(Float(progress), 0.0), 1.0))
        
        switch sender.state {
            
        case .began:
            animator.removeAllBehaviors()
            
        case .changed:
            viewController.imageView.transform = CGAffineTransform.init(translationX: 0, y: sender.translation(in: viewController.view).y)
            
        case .cancelled:
            viewController.view.alpha = 1
            
        case .ended:
            animator.removeAllBehaviors()
            viewController.dismiss(animated: true, completion: nil)
            
        case .failed:
            viewController.view.alpha = 1
            
        case .possible:
            break
            
        }
        
        
    }

}
