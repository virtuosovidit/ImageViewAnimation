//
//  ViewController.swift
//  ImageViewAnimation
//
//  Created by Vidit Bhargava on 04/03/19.
//  Copyright © 2019 Vidit Bhargava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    var imageTransitioning: ImageTransitioningDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        imageTransitioning = ImageTransitioningDelegate()
        guard let imageVC = segue.destination as? ImageViewController else { return }
        guard let image = imageView.image else { return }
        
        imageVC.image = image
        imageVC.aspectRatio = image.size.width/image.size.height
        imageVC.transitioningDelegate = imageTransitioning
        
    }
}

