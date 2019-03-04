//
//  ImageViewController.swift
//  ImageViewAnimation
//
//  Created by Vidit Bhargava on 04/03/19.
//  Copyright © 2019 Vidit Bhargava. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    var aspectRatio: CGFloat!
    
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let image = image {
            imageView.image = image
            imageHeight.constant = self.view.frame.width/aspectRatio
        }
        
    }
    
    var interactionController: DismissInteractionController?
    var imageTransitioning: ImageTransitioningDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        
        interactionController = DismissInteractionController.init(viewController: self)
        
    }

}
