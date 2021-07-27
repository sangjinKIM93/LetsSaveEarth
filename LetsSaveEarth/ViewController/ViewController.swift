//
//  ViewController.swift
//  LetsSaveEarth
//
//  Created by 김상진 on 2021/07/25.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationManager.shared.requestAuthorization { _ in
            print("권한 요청")
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let viewController = AlarmSettingViewController()
        self.present(viewController, animated: true, completion: nil)
        
    }
    

}

