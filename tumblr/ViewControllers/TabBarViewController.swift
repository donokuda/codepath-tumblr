//
//  TabBarViewController.swift
//  tumblr
//
//  Created by Don Okuda on 3/6/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!

    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!

    var viewControllers: [UIViewController] = [UIViewController]()

    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    @IBOutlet weak var customTabBar: UIView!

    lazy var buttons: [UIButton] = {
        var tempButton: [UIButton] = []
        for view: AnyObject in self.customTabBar.subviews {
            if view is UIButton {
                tempButton.append(view as UIButton)
            }
        }

        return tempButton
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        var storyboard = UIStoryboard(name: "Main", bundle: nil)

        homeViewController = storyboard.instantiateViewControllerWithIdentifier("homeStory") as UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("composeStory") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("accountStory") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("trendingStory") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("searchStory") as UIViewController

        viewControllers = [homeViewController, searchViewController, composeViewController, accountViewController, trendingViewController]

        contentView.addSubview(searchViewController.view)
        searchViewController.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didTapNavigationButton(sender: UIButton) {
        deselectAllButtons()
        sender.selected = true

        var viewController = viewControllers[sender.tag]
        addViewController(viewController)
    }

    func addViewController(targetViewController: UIViewController) {
        println(targetViewController)
        contentView.addSubview(targetViewController.view)
        targetViewController.didMoveToParentViewController(self)
    }

    func deselectAllButtons() {
        for button in buttons {
            button.selected = false
        }
    }
}