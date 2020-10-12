//
//  ViewController.swift
//  WhereIsMask
//
//  Created by 김동준 on 2020/04/07.
//  Copyright © 2020 김동준. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class ViewController: UIViewController {

    let settingMap = SettingMap(lat : 37.533440, lng : 127.146034)
    
    var storeInfoList : Array<MaskStore> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        settingMap.setMap()
    }

}
struct SettingMap{
    let urlString = "https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByGeo/json"
    var storeInfoList2 : Array<MaskStore> = []
    let disposeBag = DisposeBag()
    let lat, lng : Double
    init(lat : Double, lng : Double){
        self.lat = lat
        self.lng = lng
    }
    
    func setMap(){
        var storeInfoList : Array<MaskStore> = []
        URLSession.shared.rx.json(url: URL(string: urlString+"?lat=\(lat)&lng=\(lng)&m=500")!).bind { (any) in
            let json = any as! [String : Any]
            if let store = json["stores"] as? [[String : Any]]{
                for storeIdx in store{
                    let storeInfo : MaskStore = MaskStore(addr: storeIdx["addr"] as! String,
                                                          code: storeIdx["code"] as! String,
                                                          created_at: storeIdx["created_at"] as? String ?? "...",
                                                          lat: storeIdx["lat"] as! Double,
                                                          lng: storeIdx["lng"] as! Double,
                                                          name: storeIdx["name"] as! String,
                                                          remain_stat: storeIdx["remain_stat"] as? String ?? "..." ,
                                                          stock_at: storeIdx["stock_at"] as? String ?? "...",
                                                          type: storeIdx["type"] as? String ?? "...")
                    
                    storeInfoList.append(storeInfo)
                    
                }
            }
            print(storeInfoList.count)
            //SETTING MAP!
        }.disposed(by: disposeBag)
    }
}

