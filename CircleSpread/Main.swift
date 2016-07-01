//
//  Main.swift
//  test
//
//  Created by Bing on 7/1/16.
//  Copyright © 2016 Bing. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.mainScreen().bounds.size.width
let screenHeight = UIScreen.mainScreen().bounds.size.height

class Main: UIViewController
{
    var addBtn: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // 背景图
        let background = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        background.image = UIImage(named: "first")
        self.view.addSubview(background)
        
        // 增加按钮
        addBtn = UIButton(frame: CGRect(x: screenWidth - 100, y: screenHeight - 100, width: 50, height: 50))
        addBtn.backgroundColor = UIColor.whiteColor()
        addBtn.setImage(UIImage(named: "add")?.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
        addBtn.tintColor = UIColor.redColor()
        addBtn.layer.masksToBounds = true
        addBtn.layer.cornerRadius = 25
        addBtn.addTarget(self, action: .addBtnClick, forControlEvents: .TouchUpInside)
        self.view.addSubview(addBtn)
        
        // 给增加按钮添加拖拽手势
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: .panGesture)
        self.addBtn.addGestureRecognizer(panGestureRecognizer)
    }
    
    // 点击增加按钮
    func addBtnClick()
    {
        let animator = XWCircleSpreadAnimator.xw_animatorWithStartCenter(self.addBtn.center, radius: 25)
        animator.toDuration = 0.5
        animator.backDuration = 0.5
        animator.needInteractiveTimer = true
        let toVC = Second()
        self.xw_presentViewController(toVC, withAnimator: animator)
    }
    
    func panGesture(panGesture: UIPanGestureRecognizer)
    {
        var point = panGesture.locationInView(self.view)
        if point.x <= 25
        {
            point.x = 25
        }
        if point.x >= screenWidth - 25
        {
            point.x = screenWidth - 25
        }
        if point.y <= 25
        {
            point.y = 25
        }
        if point.y >= screenHeight - 25
        {
            point.y = screenHeight - 25
        }
        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.55, initialSpringVelocity: 1.2 / 0.55, options: .AllowAnimatedContent, animations:
            {
                self.addBtn.center = point
            }, completion: nil)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

private extension Selector
{
    static let addBtnClick = #selector(Main.addBtnClick)
    static let panGesture = #selector(Main.panGesture(_:))
}
