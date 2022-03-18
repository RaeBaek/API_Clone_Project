//
//  TasteCollectionViewCell.swift
//  API_Clone_Project
//
//  Created by 백래훈 on 2022/03/08.
//

import UIKit

class TasteCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellAdd1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}


//MARK: - API
extension TasteCollectionViewCell {
    
    func didSuccess(_ response: TastePlaceResponse) {
        
        let cellTitle = response.data[0].업소명
        let cellAdd1 = response.data[0].주소1
        
        self.cellTitle.text = cellTitle
        self.cellAdd1.text = cellAdd1
    }
}
