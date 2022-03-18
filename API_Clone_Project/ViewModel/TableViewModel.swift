//
//  TableViewModel.swift
//  TableViewProject_1
//
//  Created by 백래훈 on 2022/02/21.
//

import Foundation



//MARK: 2. 데이터모델을 생성한다.
class TableViewModel {
    
    var controller = TastePlaceRequest()
    
    // 2-1. 저장소를 생성한다.
    private var storage: [data] = []
    
    // 2-2. DummyData <-> 앞으로 네트워킹을 배우면 직접 입력이 아닌 네트워크를 통해 받아올 것이다.
    
    
    // 2-3. 몇 개의 데이터가 있는지 -> numberOfRowAtInSection
    public var count: Int {
        return storage.count
    }
    
    // 2-4. 해당 인덱스의 데이터를 리턴한다 -> CellForRowAt
    public func itemAt(_ row: Int) -> data {
        return self.storage[row]
    }
    
}

//MARK: - API
extension TableViewModel {
    
    func didSave(_ response: TastePlaceResponse) {

        storage = [
            data(경도: response.data[0].경도, 사장님이자랑하는내가게한마디: response.data[0].사장님이자랑하는내가게한마디, 업소명: response.data[0].업소명, 위도: response.data[0].위도, 전화번호: response.data[0].전화번호, kind: response.data[0].kind, 주소1: response.data[0].주소1, 주소2: response.data[0].주소2, 메인요리: response.data[0].메인요리, thema: response.data[0].thema)

        ]
    }
}

