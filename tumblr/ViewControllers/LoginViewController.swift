//
//  LoginViewController.swift
//  tumblr
//
//  Created by Don Okuda on 3/8/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.tumblrBgColor(alpha: 0.8)
        emailField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didTapCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
