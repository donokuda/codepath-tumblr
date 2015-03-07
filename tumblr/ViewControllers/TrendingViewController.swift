//
//  TrendingViewController.swift
//  tumblr
//
//  Created by Don Okuda on 3/6/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet weak var trendingScrollView: UIScrollView!
    @IBOutlet weak var trendingImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        trendingScrollView.contentSize = trendingImageView.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}