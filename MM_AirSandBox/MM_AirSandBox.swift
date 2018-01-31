//
//  MM_AirSandBox.swift
//  MM_AirSandBox
//
//  Created by mm on 2018/1/27.
//  Copyright © 2018年 mm. All rights reserved.
//

import UIKit

class MM_AirSandBox: NSObject {
    //MARK:- DDD
    //MARK:- 单利
    static let sharedInstance = MM_AirSandBox()
    private override init(){}//重写init方法，因为继承自其它类，init方法也要继承其他类
    //TODO: 测试TODO
    init(Fuck:String){
        super.init()
        print("OKOKOKOKO")
    }
    
}
