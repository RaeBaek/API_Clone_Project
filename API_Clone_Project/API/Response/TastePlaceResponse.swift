//
//  TastePlaceResponse.swift
//  API_Clone_Project
//
//  Created by 백래훈 on 2022/03/07.
//

import Foundation

struct TastePlaceResponse: Decodable {

    var currentCount: Int
    var data: [data]
    var matchCount: Int
    var page: Int
    var perPage: Int
    var totalCount: Int

}

struct data: Decodable {

    var 경도: String
    var 사장님이자랑하는내가게한마디: String
    var 업소명: String
    var 위도: String
    var 전화번호: String?
    var kind : Int
    var 주소1: String
    var 주소2: String
    var 메인요리: String?
    var thema: String

    enum CodingKeys: String, CodingKey {
        case 경도
        case 사장님이자랑하는내가게한마디
        case 업소명
        case 위도
        case 전화번호
        case kind = "종류(01한식,02중식,03일식,04양식,05기타외국음식,06디저트/카페)"
        case 주소1
        case 주소2
        case 메인요리
        case thema = "테마(국가)"

    }
}

// 네이버 이미지 API 호출 메소드
class dataManager {
    static let shared : dataManager = dataManager()
    var searchResult : Welcome?
    
    private init() {
        
    }
}

// MARK: - Welcome
struct Welcome: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title: String
    let link: String
    let thumbnail: String
    let sizeheight, sizewidth: String
}


//import Foundation
//
//// MARK: - TastePlaceResponse
//struct TastePlaceResponse: Codable {
//    let currentCount: Int
//    let data: [data]
//    let matchCount, page, perPage, totalCount: Int
//}
//
//// MARK: - data
//struct data: Codable {
//    let 경도, 사장님이자랑하는내가게한마디, 업소명, 위도: String
//    let 전화번호: String?
//    let 종류01한식02중식03일식04양식05기타외국음식06디저트카페: Int
//    let 주소1, 주소2, 주요요리, 테마국가: String
//
//    enum CodingKeys: String, CodingKey {
//        case 경도, 사장님이자랑하는내가게한마디, 업소명, 위도, 전화번호
//        case 종류01한식02중식03일식04양식05기타외국음식06디저트카페 = "종류(01한식,02중식,03일식,04양식,05기타외국음식,06디저트/카페)"
//        case 주소1, 주소2, 주요요리
//        case 테마국가 = "테마(국가)"
//    }
//}
