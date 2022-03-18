//
//  InfoViewController.swift
//  API_Clone_Project
//
//  Created by 백래훈 on 2022/03/08.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    let dummyData: [String] = ["이벤트"]
    let dummyData2: [String] = ["구매한 EAT딜", "EAT딜 입고알림"]
    let dummyData3: [String] = ["타임라인", "가고싶다", "마이리스트", "북마크", "내가 등록한 식당"]
    let dummyData4: [String] = ["설정"]
    
    let imageDummy: [String] = ["내비게이션"]
    let imageDummy2: [String] = ["내비게이션", "내비게이션"]
    let imageDummy3: [String] = ["내비게이션", "내비게이션", "내비게이션", "내비게이션", "내비게이션"]
    let imageDummy4: [String] = ["내비게이션"]
    
//    var name: String = ""
//    var email: String = ""
//    var age: String = ""
//    var id: String = ""
    
    var tabbarViewController: TabbarViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tabbarViewController?.delegate = self
        print("내정보실행!")

        // ViewController에서 선언한 userInfo 싱글톤을 사용하기 위해 cureentInfo 선언
        let currentInfo = userInfo.shared
        
        // 정보가 잘 들었는지 출력 한번 해주고~
        print(currentInfo.name ?? "")
        print(currentInfo.email ?? "")
        print(currentInfo.age ?? "")
        print(currentInfo.id ?? "")
    
        setUI()
    }
    
    func setUI() {
        myTableView.dataSource = self
        myTableView.delegate = self
        
    }
    
    func moveToVC(SBName: String, SBId: String ,VCName: String){
        let storyboard = UIStoryboard(name: SBName, bundle: nil)
        let VCName = storyboard.instantiateViewController(identifier: SBId)
        VCName.modalPresentationStyle = .fullScreen
        self.present(VCName, animated: true, completion: nil)
        
//        let tabbarVC = (self.storyboard?.instantiateViewController(withIdentifier: "TabbarViewController")) as! TabbarViewController
//        tabbarVC.modalPresentationStyle = .fullScreen
    }
}

//extension InfoViewController: TabbarViewControllerDelegate {
//    func passText(_ name: String, _ email: String, _ age: String, _ id: String) {
//
//        self.nameLabel.text = name
//        self.emailLabel.text = email
//        self.ageLabel.text = age
//        self.idLabel.text = id
//    }
//}


extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    // 섹션별로 내부에 들어갈 Cell의 갯수 설정해주기
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        case 1 :
            return dummyData.count
        case 2 :
            return dummyData2.count
        case 3 :
            return dummyData3.count
        case 4 :
            return dummyData4.count
        default :
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentInfo = userInfo.shared
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myInfoCell", for: indexPath) as? MyInfoCell else {
                return UITableViewCell()
            }
            cell.nameLabel.text = currentInfo.name
            cell.emailLabel.text = currentInfo.email
            cell.ageLabel.text = currentInfo.age
            cell.idLabel.text = currentInfo.id
            cell.imageLabel.image = UIImage(named: "네이버")

            cell.selectionStyle = .none
            
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as? InfoCell else {
                return UITableViewCell()
            }
            // 비슷한 내용이 반복되는 셀들의 내용을 여기서 .text로 설정해 줌
            cell.listNameLabel.text = dummyData[indexPath.row]
            cell.listImage.image = UIImage(named: imageDummy[indexPath.row])
            cell.selectionStyle = .none
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as? InfoCell else {
                return UITableViewCell()
            }
            // 비슷한 내용이 반복되는 셀들의 내용을 여기서 .text로 설정해 줌
            cell.listNameLabel.text = dummyData2[indexPath.row]
            cell.listImage.image = UIImage(named: imageDummy2[indexPath.row])
            
            //셀 사이의 separator 앞 공간을 0으로 지정해주는 코드
            cell.separatorInset = UIEdgeInsets.zero
            cell.selectionStyle = .none
            
            return cell
            
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as? InfoCell else {
                return UITableViewCell()
            }
            // 비슷한 내용이 반복되는 셀들의 내용을 여기서 .text로 설정해 줌
            cell.listNameLabel.text = dummyData3[indexPath.row]
            cell.listImage.image = UIImage(named: imageDummy3[indexPath.row])
            
            //셀 사이의 separator 앞 공간을 0으로 지정해주는 코드
            cell.separatorInset = UIEdgeInsets.zero
            cell.selectionStyle = .none
            
            return cell
            
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as? InfoCell else {
                return UITableViewCell()
            }
            // 비슷한 내용이 반복되는 셀들의 내용을 여기서 .text로 설정해 줌
            cell.listNameLabel.text = dummyData4[indexPath.row]
            cell.listImage.image = UIImage(named: imageDummy4[indexPath.row])
            
            //셀 사이의 separator 앞 공간을 0으로 지정해주는 코드
            cell.separatorInset = UIEdgeInsets.zero
            cell.selectionStyle = .none
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            
            // TODO: 비회원주문 조회는 아직 안함
            if indexPath.row == 0 {
                let moreVC = (self.storyboard?.instantiateViewController(withIdentifier: "MoreViewController")) as! MoreViewController
                moreVC.modalPresentationStyle = .fullScreen
                self.present(moreVC, animated: true, completion: nil)
//
            }
        }
    }
    
    
    // 섹션 별로 Cell의 높이를 결정해줌
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        // 0번째 Cell은 높이를 230
        case 0 :
            return 200
            
        // 나머지는 50으로
        default :
            return 60
        }
    }
    
    // 섹션 사이의 간격(높이)을 주기 위하여 선언해주는 함수
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        // 높이를 결정해준다.
        let cellSpacingHeight: CGFloat = 7
        // 현재는 섹션이 0,1,2 3가지니까 0과 1 footer에 추가해주는 것이다.
        if section == 0 || section == 1 || section == 2 || section == 3 {
            return cellSpacingHeight
        }
        return 0
    }
}
