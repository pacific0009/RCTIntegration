//
//  ViewController.swift
//  RCTIntegration
//
//  Created by Anand Ratna on 05/04/19.
//  Copyright © 2019 Anand Ratna. All rights reserved.
//

import UIKit
import React
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       NotificationCenter.default.addObserver(self,
                                               selector: #selector(openNextView),
                                               name: NSNotification.Name("ViewControllerCust"),
                                               object: nil)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func openReactView(_ sender: UIButton) {
        NSLog("Hello")
        let jsCodeLocation = Bundle.main.url(forResource: "index.ios", withExtension: "bundle")
        //let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
        let mockData:NSDictionary = ["scores":
            [
                ["name":"Alex", "value":"42"],
                ["name":"Joel", "value":"10"]
            ]
        ]
        
        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: "RNHighScores",
            initialProperties: mockData as [NSObject : AnyObject],
            launchOptions: nil
        )
        let vc = UIViewController()
        vc.view = rootView
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc
    func openNextView() {
        let nvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SecondView") as? SecondViewController
        DispatchQueue.main.async {
            // Update UI
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            self.navigationController?.pushViewController(nvc!, animated: true)
        }
        
        print("Notification Received")
        //self.navigationController?.pushViewController(nvc!, animated: true)
        //self.present(nvc!, animated: true, completion: nil)
    }
    
}

