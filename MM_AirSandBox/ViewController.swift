//
//  ViewController.swift
//  MM_AirSandBox
//
//  Created by mm on 2018/1/27.
//  Copyright © 2018年 mm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("fuck")
        let _ = MM_AirSandBox.sharedInstance
//        let _ = MM_AirSandBox()
//        let _ = FuckVC()
        let _ = MMFuck(width: 1, height: 2)
//        let _ = FFMM(heigt: <#T##Int#>, width: <#T##Int#>)
        
        tapGestureDemo()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    /**点击手势*/
    func tapGestureDemo() {
        //建立手势识别器
        let gesture = UITapGestureRecognizer(target: self, action: #selector(gestureFFF))
        //附加识别器到视图
//        self.view.addGestureRecognizer(gesture)
        UIApplication.shared.keyWindow?.addGestureRecognizer(gesture)
    }
 
    @objc func gestureFFF() -> Void {
        print("?????")
    }
}

struct MMFuck{
    var width = 0,height = 0
}
struct FFMM {
    var heigt = 0
    var width = 1
}
