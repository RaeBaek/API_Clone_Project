//
//  EatDealViewController.swift
//  API_Clone_Project
//
//  Created by 백래훈 on 2022/03/08.
//

import UIKit

class EatDealViewController: UIViewController {

    @IBOutlet weak var oneImageView: UIImageView!
    @IBOutlet weak var twoImageView: UIImageView!
    @IBOutlet weak var threeImageView: UIImageView!
    @IBOutlet weak var fourImageView: UIImageView!
    
    @IBOutlet weak var oneTitle: UILabel!
    @IBOutlet weak var twoTitle: UILabel!
    @IBOutlet weak var threeTitle: UILabel!
    @IBOutlet weak var fourTitle: UILabel!
    
    @IBOutlet weak var oneText: UILabel!
    @IBOutlet weak var twoText: UILabel!
    @IBOutlet weak var threeText: UILabel!
    @IBOutlet weak var fourText: UILabel!
    
    @IBOutlet weak var oneThema: UILabel!
    @IBOutlet weak var twoThema: UILabel!
    @IBOutlet weak var threeThema: UILabel!
    @IBOutlet weak var fourThema: UILabel!
    
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton.layer.cornerRadius = 10
        myButton.layer.borderWidth = 1
        myButton.layer.borderColor = UIColor.orange.cgColor
        
        // TastePlaceRequest에서 정의한 getTastePlaceData()를 호출
        TastePlaceRequest().getTastePlaceData2(self)
    }
}

//MARK: - 공공 데이터포탈 용산구 맛집 API
extension EatDealViewController {
    
    // TastePlaceRequest에 호출되는 함수
    func didSuccess(_ response: TastePlaceResponse) {
        
        // EatDealView에서 업소명을 바로 보여주기 위해 라벨.text에 입력
        oneTitle.text = response.data[0].업소명
        twoTitle.text = response.data[1].업소명
        threeTitle.text = response.data[2].업소명
        fourTitle.text = response.data[3].업소명
        
//        oneImageView.text = response.data[0].업소명
//        twoImageView.text = response.data[1].업소명
//        threeImageView.text = response.data[2].업소명
//        fourImageView.text = response.data[3].업소명
        
        oneText.text = response.data[0].사장님이자랑하는내가게한마디
        twoText.text = response.data[1].사장님이자랑하는내가게한마디
        threeText.text = response.data[2].사장님이자랑하는내가게한마디
        fourText.text = response.data[3].사장님이자랑하는내가게한마디
        
        oneThema.text = response.data[0].thema
        twoThema.text = response.data[1].thema
        threeThema.text = response.data[2].thema
        fourThema.text = response.data[3].thema
    }
}
