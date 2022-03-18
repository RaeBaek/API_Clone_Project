//
//  TabbarViewController.swift
//  API_Clone_Project
//
//  Created by 백래훈 on 2022/03/09.
//

import UIKit
import Pageboy

protocol TabbarViewControllerDelegate {
    func passText(_ name: String, _ email: String, _ age: String, _ id: String)
}


class TabbarViewController: UITabBarController {

    var Name: String = ""
    var Email: String = ""
    var Age: String = ""
    var Id: String = ""
    
//    var infoViewController: InfoViewController?
    
//    var delegate: TabbarViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        infoViewController?.tabbarViewController = self
        
//        self.view
        print("탭바 실행됨!")
        
//        infoViewController?.name = Name
//        infoViewController?.email = Email
//        infoViewController?.age = Age
//        infoViewController?.id = Id
        
//        self.delegate?.passText(Name, Email, Age, Id)
        
    }
}
