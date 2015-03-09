//
//  SearchViewController.swift
//  tumblr
//
//  Created by Don Okuda on 3/6/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var loadingImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.tumblrBgColor()

        let loadingImage1 = UIImage(named: "loading-1")!
        let loadingImage2 = UIImage(named: "loading-2")!
        let loadingImage3 = UIImage(named: "loading-3")!

        loadingImageView.animationImages = [loadingImage1, loadingImage2, loadingImage3]
        loadingImageView.animationDuration = 1.0
        loadingImageView.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
