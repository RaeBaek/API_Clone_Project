//
//  DetailViewController.swift
//  API_Clone_Project
//
//  Created by 백래훈 on 2022/03/09.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var oneText: UILabel!
    @IBOutlet weak var placeTitle: UILabel!
    @IBOutlet weak var Addr1: UILabel!
    @IBOutlet weak var Addr2: UILabel!
    @IBOutlet weak var Thema: UILabel!
    @IBOutlet weak var PhoneNumber: UILabel!
    @IBOutlet weak var CallButton: UIButton!
    
    @IBOutlet weak var detailOneImage: UIImageView!
    @IBOutlet weak var detailTwoImage: UIImageView!
    
    var onetext: String = ""
    var placetitle: String = ""
    var thema: String = ""
    var phonenumber: String = ""
    var addr1: String = ""
    var addr2: String = ""
    
    var detailoneImage = URL(string: "www.naver.com")
    var detailtwoImage = URL(string: "www.naver.com")
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        CallButton.layer.borderWidth = 1
        CallButton.layer.borderColor = UIColor.darkGray.cgColor
        
        oneText.text = onetext
        placeTitle.text = placetitle
        Thema.text = thema
        PhoneNumber.text = phonenumber
        Addr1.text = addr1
        Addr2.text = addr2
        detailOneImage.load(url: detailoneImage!)
        detailTwoImage.load(url: detailtwoImage!)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonDidTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
