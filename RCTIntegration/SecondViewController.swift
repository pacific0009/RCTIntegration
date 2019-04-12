//
//  SecondViewController.swift
//  RCTIntegration
//
//  Created by Anand Ratna on 05/04/19.
//  Copyright © 2019 Anand Ratna. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dismissView(_ sender: UIButton) {
        print("Dismissing View")
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    


}
