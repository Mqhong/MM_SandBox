//
//  ViewController.swift
//  MM_AirSandBox
//
//  Created by mm on 2018/1/27.
//  Copyright © 2018年 mm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let lbl = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("fuck")
        lbl.text = "右划打开文件系统"
        lbl.textColor = UIColor.red
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .center
        self.view.addSubview(lbl)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let lblframe = self.view.frame.insetBy(dx: 20, dy: 20)
        lbl.frame = lblframe
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
