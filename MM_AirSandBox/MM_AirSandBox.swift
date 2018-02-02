//
//  MM_AirSandBox.swift
//  MM_AirSandBox
//
//  Created by mm on 2018/1/27.
//  Copyright © 2018年 mm. All rights reserved.
//

import UIKit


enum MM_FileItemType {
    case MM_FileItemUp
    case MM_FileItemDirectory
    case MM_FileItemFile
}

class MM_FileItem{
    var name = ""
    var path = ""
    var type:MM_FileItemType?
}
class MM_AirSandBox: NSObject {
    //MARK:- DDD
    //MARK:- 单利
    static let sharedInstance = MM_AirSandBox()
    var window:UIWindow = UIWindow()
    var ctrl:MM_AirSandBoxVC = MM_AirSandBoxVC()
    private override init(){}//重写init方法，因为继承自其它类，init方法也要继承其他类
    init(Fuck:String){
        super.init()
        print("OKOKOKOKO~~~")
    }
    
    func enableSwipe() -> Void {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeDetected(gs:)))
        swipeGesture.numberOfTouchesRequired = 1
        swipeGesture.direction = (.left) //这里要添加一个括号啊，不然不起作用，而且坑的是 还不报错 连个警告都不会有
        UIApplication.shared.keyWindow?.addGestureRecognizer(swipeGesture)
    }
    
    @objc func onSwipeDetected(gs:UISwipeGestureRecognizer) -> Void {
        self.showSandboxBrowser()
    }
    
    func showSandboxBrowser() -> Void {
        print("这里是右边滑动调用了这个玩意")
        var keyFrame = UIScreen.main.bounds
        keyFrame.origin.y = keyFrame.origin.y + 64
        keyFrame.size.height = keyFrame.size.height - 64
        let rect = keyFrame.insetBy(dx: 20, dy: 20)
        self.window.frame = rect
        self.window.backgroundColor = UIColor.white
        self.window.layer.borderColor = UIColor(white: 0.2, alpha: 1.0).cgColor
        self.window.layer.borderWidth = 2.0
        self.window.windowLevel = UIWindowLevelStatusBar
        self.window.rootViewController = self.ctrl
        self.window.isHidden = false
    }
}
