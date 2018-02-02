//
//  MM_AirSandBoxVC.swift
//  MM_AirSandBox
//
//  Created by mm on 2018/2/2.
//  Copyright © 2018年 mm. All rights reserved.
//

import UIKit

class MM_AirSandBoxVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var tableView:UITableView = UITableView()
    var btnCloce:UIButton = UIButton()
    var items:Array<MM_FileItem> = []
    let rootPath:String = NSHomeDirectory()
    let cellIdentifier = "MM_FuckCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareCtrl()
        self.load(targetPath: "")
    }
    
    func prepareCtrl() -> Void {
        self.view.backgroundColor = UIColor.white
        self.btnCloce = UIButton()
        self.view.addSubview(self.btnCloce)
        self.btnCloce.backgroundColor = UIColor(white: 0.2, alpha: 1.0)
        self.btnCloce.setTitle("Close", for: .normal)
        self.btnCloce.setTitleColor(UIColor.white, for: .normal)
        self.btnCloce.addTarget(self, action: #selector(btnCloseClick), for: .touchUpInside)
        
        self.tableView = UITableView()
        self.view.addSubview(self.tableView)
        self.tableView.backgroundColor = UIColor.white
        self.tableView.separatorStyle = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    @objc func btnCloseClick()->Void{
        self.view.window?.isHidden = true;
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let viewWidth = UIScreen.main.bounds.size.width - 2 * 20
        let closeWidth:CGFloat = 60
        let closeHeight:CGFloat = 28
        self.btnCloce.frame = CGRect(x: viewWidth - closeWidth - 4, y: 4, width: closeWidth, height: closeHeight)
        
        var tableFrame = self.view.frame
        tableFrame.origin.y = tableFrame.origin.y + (closeHeight + 4)
        tableFrame.size.height = tableFrame.size.height - (closeHeight + 4)
        self.tableView.frame = tableFrame
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row > self.items.count - 1 {
            return UITableViewCell()
        }
        
        let item:MM_FileItem = self.items[indexPath.row]
        
        
        var fuckCell:UITableViewCell?
        fuckCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if fuckCell == nil {
            fuckCell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        fuckCell?.textLabel?.text = item.name
        return fuckCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > self.items.count - 1 {
            return
        }
        tableView.deselectRow(at: indexPath, animated: false)
        let item:MM_FileItem = self.items[indexPath.row]
        if item.type == .MM_FileItemUp {
            //Swift 中 删除最后一个目录的方法
            let components = item.path.split(separator: "/")
            let head = components.dropLast(1).map(String.init).joined(separator: "/")
            let words = components.count - 1
            let tail = components.dropFirst(words).map(String.init)[0]
            //OC 中删除最后一个目录的方法
            print("head:\(head), tail:\(tail)")
            let nsStr = (item.path as NSString).deletingLastPathComponent as String
            self.load(targetPath: nsStr)
        }
        else if item.type == .MM_FileItemFile{//点击的是文件了 个人去做你想做的事情
            print("这里想分享文件 就分享撒")
            self.sharePath(path: item.path)
        }
        else if item.type == .MM_FileItemDirectory{
            self.load(targetPath: item.path)
        }
    }
    
    func load(targetPath:String) -> Void {
        var targetPath = targetPath
        var files:Array<MM_FileItem> = Array()
        let fm = FileManager.default
        if targetPath.count == 0 || targetPath == self.rootPath{
            //第一次或者返回根目录的时候，不需要返回按钮
            targetPath = self.rootPath
        }
        else{
            //不是根目录，每次进来都要把返回事项添加上
            let file = MM_FileItem()
            file.name = "🔙.."
            file.type = .MM_FileItemUp
            file.path = targetPath
            files.append(file)
        }
        var paths:Array<String> = Array()
        if let fff = try? fm.contentsOfDirectory(atPath: targetPath) {
            paths = fff
        }
        for path in paths {
            if (path as NSString).lastPathComponent.hasPrefix("."){
                print(".com.apple.mobile_container_manager.metadata.plist\t\(path)")//过滤掉这个路径
                continue
            }
            var isDir:ObjCBool = false
            let fullPath = targetPath.appending("/\(path)")
            fm.fileExists(atPath: fullPath, isDirectory: &isDir)
            let file = MM_FileItem()
            file.path = fullPath
            if isDir.boolValue {
                file.type = .MM_FileItemDirectory
                file.name = "📁 \(path)"
            }
            else {
                file.type = .MM_FileItemFile
                file.name = "📄 \(path)"
            }
            files.append(file)
        }
        self.items = files
        self.tableView.reloadData()
    }
    
    func sharePath(path:String) -> Void {
        print("这里实现文件分享功能")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
