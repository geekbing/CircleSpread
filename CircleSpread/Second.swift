//
//  Second.swift
//  test
//
//  Created by Bing on 7/1/16.
//  Copyright © 2016 Bing. All rights reserved.
//


import UIKit

class Second: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        // 背景图
        let background = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        background.image = UIImage(named: "second")
        self.view.addSubview(background)
        
        // 返回按钮
        let backBtn = UIButton(frame: CGRect(x: 10, y: 20, width: 50, height: 50))
        backBtn.setImage(UIImage(named: "back")?.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
        backBtn.tintColor = UIColor.whiteColor()
        backBtn.addTarget(self, action: .backBtnClick, forControlEvents: .TouchUpInside)
        self.view.addSubview(backBtn)
        
        // 避免循环引用
        weak var weakSelf = self
        self.xw_registerBackInteractiveTransitionWithDirection(.Down, transitonBlock: { (startPoint) in
            weakSelf!.dismissViewControllerAnimated(true, completion: nil)
        }, edgeSpacing: 0)
    }
    
    deinit
    {
        print("Second")
    }
    
    // 点击返回按钮
    func backBtnClick()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

private extension Selector
{
    static let backBtnClick = #selector(Second.backBtnClick)
}

