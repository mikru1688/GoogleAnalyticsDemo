//
//  ViewController.swift
//  GoogleAnalyticsDemo
//
//  Created by Frank.Chen on 2017/4/18.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var imageDtaas = ["firstRunMovie", "secondRunMovie"]
    var firstRunMovieViewController: FirstRunMovieViewController!
    var secondRunMovieViewController: SecondRunMovieViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        self.navigationItem.title = "電影時光"
        
        let space: CGFloat = 20
        let imageW: CGFloat = (self.view.frame.size.width - space * 3) / 2
        
        for i in 0 ..< self.imageDtaas.count {
            let imageView: UIImageView = UIImageView()
            imageView.image = UIImage(named: self.imageDtaas[i])
            imageView.frame = CGRect(x: space + (imageW + space) * CGFloat(i % 2), y: space + CGFloat(i / 2), width: imageW, height: imageW)
            self.view.addSubview(imageView)
            
            let tapImageEvent: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: i == 0 ? #selector(MainViewController.goFirstRunMovie) : #selector(MainViewController.goSecondRunMovie))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapImageEvent)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let name = "Mian Page"
        
//        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
//        tracker.set(kGAIScreenName, value: name)
        
        let tracker = GAI.sharedInstance().tracker(withTrackingId: "Your Tracking Id")
        tracker?.set(kGAIScreenName, value: name)
        
        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
        tracker?.send(builder.build() as [NSObject : AnyObject])
    }
    
    func goFirstRunMovie() {
        self.firstRunMovieViewController = FirstRunMovieViewController()
        self.navigationController?.pushViewController(self.firstRunMovieViewController!, animated: true)
    }
    
    func goSecondRunMovie() {
        self.secondRunMovieViewController = SecondRunMovieViewController()
        self.navigationController?.pushViewController(self.secondRunMovieViewController!, animated: true)
    }
    
}

