//
//  Results+ImageTransitioningDelegate.swift
//  LookUp
//
//  Created by Vidit Bhargava on 27/08/18.
//  Copyright © 2018 The Tangible Apps. All rights reserved.
//

import UIKit

class ImageTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let presentation = ImagePresentationController(presentedViewController: presented, presenting: presenting)
        return presentation
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ImagePresentationAnimator()
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissImageAnimation()
    }
}
