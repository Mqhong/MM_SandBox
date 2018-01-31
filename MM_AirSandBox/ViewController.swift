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
        let _ = FFMM(heigt: <#T##Int#>, width: <#T##Int#>)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

struct MMFuck{
    var width = 0,height = 0
}
struct FFMM {
    var heigt = 0
    var width = 1
}
