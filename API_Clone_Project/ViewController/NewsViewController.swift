//
//  NewsViewController.swift
//  API_Clone_Project
//
//  Created by 백래훈 on 2022/03/08.
//

import UIKit
import Tabman
import Pageboy

class NewsViewController: TabmanViewController {

    //상단 탭바 라이브러리 Tabman 사용
    private var NewsViewControllers: Array<UIViewController> = []
    
    @IBOutlet weak var nameView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 뷰1
        let vc1 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AllViewController") as! AllViewController
        
        // 뷰2
        let vc2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FollowingViewController") as! FollowingViewController
        
        // 뷰3
        let vc3 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HollicViewController") as! HollicViewController
        
        // 뷰 추가
        NewsViewControllers.append(vc1)
        NewsViewControllers.append(vc2)
        NewsViewControllers.append(vc3)
        
        self.dataSource = self
        
        // Create bar (바 생성)
        let bar = TMBar.ButtonBar()
        
        bar.backgroundView.style = .blur(style: .regular)
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        bar.buttons.customize { (button) in
            button.tintColor = .gray        //선택 안되어있을 때
            button.selectedTintColor = .orange   //선택 되어있을 때
        }
        
        // 인디케이터 조정
        bar.indicator.weight = .light
        bar.indicator.tintColor = .orange
        bar.indicator.overscrollBehavior = .compress
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
        bar.layout.interButtonSpacing = 0 // 버튼 사이 간격
            
        bar.layout.transitionStyle = .snap // Customize
        

        // 뷰에 추가, 내가 원하는 뷰에 넣기 위해 선언했던 tempView 사용
        addBar(bar, dataSource: self, at: .custom(view: nameView, layout: nil))
    }

}


extension NewsViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        //let item = TMBarItem(title: "")
        //item.title = "Page \(index)"
        //item.image = UIImage(named: "image.png")
        // ↑↑ 이미지는 이따가 탭바 형식으로 보여줄 때 사용할 것이니 "이미지가 왜 있지?" 하지말고 넘어가주세요.
        
        //return item
        
        // MARK: - Tab 안 글씨들
        switch index {
        case 0:
            return TMBarItem(title: "전체")
        case 1:
            return TMBarItem(title: "팔로잉")
        case 2:
            return TMBarItem(title: "홀릭")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return NewsViewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        
        return NewsViewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
