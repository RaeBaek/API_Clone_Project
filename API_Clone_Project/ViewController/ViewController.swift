//
//  ViewController.swift
//  API_Clone_Project
//
//  Created by 백래훈 on 2022/03/06.
//

import UIKit
import NaverThirdPartyLogin
import Alamofire

// 네이버 아이디로 로그인한 내 정보를 저장하기 위한 userInfo 싱글톤!!!!
class userInfo {
    
    static let shared = userInfo()
    var name: String?
    var email: String?
    var age: String?
    var id: String?
    
    private init() { }
}

class ViewController: UIViewController {
    
    // 네이버 아이디로 로그인 (네아로)
    let naverLoginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    var Name: String = ""
    var Email: String = ""
    var Age: String = ""
    var Id: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네아로를 실행시키는 컨트롤러는 자기 자신
        naverLoginInstance?.delegate = self
        
        print("곧 뷰는 사라질 것")
        
    }
    
    //로그인에 성공한 경우 호출
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        
        print("네이버 로그인 성공!")
        self.naverLoginPaser()
        
        // 네이버 로그인 파서가 정상적으로 수행되면 현재 뷰는 dismiss
        self.dismiss(animated: true, completion: nil)
        print("뷰1 사라짐")
    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        naverLoginInstance?.accessToken
        
    }
    // 로그라웃을 할 경우 호출
    func oauth20ConnectionDidFinishDeleteToken() {
        print("네이버 로그아웃")
        
    }
    // 에러 발생 시 호출
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("에러 = \(error.localizedDescription)")
        
    }
    
    // 로그인 탭을 누르면
    @IBAction func loginTap(_ sender: UIButton) {
        naverLoginInstance?.requestThirdPartyLogin()
    }
    
    // 로그아웃 탭을 누르면
    @IBAction func logoutTap(_ sender: UIButton) {
        naverLoginInstance?.requestDeleteToken()
    }
    
    // 네이버 로그인을 수행하는 파서
    private func naverLoginPaser() {
        
        guard let accessToken = naverLoginInstance?.isValidAccessTokenExpireTimeNow() else { return }
        
        if !accessToken {
            return
            
        }
        guard let tokenType = naverLoginInstance?.tokenType else { return }
        guard let accessToken = naverLoginInstance?.accessToken else { return }
        
        let requestUrl = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: requestUrl)!
        
        let authorization = "\(tokenType) \(accessToken)"
        
        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
        
        req.responseJSON { [self] response in
            
            guard let result = response.value as? [String: Any] else { return }
            guard let object = result["response"] as? [String: Any] else { return }
            
            guard let name = object["name"] as? String else { return }
            guard let email = object["email"] as? String else { return }
            guard let id = object["id"] as? String else {return}
            guard let age = object["age"] as? String else {return}
            
            print("로그인 시도중... 정보 출력!")
            print("이름 : \(name)")
            print("이메일 : \(email)")
            print("아이디 : \(id)")
            print("나이대 : \(age)")
            
            // 로그인이 안정적으로 수행이되면 탭바를 present
            let tabbarVC = (self.storyboard?.instantiateViewController(withIdentifier: "TabbarViewController")) as! TabbarViewController
            tabbarVC.modalPresentationStyle = .fullScreen
            
            // 로그인된 정보를 최상단 싱글톤에 입력해주고 어느뷰에서도 접근할 수 있게 만들어줌.
            let currentUser = userInfo.shared
            currentUser.name = name
            currentUser.email = email
            currentUser.id = id
            currentUser.age = age
            
            self.present(tabbarVC, animated: true, completion: nil)
        }
    }
}

extension ViewController : NaverThirdPartyLoginConnectionDelegate {
    
}
