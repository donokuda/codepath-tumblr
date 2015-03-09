//
//  TabBarViewController.swift
//  tumblr
//
//  Created by Don Okuda on 3/6/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

extension UIColor {
    class func tumblrBgColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: CGFloat(37.0/255.0), green: CGFloat(50.0/255.0), blue: CGFloat(73.0/255.0), alpha: alpha)
    }
}

class TabBarViewController: UIViewController,
    UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var explorePopup: UIImageView!

    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!

    var viewControllers: [UIViewController] = [UIViewController]()
    var activeViewController: UIViewController? {
        didSet {
            if let oldViewController = oldValue {
                removeViewController(oldViewController)
            }

            if let newViewController = activeViewController {
                addViewController(newViewController)
            }
        }
    }

    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    @IBOutlet weak var customTabBar: UIView!

    var isPresenting: Bool = true

    lazy var buttons: [UIButton] = {
        var tempButton: [UIButton] = []
        for view: AnyObject in self.customTabBar.subviews {
            if view is UIButton {
                tempButton.append(view as UIButton)
            }
        }

        return tempButton
    }()

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        var storyboard = UIStoryboard(name: "Main", bundle: nil)

        homeViewController = storyboard.instantiateViewControllerWithIdentifier("homeStory") as UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("composeStory") as UIViewController
        composeViewController.transitioningDelegate = self
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("accountStory") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("trendingStory") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("searchStory") as UIViewController

        viewControllers = [homeViewController, searchViewController, composeViewController, accountViewController, trendingViewController]

        homeButton.selected = true
        activeViewController = homeViewController

        UIView.animateWithDuration(1, delay: 0, options: (UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse), animations: { () -> Void in
            self.explorePopup.frame.origin.y -= 10
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didTapNavigationButton(sender: UIButton) {
        deselectAllButtons()
        sender.selected = true
        activeViewController = viewControllers[sender.tag]

        if activeViewController == searchViewController {
            explorePopup.hidden = true
        } else {
            explorePopup.hidden = false
        }
    }

    func removeViewController(viewController: UIViewController) {
        // tell the child it will be removed (moved to no parent)
        viewController.willMoveToParentViewController(nil)

        // have the childivew remove itself from its parent
        viewController.view.removeFromSuperview()

        // now remove the child view controller from its parent
        viewController.removeFromParentViewController()
    }

    func addViewController(targetViewController: UIViewController) {
        self.addChildViewController(targetViewController)
        contentView.addSubview(targetViewController.view)
        targetViewController.didMoveToParentViewController(self)
    }

    func deselectAllButtons() {
        for button in buttons {
            button.selected = false
        }
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!

        if (isPresenting) {
            println("Is presenting block")
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    self.isPresenting = false
            }
        } else {
            println("fading u")
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
                    self.isPresenting = true
            }
        }
    }

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.transitioningDelegate = self
    }
}