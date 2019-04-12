//
//  RactViewManager.swift
//  RCTIntegration
//
//  Created by Anand Ratna on 05/04/19.
//  Copyright © 2019 Anand Ratna. All rights reserved.
//

import Foundation
@objc(RactViewManager)
class RactViewManager: NSObject {
    var secondView = false
    @objc
    static func requiresMainQueueSetup() -> Bool {
        return true
    }
    @objc
    func goNext() {
        //self.navigationController?.pushViewController(nvc!, animated: true)
        print("Posting Notification")
        NotificationCenter.default.post(name: NSNotification.Name("ViewControllerCust"),
                                        object: nil)
        print("Every thing working fine")
    }
}
