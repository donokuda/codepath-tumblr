//
//  ComposeViewController.swift
//  tumblr
//
//  Created by Don Okuda on 3/6/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!

    var buttons: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        buttons = [textButton, quoteButton, photoButton, linkButton, videoButton, chatButton]

        for button in buttons {
            button.frame.origin.y += view.frame.height
        }
    }

    override func viewDidAppear(animated: Bool) {
        var delay = 0.0

        for button in buttons {
            UIView.animateWithDuration(1.0, delay: delay, usingSpringWithDamping: 0.75, initialSpringVelocity: 1, options: nil, animations: {
                button.frame.origin.y -= self.view.frame.height
            }, completion: nil)

            delay += 0.04
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didTapDismiss(sender: AnyObject) {
        var delay = 0.0

        for button in buttons {
            UIView.animateWithDuration(1.0, delay: delay, usingSpringWithDamping: 0.75, initialSpringVelocity: 1, options: nil, animations: {
                button.frame.origin.y -= self.view.frame.height

                if button == self.buttons.last {
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            }, completion: nil)

            delay += 0.04
        }
    }
}