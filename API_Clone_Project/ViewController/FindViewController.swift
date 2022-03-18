//
//  FindViewController.swift
//  API_Clone_Project
//
//  Created by 백래훈 on 2022/03/08.
//

import UIKit
import Alamofire

class FindViewController: UIViewController {
    
    static var shared = FindViewController()
    
    let jsconDecoder: JSONDecoder = JSONDecoder()
    
    // 라벨 모음
    // 10개의 탭에 들어가는 업소명 라벨들
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var title3: UILabel!
    @IBOutlet weak var title4: UILabel!
    @IBOutlet weak var title5: UILabel!
    @IBOutlet weak var title6: UILabel!
    @IBOutlet weak var title7: UILabel!
    @IBOutlet weak var title8: UILabel!
    @IBOutlet weak var title9: UILabel!
    @IBOutlet weak var title10: UILabel!
    
    // 10개의 탭에 들어가는 내 가게 한마디 라벨들
    @IBOutlet weak var oneText1: UILabel!
    @IBOutlet weak var oneText2: UILabel!
    @IBOutlet weak var oneText3: UILabel!
    @IBOutlet weak var oneText4: UILabel!
    @IBOutlet weak var oneText5: UILabel!
    @IBOutlet weak var oneText6: UILabel!
    @IBOutlet weak var oneText7: UILabel!
    @IBOutlet weak var oneText8: UILabel!
    @IBOutlet weak var oneText9: UILabel!
    @IBOutlet weak var oneText10: UILabel!
    
    // 10개의 탭에 들어가는 이미지 라벨들
    @IBOutlet weak var oneImageView: UIImageView!
    @IBOutlet weak var twoImageView: UIImageView!
    @IBOutlet weak var threeImageView: UIImageView!
    @IBOutlet weak var fourImageView: UIImageView!
    @IBOutlet weak var fiveImageVIew: UIImageView!
    @IBOutlet weak var sixImageView: UIImageView!
    @IBOutlet weak var sevenImageView: UIImageView!
    @IBOutlet weak var eightImageView: UIImageView!
    @IBOutlet weak var nineImageView: UIImageView!
    @IBOutlet weak var tenImageView: UIImageView!
    
    // 거리와 필터 버튼
    @IBOutlet weak var distanceButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    // 주소1을 담기 위한 배열
    var addr1: [String] = []
    // 주소2를 담기 위한 배열
    var addr2: [String] = []
    // 전화번호를 담기 위한 배열
    var phoneNumber: [String] = []
    // 테마를 담기 위한 배열
    var thema: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        distanceButton.layer.cornerRadius = 10
        
        filterButton.layer.cornerRadius = 10
        filterButton.layer.borderColor = UIColor.gray.cgColor
        filterButton.layer.borderWidth = 1
        
        // TastePlaceRequest에서 정의한 getTastePlaceData()를 호출
        TastePlaceRequest().getTastePlaceData(self)
        
        // 네이버 검색 API 호출 (용산구맛집)
        requestAPIToNaver(queryValue: "서울파스타맛집")
        
    }
    
    // 10개의 가게 탭 중 1번째
    @IBAction func oneButton(_ sender: UIButton) {
        
        // 뷰컨 생성
        let detailVC = (self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")) as! DetailViewController
        
        detailVC.placetitle = title1.text!
        detailVC.onetext = oneText1.text!
        detailVC.addr1 = addr1[0]
        detailVC.addr2 = addr2[0]
        detailVC.phonenumber = phoneNumber[0]
        detailVC.thema = thema[0]
        
        // 네이버 검색 API를 호출하고 그 결과를 담은 배열 items를 item에 선언
        let item = dataManager.shared.searchResult?.items
        
        // item에 바로 접근하는 것은 오류 발생으로 if let으로 Iitem에 다시 선언
        if let Iitem = item {
            
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem = URL(string: Iitem[0].thumbnail)
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem2 = URL(string: Iitem[1].thumbnail)
            
            detailVC.detailoneImage = IIitem!
            detailVC.detailtwoImage = IIitem2!
        }
        
        detailVC.modalPresentationStyle = .fullScreen
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    // 10개의 가게 탭 중 2번째 (이하동문)
    @IBAction func twoButton(_ sender: UIButton) {
        
        let detailVC = (self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")) as! DetailViewController
        
        detailVC.placetitle = title2.text!
        detailVC.onetext = oneText2.text!
        detailVC.addr1 = addr1[1]
        detailVC.addr2 = addr2[1]
        detailVC.phonenumber = phoneNumber[1]
        detailVC.thema = thema[1]
        detailVC.modalPresentationStyle = .fullScreen
        
        // 네이버 검색 API를 호출하고 그 결과를 담은 배열 items를 item에 선언
        let item = dataManager.shared.searchResult?.items
        
        // item에 바로 접근하는 것은 오류 발생으로 if let으로 Iitem에 다시 선언
        if let Iitem = item {
            
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem = URL(string: Iitem[1].thumbnail)
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem2 = URL(string: Iitem[2].thumbnail)
            
            detailVC.detailoneImage = IIitem!
            detailVC.detailtwoImage = IIitem2!
        }
        
        detailVC.modalPresentationStyle = .fullScreen
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    // 10개의 가게 탭 중 3번째 (이하동문)
    @IBAction func threeButton(_ sender: UIButton) {
        
        let detailVC = (self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")) as! DetailViewController
        
        detailVC.placetitle = title3.text!
        detailVC.onetext = oneText3.text!
        detailVC.addr1 = addr1[2]
        detailVC.addr2 = addr2[2]
        detailVC.phonenumber = phoneNumber[2]
        detailVC.thema = thema[2]
        
        // 네이버 검색 API를 호출하고 그 결과를 담은 배열 items를 item에 선언
        let item = dataManager.shared.searchResult?.items
        
        // item에 바로 접근하는 것은 오류 발생으로 if let으로 Iitem에 다시 선언
        if let Iitem = item {
            
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem = URL(string: Iitem[2].thumbnail)
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem2 = URL(string: Iitem[3].thumbnail)
            
            detailVC.detailoneImage = IIitem!
            detailVC.detailtwoImage = IIitem2!
        }
        
        detailVC.modalPresentationStyle = .fullScreen
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    // 10개의 가게 탭 중 4번째 (이하동문)
    @IBAction func fourButton(_ sender: UIButton) {
        
        let detailVC = (self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")) as! DetailViewController
        
        detailVC.placetitle = title4.text!
        detailVC.onetext = oneText4.text!
        detailVC.addr1 = addr1[3]
        detailVC.addr2 = addr2[3]
        detailVC.phonenumber = phoneNumber[3]
        detailVC.thema = thema[3]
        
        // 네이버 검색 API를 호출하고 그 결과를 담은 배열 items를 item에 선언
        let item = dataManager.shared.searchResult?.items
        
        // item에 바로 접근하는 것은 오류 발생으로 if let으로 Iitem에 다시 선언
        if let Iitem = item {
            
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem = URL(string: Iitem[3].thumbnail)
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem2 = URL(string: Iitem[4].thumbnail)
            
            detailVC.detailoneImage = IIitem!
            detailVC.detailtwoImage = IIitem2!
        }
        
        detailVC.modalPresentationStyle = .fullScreen
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    // 10개의 가게 탭 중 5번째 (이하동문)
    @IBAction func fiveButton(_ sender: UIButton) {
        
        let detailVC = (self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")) as! DetailViewController
        
        detailVC.placetitle = title5.text!
        detailVC.onetext = oneText5.text!
        detailVC.addr1 = addr1[4]
        detailVC.addr2 = addr2[4]
        detailVC.phonenumber = phoneNumber[4]
        detailVC.thema = thema[4]
        
        // 네이버 검색 API를 호출하고 그 결과를 담은 배열 items를 item에 선언
        let item = dataManager.shared.searchResult?.items
        
        // item에 바로 접근하는 것은 오류 발생으로 if let으로 Iitem에 다시 선언
        if let Iitem = item {
            
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem = URL(string: Iitem[4].thumbnail)
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem2 = URL(string: Iitem[5].thumbnail)
            
            detailVC.detailoneImage = IIitem!
            detailVC.detailtwoImage = IIitem2!
        }
        
        detailVC.modalPresentationStyle = .fullScreen
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    // 10개의 가게 탭 중 6번째 (이하동문)
    @IBAction func sixButton(_ sender: UIButton) {
        
        let detailVC = (self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")) as! DetailViewController
        
        detailVC.placetitle = title6.text!
        detailVC.onetext = oneText6.text!
        detailVC.addr1 = addr1[5]
        detailVC.addr2 = addr2[5]
        detailVC.phonenumber = phoneNumber[5]
        detailVC.thema = thema[5]
        
        // 네이버 검색 API를 호출하고 그 결과를 담은 배열 items를 item에 선언
        let item = dataManager.shared.searchResult?.items
        
        // item에 바로 접근하는 것은 오류 발생으로 if let으로 Iitem에 다시 선언
        if let Iitem = item {
            
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem = URL(string: Iitem[5].thumbnail)
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem2 = URL(string: Iitem[6].thumbnail)
            
            detailVC.detailoneImage = IIitem!
            detailVC.detailtwoImage = IIitem2!
        }
        
        detailVC.modalPresentationStyle = .fullScreen
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    // 10개의 가게 탭 중 7번째 (이하동문)
    @IBAction func sevenButton(_ sender: UIButton) {
        
        let detailVC = (self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")) as! DetailViewController
        
        detailVC.placetitle = title7.text!
        detailVC.onetext = oneText7.text!
        detailVC.addr1 = addr1[6]
        detailVC.addr2 = addr2[6]
        detailVC.phonenumber = phoneNumber[6]
        detailVC.thema = thema[6]
        
        // 네이버 검색 API를 호출하고 그 결과를 담은 배열 items를 item에 선언
        let item = dataManager.shared.searchResult?.items
        
        // item에 바로 접근하는 것은 오류 발생으로 if let으로 Iitem에 다시 선언
        if let Iitem = item {
            
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem = URL(string: Iitem[6].thumbnail)
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem2 = URL(string: Iitem[7].thumbnail)
            
            detailVC.detailoneImage = IIitem!
            detailVC.detailtwoImage = IIitem2!
        }
        
        detailVC.modalPresentationStyle = .fullScreen
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    // 10개의 가게 탭 중 8번째 (이하동문)
    @IBAction func eightButton(_ sender: UIButton) {
        
        let detailVC = (self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")) as! DetailViewController
        
        detailVC.placetitle = title8.text!
        detailVC.onetext = oneText8.text!
        detailVC.addr1 = addr1[7]
        detailVC.addr2 = addr2[7]
        detailVC.phonenumber = phoneNumber[7]
        detailVC.thema = thema[7]
        
        // 네이버 검색 API를 호출하고 그 결과를 담은 배열 items를 item에 선언
        let item = dataManager.shared.searchResult?.items
        
        // item에 바로 접근하는 것은 오류 발생으로 if let으로 Iitem에 다시 선언
        if let Iitem = item {
            
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem = URL(string: Iitem[7].thumbnail)
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem2 = URL(string: Iitem[8].thumbnail)
            
            detailVC.detailoneImage = IIitem!
            detailVC.detailtwoImage = IIitem2!
        }
        
        detailVC.modalPresentationStyle = .fullScreen
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    // 10개의 가게 탭 중 9번째 (이하동문)
    @IBAction func nineButton(_ sender: UIButton) {
        
        let detailVC = (self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")) as! DetailViewController
        
        detailVC.placetitle = title9.text!
        detailVC.onetext = oneText9.text!
        detailVC.addr1 = addr1[8]
        detailVC.addr2 = addr2[8]
        detailVC.phonenumber = phoneNumber[8]
        detailVC.thema = thema[8]
        
        // 네이버 검색 API를 호출하고 그 결과를 담은 배열 items를 item에 선언
        let item = dataManager.shared.searchResult?.items
        
        // item에 바로 접근하는 것은 오류 발생으로 if let으로 Iitem에 다시 선언
        if let Iitem = item {
            
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem = URL(string: Iitem[8].thumbnail)
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem2 = URL(string: Iitem[9].thumbnail)
            
            detailVC.detailoneImage = IIitem!
            detailVC.detailtwoImage = IIitem2!
        }
        
        detailVC.modalPresentationStyle = .fullScreen
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    // 10개의 가게 탭 중 10번째 (이하동문)
    @IBAction func tenButton(_ sender: UIButton) {
        
        let detailVC = (self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")) as! DetailViewController
        
        detailVC.placetitle = title10.text!
        detailVC.onetext = oneText10.text!
        detailVC.addr1 = addr1[9]
        detailVC.addr2 = addr2[9]
        detailVC.phonenumber = phoneNumber[9]
        detailVC.thema = thema[9]
        
        // 네이버 검색 API를 호출하고 그 결과를 담은 배열 items를 item에 선언
        let item = dataManager.shared.searchResult?.items
        
        // item에 바로 접근하는 것은 오류 발생으로 if let으로 Iitem에 다시 선언
        if let Iitem = item {
            
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem = URL(string: Iitem[9].thumbnail)
            // Iiem의 0번째 배열 썸네일 이미지 URL을 IIitem에 저장
            let IIitem2 = URL(string: Iitem[1].thumbnail)
            
            detailVC.detailoneImage = IIitem!
            detailVC.detailtwoImage = IIitem2!
        }
        
        detailVC.modalPresentationStyle = .fullScreen
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    func urlTaskDone() {
        
        // 네이버 검색 API를 호출하고 그 결과를 담은 배열 items를 item에 선언
        let item = dataManager.shared.searchResult?.items
        
        // item에 바로 접근하는 것은 오류 발생으로 if let으로 Iitem에 다시 선언
        if let Iitem = item {
            
            // 10개의 상수에 각각의 이미지 url 전송
            let IIitem = URL(string: Iitem[0].thumbnail)
            let IIitem2 = URL(string: Iitem[1].thumbnail)
            let IIitem3 = URL(string: Iitem[2].thumbnail)
            let IIitem4 = URL(string: Iitem[3].thumbnail)
            let IIitem5 = URL(string: Iitem[4].thumbnail)
            let IIitem6 = URL(string: Iitem[5].thumbnail)
            let IIitem7 = URL(string: Iitem[6].thumbnail)
            let IIitem8 = URL(string: Iitem[7].thumbnail)
            let IIitem9 = URL(string: Iitem[8].thumbnail)
            let IIitem10 = URL(string: Iitem[9].thumbnail)
            
            // 10개의 탭 이미지에 이미지 로드
            oneImageView.load(url: IIitem!)
            twoImageView.load(url: IIitem2!)
            threeImageView.load(url: IIitem3!)
            fourImageView.load(url: IIitem4!)
            fiveImageVIew.load(url: IIitem5!)
            sixImageView.load(url: IIitem6!)
            sevenImageView.load(url: IIitem7!)
            eightImageView.load(url: IIitem8!)
            nineImageView.load(url: IIitem9!)
            tenImageView.load(url: IIitem10!)
        }
        
    }
    
    // 네이버 검색 API 함수
    func requestAPIToNaver(queryValue: String) {
        
        // 발급받은 Client ID
        let clientID: String = "IIMgVJXN7LIZskwHxSql"
        
        // 발급받은 Client Secreat
        let clientKEY: String = "Mgl2Wx45OJ"
        
        let query: String  = "https://openapi.naver.com/v1/search/image.json?query=\(queryValue)"
        let encodedQuery: String = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let queryURL: URL = URL(string: encodedQuery)!
        
        var requestURL = URLRequest(url: queryURL)
        requestURL.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        requestURL.addValue(clientKEY, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        let task = URLSession.shared.dataTask(with: requestURL) { data, response, error in
            guard error == nil else { print(error!); return }
            guard let data = data else { print(error!); return }
            
            do {
                let searchInfo: Welcome = try self.jsconDecoder.decode(Welcome.self, from: data)
                dataManager.shared.searchResult = searchInfo
                print("실행 됨")
                self.urlTaskDone()
                
            } catch {
                print("실행 안됨")
                print(fatalError())
            }
        }
        task.resume()
    }
    
    
}


//MARK: - 공공 데이터포탈 용산구 맛집 API
extension FindViewController {
    
    // TastePlaceRequest에 호출되는 함수
    func didSuccess(_ response: TastePlaceResponse) {
        
        // FindView에서 업소명을 바로 보여주기 위해 라벨.text에 입력
        title1.text = response.data[0].업소명
        title2.text = response.data[1].업소명
        title3.text = response.data[2].업소명
        title4.text = response.data[3].업소명
        title5.text = response.data[4].업소명
        title6.text = response.data[5].업소명
        title7.text = response.data[6].업소명
        title8.text = response.data[7].업소명
        title9.text = response.data[8].업소명
        title10.text = response.data[9].업소명
        
        // FindView에서 우리가게 한마디를 바로 보여주기 위해 라벨.text에 입력
        oneText1.text = response.data[0].사장님이자랑하는내가게한마디
        oneText2.text = response.data[1].사장님이자랑하는내가게한마디
        oneText3.text = response.data[2].사장님이자랑하는내가게한마디
        oneText4.text = response.data[3].사장님이자랑하는내가게한마디
        oneText5.text = response.data[4].사장님이자랑하는내가게한마디
        oneText6.text = response.data[5].사장님이자랑하는내가게한마디
        oneText7.text = response.data[6].사장님이자랑하는내가게한마디
        oneText8.text = response.data[7].사장님이자랑하는내가게한마디
        oneText9.text = response.data[8].사장님이자랑하는내가게한마디
        oneText10.text = response.data[9].사장님이자랑하는내가게한마디
        
        // 음식(테마)는 DetailView에서 보여주므로 배열에 값만 추가
        thema.append(response.data[0].thema)
        thema.append(response.data[1].thema)
        thema.append(response.data[2].thema)
        thema.append(response.data[3].thema)
        thema.append(response.data[4].thema)
        thema.append(response.data[5].thema)
        thema.append(response.data[6].thema)
        thema.append(response.data[7].thema)
        thema.append(response.data[8].thema)
        thema.append(response.data[9].thema)
        
        // 전화번호도 DetailView에서 보여주므로 배열에 값만 추가
        phoneNumber.append(response.data[0].전화번호!)
        phoneNumber.append(response.data[1].전화번호!)
        phoneNumber.append(response.data[2].전화번호!)
        phoneNumber.append("없음")
        phoneNumber.append(response.data[4].전화번호!)
        phoneNumber.append(response.data[5].전화번호!)
        phoneNumber.append(response.data[6].전화번호!)
        phoneNumber.append(response.data[7].전화번호!)
        phoneNumber.append(response.data[8].전화번호!)
        phoneNumber.append(response.data[9].전화번호!)
        
        // 주소1도 DetailView에서 보여주므로 배열에 값만 추가
        addr1.append(response.data[0].주소1)
        addr1.append(response.data[1].주소1)
        addr1.append(response.data[2].주소1)
        addr1.append(response.data[3].주소1)
        addr1.append(response.data[4].주소1)
        addr1.append(response.data[5].주소1)
        addr1.append(response.data[6].주소1)
        addr1.append(response.data[7].주소1)
        addr1.append(response.data[8].주소1)
        addr1.append(response.data[9].주소1)
        
        // 주소2도 DetailView에서 보여주므로 배열에 값만 추가
        addr2.append(response.data[0].주소2)
        addr2.append(response.data[1].주소2)
        addr2.append(response.data[2].주소2)
        addr2.append(response.data[3].주소2)
        addr2.append(response.data[4].주소2)
        addr2.append(response.data[5].주소2)
        addr2.append(response.data[6].주소2)
        addr2.append(response.data[7].주소2)
        addr2.append(response.data[8].주소2)
        addr2.append(response.data[9].주소2)
        
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
