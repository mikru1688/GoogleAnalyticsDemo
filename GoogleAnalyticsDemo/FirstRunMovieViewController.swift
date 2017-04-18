//
//  FirstRunViewController.swift
//  GoogleAnalyticsDemo
//
//  Created by Frank.Chen on 2017/4/18.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit

class FirstRunMovieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "首輪電影"
        
        // 返回首頁，用來追蹤使用者事件
        let homeIcon: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "home"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(FirstRunMovieViewController.goHome))
        self.navigationItem.rightBarButtonItem = homeIcon
        
        print("首輪電影...")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {        
        let name = "First Run Movie Page"
        
        let tracker = GAI.sharedInstance().tracker(withTrackingId: "Your Tracking Id")
        tracker?.set(kGAIScreenName, value: name)
        
        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
        tracker?.send(builder.build() as [NSObject : AnyObject])
    }
    
    // 返回首頁
    func goHome() {                
        // [START custom_event_swift]
        let tracker = GAI.sharedInstance().tracker(withTrackingId: "Your Tracking Id")
        guard let event = GAIDictionaryBuilder.createEvent(withCategory: "Action", action: "GoHome", label: nil, value: nil) else { return }
        tracker?.send(event.build() as [NSObject : AnyObject])
        // [END custom_event_swift]
        
        _ = self.navigationController?.popToRootViewController(animated: true)
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
