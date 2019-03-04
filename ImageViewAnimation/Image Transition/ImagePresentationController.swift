//
//  results+ImagePresentationController.swift
//  LookUp
//
//  Created by Vidit Bhargava on 27/08/18.
//  Copyright © 2018 The Tangible Apps. All rights reserved.
//

import UIKit

final class ImagePresentationController: UIPresentationController {
    
    var frameSize: CGSize!
    
    override var frameOfPresentedViewInContainerView: CGRect {
       return presentedViewController.view.bounds
    }
    
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
    }
    
}
