# Image View Animation  
This is a small demonstration of a simple Image Transition. The user Taps an Image and it expands to a full screen view, the user can then drag it to go back to the collapsed version of the image. 

## Setup
In storyboards, I've setup a View Controller with the image in the center and another view controller where the image takes the entire width of the display. They're linked by a segue.

![segueSetup][segueSetup]

## Preparing for Segue
We setup the destination view controller by providing information on two things. First, the image to be displayed, and then aspect ratio of the image. We setup a custom transitioning delegate to present the view controller.

        imageVC.image = image
        imageVC.aspectRatio = image.size.width/image.size.height
        imageVC.transitioningDelegate = imageTransitioning

## Image Transitioning Delegate
The image Transitioning Delegate file contains three functions, the first is a custom presentation controller which specifies the frame of the Destination View Controller. Second an `UIViewControllerAnimatedTransitioning` class for Presentation and finally a `UIViewControllerAnimatedTransitioning` class for Dismissal.

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

## Presentation Animation
In the presentation animation we first setup up the imageView properties in the destination view controller to match that of the imageView in the source view controller. And then set the frame of the destination imageView to that of the source's imageView. We then animate the frame to its final position.

        toViewController.imageView.clipsToBounds = true
        toViewController.imageView.contentMode = .scaleAspectFill
        toViewController.imageView.frame = fromViewController.imageView.frame

## Setting up the Image View Controller
In the image view controller, we setup an interaction controller (a `UIPercentDrivenInteractiveTransition` class) to add a Pan Gesture recognizer to the view controller. The Gesture Recogniser triggers the dismiss animation.

        interactionController = DismissInteractionController.init(viewController: self)
        
## Dismiss Animation
The dismiss animation is similar to presentation animation, except here we only need to setup an animation to animate the frame of the image in Image View Controller to be the same size as the frame of the source view controller's ImageView.

        fromViewController.imageView.frame = toViewController.imageView.frame
       
[segueSetup]: http://thetangible.in/segueSetup.png
