//
//  Parser.swift
//  API_Clone_Project
//
//  Created by 백래훈 on 2022/03/08.
//

import Foundation
import Alamofire

struct Parser {
    //API에서 넘어온 데이터를 담을 저장소
    private var storage: [data] = []
    
    func getTastePlaceData() {
        
        let url = "https://api.odcloud.kr/api/15066516/v1/uddi:507e01f5-76ec-42ff-96a5-8b6ff9ce554e?page=1&perPage=10&serviceKey=X2Pcet3qDmcYU21iFqAMpqoHE%2BUkJLCB2NfCdoUt%2F9SZTTh6%2BP1o1R%2BZ%2F74jxXS%2BvYGRJUWd2Uu1yjxPyVgOCw%3D%3D"
        
        let params: Parameters = [
            "page" : "1",
            "perPage" : "10",
            "serviceKey" : "X2Pcet3qDmcYU21iFqAMpqoHE%2BUkJLCB2NfCdoUt%2F9SZTTh6%2BP1o1R%2BZ%2F74jxXS%2BvYGRJUWd2Uu1yjxPyVgOCw%3D%3D"
        ]
        
        // HTTP Method: GET
        AF.request(url,
                   method: .get,
                   parameters: params,
                   headers: nil)
            .responseDecodable(of: TastePlaceResponse.self) { response in
                
                switch response.result {
                case .success(let response):
                    print("DEBUG>> TastePlace Response \(response)")
                    print(response)
                    
                    
                case .failure(let error):
                    print("DEBUG>> TastePlace Get Error : \(error)")
                    
                }
            }
    }
}
