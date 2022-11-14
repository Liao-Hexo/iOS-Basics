//
//  ViewController.swift
//  UITestingProject_Demo
//
//  Created by 廖家龙 on 2022/8/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let rect = CGRect(x: 30, y: 50, width: 200, height: 200)
        let view = UIView(frame: rect)
        view.backgroundColor = .brown
        self.view.addSubview(view)
        
        let btAdd = UIButton(frame: CGRect(x: 30, y: 350, width: 80, height: 30))
        btAdd.backgroundColor = .gray
        btAdd.setTitle("Add", for: .normal)
        btAdd.addTarget(self, action: #selector(ViewController.addView(_:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(btAdd)
        
        let btBack = UIButton(frame: CGRect(x: 120, y: 350, width: 80, height: 30))
        btBack.backgroundColor = .gray
        btBack.setTitle("Switch", for: .normal)
        btBack.addTarget(self, action: #selector(ViewController.bringViewBack(_:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(btBack)
        
        let btRemove = UIButton(frame: CGRect(x: 210, y: 350, width: 80, height: 30))
        btRemove.backgroundColor = .gray
        btRemove.setTitle("Remove", for: .normal)
        btRemove.addTarget(self, action: #selector(ViewController.removeView(_:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(btRemove)
    }
    
    @objc func addView(_:UIButton!) {
        let rect = CGRect(x: 60, y: 90, width: 200, height: 200)
        let view = UIView(frame: rect)
        view.backgroundColor = .purple
        view.tag = 1
        self.view.addSubview(view)
    }
    
    @objc func bringViewBack(_:UIButton!) {
        let view = self.view.viewWithTag(1)
        self.view.sendSubviewToBack(view!)
    }
    
    @objc func removeView(_:UIButton!) {
        let view = self.view.viewWithTag(1)
        view?.removeFromSuperview()
    }


}

