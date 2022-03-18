//
//  TasteTableViewCell.swift
//  API_Clone_Project
//
//  Created by 백래훈 on 2022/03/08.
//

import UIKit

class TasteTableViewCell: UITableViewCell {

    static var identifier = "TasteTableViewCell"
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellAdd1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    public func setUpData(_ data1: data) {
        
        let title = data1.업소명
        let add1 = data1.주소1
        
        cellTitle.text = title
        cellAdd1.text = add1
        
    }
    
}
