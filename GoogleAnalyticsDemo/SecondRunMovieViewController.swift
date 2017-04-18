//
//  SecondRunViewController.swift
//  GoogleAnalyticsDemo
//
//  Created by Frank.Chen on 2017/4/18.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit

class SecondRunMovieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "二輪電影"
        print("二輪電影...")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {        
        let name = "Second Run Movie Page"
        
        let tracker = GAI.sharedInstance().tracker(withTrackingId: "Your Tracking Id")
        tracker?.set(kGAIScreenName, value: name)
        
        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
        tracker?.send(builder.build() as [NSObject : AnyObject])
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
