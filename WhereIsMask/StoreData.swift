
//
//  StoreData.swift
//  WhereIsMask
//
//  Created by 김동준 on 2020/04/07.
//  Copyright © 2020 김동준. All rights reserved.
//

import Foundation

struct MaskStore {
    init(addr: String,code: String,created_at: String,lat : Double,lng: Double,name : String,remain_stat : String,stock_at : String,type : String){
        self.addr=addr
        self.code=code
        self.created_at=created_at
        self.lat=lat
        self.lng=lng
        self.name=name
        self.remain_stat=remain_stat
        self.stock_at=stock_at
        self.type=type
    }
    
    func printInfo(){
        print("addr : \(addr)  code : \(code)  created_at : \(created_at)  lat : \(lat)  lng : \(lng)  name : \(name)  remain_stat : \(remain_stat)  stock_at : \(stock_at)  type : \(type)")
    }
    
    private var addr: String = "서울특별시 강동구 명일로 176 1층 (둔촌동)"
    private var code: String = "12819522"
    private var created_at: String = "2020/04/07 17:10:00"
    private var lat : Double = 37.5344989
    private var lng: Double = 127.1453145
    private var name : String = "푸르지오진흥약국"
    private var remain_stat : String = "some"
    private var stock_at : String = "2020/04/07 08:12:00"
    private var type : String = "01"
}
